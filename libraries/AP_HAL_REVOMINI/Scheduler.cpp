#include "Scheduler.h"

#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>

#include "Semaphores.h"
#include <timer.h>

#include <AP_Notify/AP_Notify.h>
#include <AP_Math/AP_Math.h>

#include <systick.h>

#include "GPIO.h"

#include <usb.h>



/*

stats for Copter

Scheduler stats:

  % of full time: 26.79  Efficiency 0.924 max loop time 2904 
delay times: in main 85.83 including in semaphore  0.00  in timer  7.71 in isr  0.00 

Task times:
task 0x809966920008114 tim      0.0 int 0.000% tot 0.0000% mean time   1.0 max time 1
task 0x809A8252000811C tim    493.0 int 3.680% tot 0.9859% mean time   9.9 max time 22
task 0x809376D20007FE0 tim      2.6 int 0.019% tot 0.0051% mean time   1.0 max time 3
task 0x804667520009F68 tim   2167.8 int 16.180% tot 4.3357% mean time 436.9 max time 452
task 0x8048D7D2000A480 tim   2996.4 int 22.365% tot 5.9929% mean time 852.0 max time 864
task 0x80509812000A4E0 tim   7738.1 int 57.756% tot 15.4763% mean time 172.4 max time 2462

*/

using namespace REVOMINI;

extern const AP_HAL::HAL& hal;

AP_HAL::Proc REVOMINIScheduler::_failsafe = NULL;
volatile bool REVOMINIScheduler::_timer_suspended = false;
volatile bool REVOMINIScheduler::_timer_event_missed = false;
volatile bool REVOMINIScheduler::_in_timer_proc = false;

revo_timer REVOMINIScheduler::_timers[REVOMINI_SCHEDULER_MAX_SHEDULED_PROCS] IN_CCM;
uint8_t    REVOMINIScheduler::_num_timers = 0;

uint8_t    REVOMINIScheduler::_num_io_proc=0;

AP_HAL::MemberProc REVOMINIScheduler::IMU_callback = 0;
#ifdef SHED_PROF
    uint32_t REVOMINIScheduler::_IMU_maxtime=0;    // max exec time
    uint32_t REVOMINIScheduler::_IMU_count=0;     // number of calls
    uint64_t REVOMINIScheduler::_IMU_fulltime=0;  // full consumed time to calc mean
#endif

AP_HAL::Proc REVOMINIScheduler::_delay_cb=NULL;
uint16_t REVOMINIScheduler::_min_delay_cb_ms=0;

uint32_t REVOMINIScheduler::timer5_ovf_cnt=0;

bool REVOMINIScheduler::_initialized=false;

// Main task and run queue
REVOMINIScheduler::task_t REVOMINIScheduler::s_main = {
  &REVOMINIScheduler::s_main,
  &REVOMINIScheduler::s_main,
  { 0 },
  NULL,
  0,    // id
#ifdef MTASK_PROF
    0, // task_ticks
    0, // task_start
    0, // task_time
    0, // task_delay
#endif
};

// Reference running task
REVOMINIScheduler::task_t* REVOMINIScheduler::s_running = &REVOMINIScheduler::s_main;

// Initial top stack for task allocation
size_t REVOMINIScheduler::s_top = MAIN_STACK_SIZE;

uint16_t REVOMINIScheduler::task_n=0;

#ifdef SHED_PROF
uint64_t REVOMINIScheduler::shed_time = 0;
bool     REVOMINIScheduler::flag_10s = false;
uint64_t REVOMINIScheduler::task_time = 0;
uint64_t REVOMINIScheduler::delay_time = 0;
uint64_t REVOMINIScheduler::delay_int_time = 0;
uint32_t REVOMINIScheduler::max_loop_time=0;
#endif


#ifdef MTASK_PROF
 uint64_t REVOMINIScheduler::yield_time=0;
 uint32_t REVOMINIScheduler::yield_count=0;
#endif


REVOMINIScheduler::REVOMINIScheduler()
{

#ifdef MTASK_PROF
    s_main.start=_micros();
#endif

}



void REVOMINIScheduler::init()
{

    memset(_timers,     0, sizeof(_timers) );
//    memset(_io_process, 0, sizeof(_io_process));

    uint32_t period    = (2000000UL / SHED_FREQ) - 1; 
    
                // dev    period   freq, kHz
    configTimeBase(TIMER7, period, 2000);       //2MHz 0.5us ticks
    timer_attach_interrupt(TIMER7, TIMER_UPDATE_INTERRUPT, _timer_isr_event, 14); // low priority
    timer_resume(TIMER7);

// timer5 - 32-bit general timer, unused for other needs
// so we can read micros32() directly from its counter and micros64() from counter and overflows
    configTimeBase(TIMER5, 0, 1000);       //1MHz 1us ticks
    timer_set_count(TIMER5,(1000000/SHED_FREQ)/2); // to not interfere with TIMER7
    timer_attach_interrupt(TIMER5, TIMER_UPDATE_INTERRUPT, _timer5_ovf, 2); // high priority
    timer_resume(TIMER5);


    // run standard Ardupilot tasks on 1kHz 
//    register_timer_task(1000, FUNCTOR_BIND_MEMBER(&REVOMINIScheduler::_run_1khz_procs, bool), NULL); now in the same scheduler
    
    
#ifdef SHED_PROF
// set flag for stats output each 10 seconds
    register_timer_task(10000000, FUNCTOR_BIND_MEMBER(&REVOMINIScheduler::_set_10s_flag, bool), NULL);
#endif

// for debug
//    register_io_process(FUNCTOR_BIND_MEMBER(&REVOMINIScheduler::stats_proc, void) );

}

void REVOMINIScheduler::_delay(uint16_t ms)
{
    uint32_t start = _micros();
#ifdef SHED_PROF
    uint32_t t=start;
#endif
    
    while (ms > 0) {
        if(!_in_timer_proc && !in_interrupt())  // not switch context in interrupts
            yield(ms*1000); // time in micros
            
        while ((_micros() - start) >= 1000) {
            ms--;
            if (ms == 0) break;
            start += 1000;
        }
        if (_min_delay_cb_ms <= ms) { // MAVlink callback uses 5ms
            if (_delay_cb) {
                _delay_cb();
            }
        }
    }

#ifdef SHED_PROF
    uint32_t us=_micros()-t;
    if(_in_timer_proc)
        delay_int_time +=us;
    else
        delay_time     +=us;
#endif
}

void REVOMINIScheduler::_delay_microseconds_boost(uint16_t us){
    _delay_microseconds(us);
}

void REVOMINIScheduler::_delay_microseconds(uint16_t us)
{
#ifdef SHED_PROF
    uint32_t t = _micros(); 
#endif

    uint32_t rtime = stopwatch_getticks(); // start ticks
    uint32_t dt    = us_ticks * us;  // delay time in ticks

    uint32_t ny = 10 * us_ticks; // 10 uS in ticks
    uint32_t tw;

    while ((tw = stopwatch_getticks() - rtime) < dt) { // tw - time waiting, in ticks
        if((dt - tw) > ny // No Yeld time - 10uS to end of wait 
           && !_in_timer_proc && !in_interrupt()) {  // not switch context in interrupts
            yield((dt - tw) / us_ticks); // in micros
        }
    }    

#ifdef SHED_PROF
    us=_micros()-t; // real time
    
    if(_in_timer_proc)
        delay_int_time +=us;
    else
        delay_time     +=us;
#endif

}


void REVOMINIScheduler::_IMU_int_handler() { 
    if(IMU_callback) {
#ifdef SHED_PROF
        uint32_t t=_micros();
#endif
        IMU_callback();

#ifdef SHED_PROF
        t=_micros() - t;
        if(t>_IMU_maxtime)
            _IMU_maxtime = t; // max exec time
        _IMU_count++;         // number of calls
        _IMU_fulltime += t;   // full consumed time to calc mean
#endif
    }
}


void REVOMINIScheduler::register_IMU_handler(AP_HAL::MemberProc cb) { 
    IMU_callback = cb; 
    
    REVOMINIGPIO::_attach_interrupt(BOARD_MPU6000_DRDY_PIN, _IMU_int_handler, RISING, 11);
}

void REVOMINIScheduler::register_delay_callback(AP_HAL::Proc proc, uint16_t min_time_ms)
{
    static bool init_done=false;
    if(!init_done){     // small hack to load HAL parameters in needed time

        ((HAL_REVOMINI&) hal).lateInit();
        
        init_done=true;
    }

    _delay_cb        = proc;
    _min_delay_cb_ms = min_time_ms;
}



void REVOMINIScheduler::register_io_process(AP_HAL::MemberProc proc)
{
    if(_num_io_proc>=REVOMINI_SCHEDULER_MAX_IO_PROCS) return;

    if(start_task(proc)) {
        _num_io_proc++;
    }
}



void REVOMINIScheduler::resume_timer_procs()
{
    _timer_suspended = false;
    if (_timer_event_missed == true) {
        _run_timer_procs(false);        // TODO here code executes on main thread, not in interrupt level!
        _timer_event_missed = false;
    }
}


void REVOMINIScheduler::_run_timer_procs(bool called_from_isr) {

    if (_in_timer_proc) {
        return;
    }
    _in_timer_proc = true;

    if (!_timer_suspended) {
        _run_timers(); 
    } else if (called_from_isr) {
        _timer_event_missed = true;
    }

    // and the failsafe, if one is setup
    if (_failsafe) {
        static uint32_t last_failsafe=0;
        uint32_t t=_micros();
        if(t>last_failsafe){
            last_failsafe = t+10000; // 10ms or 100Hz
            _failsafe();
        }
    }

    _in_timer_proc = false;
}

void REVOMINIScheduler::_timer_isr_event(TIM_TypeDef *tim) {
    _run_timer_procs(true);
}

void REVOMINIScheduler::_timer5_ovf(TIM_TypeDef *tim) {
    timer5_ovf_cnt++;
}

uint64_t REVOMINIScheduler::_micros64() {
    union {
        uint64_t t;
        uint32_t w[2];
    } now;
    
    noInterrupts();
    now.w[0] = _micros();
    now.w[1] = timer5_ovf_cnt;
    interrupts();
    return now.t;
}


void REVOMINIScheduler::system_initialized()
{
    if (_initialized) {
        AP_HAL::panic("PANIC: scheduler::system_initialized called more than once");
    }
    _initialized = true;
    
    board_set_rtc_register(0,RTC_SIGNATURE_REG); // clear bootloader flag after init done
}


void REVOMINIScheduler::reboot(bool hold_in_bootloader) {
    hal.console->println("GOING DOWN FOR A REBOOT\r\n");

    if(hold_in_bootloader) {
#if 1
        if(is_bare_metal()) { // bare metal build without bootloader

            board_set_rtc_register(DFU_RTC_SIGNATURE, RTC_SIGNATURE_REG);

        } else
#endif
            board_set_rtc_register(BOOT_RTC_SIGNATURE, RTC_SIGNATURE_REG);
    }

    _delay(100);

    NVIC_SystemReset();

    _delay(1000);
}

void REVOMINIScheduler::loop(){    // executes in main thread

     _print_stats();
}

void REVOMINIScheduler::stats_proc(void){
//    _print_stats(); only for debug

}

void REVOMINIScheduler::_print_stats(){
#ifdef SHED_PROF
    if(flag_10s) {
        flag_10s=false;
        uint32_t t=millis();
        const int Kf=100;
        
        float eff= (task_time)/(float)(task_time+shed_time);
        
        static float shed_eff=0;
    
        if(is_zero(shed_eff)) shed_eff = eff;
        else              shed_eff = shed_eff*(1 - 1/Kf) + eff*(1/Kf);

        hal.console->printf("\nScheduler stats:\n  %% of full time: %5.2f  Efficiency %5.3f max loop time %ld \n", (task_time/10.0)/t /* in percent*/ , shed_eff, max_loop_time );
        hal.console->printf("delay times: in main %5.2f including in semaphore %5.2f  in timer %5.2f", (delay_time/10.0)/t, (Semaphore::sem_time/10.0)/t,  (delay_int_time/10.0)/t);

#ifdef ISR_PROF
        hal.console->printf("in isr %5.2f ", (isr_time/10.0)/t );
#endif
#if 0
        hal.console->printf("\nIMU times: mean %5.2f max %5ld", (float)_IMU_fulltime/_IMU_count, _IMU_maxtime );
#endif
        yield();

        hal.console->printf("\nTask times:\n");

        for(int i=0; i< _num_timers; i++) {
            if(_timers[i].proc){    // task not cancelled?
                hal.console->printf("task 0x%llX tim %8.1f int %5.3f%% tot %6.4f%% mean time %5.1f max time %ld\n", _timers[i].proc, _timers[i].fulltime/1000.0, _timers[i].fulltime*100.0 / task_time, (_timers[i].fulltime / 10.0) / t, (float)_timers[i].fulltime/_timers[i].count, _timers[i].micros );
                _timers[i].micros = 0; // reset max time
                yield();
            }
        }

#ifdef MTASK_PROF
    
        task_t* ptr = &s_main;

        hal.console->printf("task switch time %7.3f count %ld mean %6.3f \n", yield_time/(float)us_ticks, yield_count, yield_time /(float)us_ticks / (float)yield_count );
        
        yield();
        do {
            hal.console->printf("task %d times: full %lld max %ld \n",  ptr->id, ptr->time, ptr->delay );
            yield();
        
            ptr = ptr->next;
        } while(ptr != &s_main);

#endif


    }
    
#endif
}


#ifdef SHED_PROF
bool REVOMINIScheduler::_set_10s_flag(){
    flag_10s=true;
    return true;
}
#endif

/*
    common realization of all Device.PeriodicCallback;
[
*/
AP_HAL::Device::PeriodicHandle REVOMINIScheduler::_register_timer_task(uint32_t period_us, uint64_t proc, REVOMINI::Semaphore *sem, uint8_t mode){
    int i;
    
    for (i = 0; i < _num_timers; i++) {
        if ( _timers[i].proc == 0L /* free slot */ ) {
            goto store;        

        } else if (_timers[i].proc == proc /* the same */ ) {
            noInterrupts();            // 64-bits should be 
            _timers[i].proc = 0L; // clear proc - temporary disable task
            interrupts();
            goto store;
        }
    }

    if (_num_timers < REVOMINI_SCHEDULER_MAX_SHEDULED_PROCS) {
        /* this write to _timers[] can be outside the critical section
         * because that memory won't be used until _num_timers is
         * incremented or where proc is NULL. */
         
        i = _num_timers;
        _timers[i].proc = 0L; // clear proc - this entry will be skipped
        _num_timers++; // now nulled proc guards us
store:        
        _timers[i].period = period_us;
        _timers[i].last_run = _micros(); // now
        _timers[i].sem = sem;
        _timers[i].mode = mode;
#ifdef SHED_PROF
        _timers[i].count = 0;
        _timers[i].micros = 0;
        _timers[i].fulltime = 0;
#endif
        noInterrupts();            // 64-bits should be 
        _timers[i].proc = proc;    //     last one, not interferes - guard is over
        interrupts();
        return (AP_HAL::Device::PeriodicHandle)&_timers[i];
    }

    return NULL;
}


bool REVOMINIScheduler::adjust_timer_task(AP_HAL::Device::PeriodicHandle h, uint32_t period_us)
{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wcast-align"
    revo_timer *p = (revo_timer *)h;
#pragma GCC diagnostic pop
    p->period = period_us;
    
    return true;
}
bool REVOMINIScheduler::unregister_timer_task(AP_HAL::Device::PeriodicHandle h)
{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wcast-align"
    revo_timer *p = (revo_timer *)h;
#pragma GCC diagnostic pop

    noInterrupts(); // 64-bits should be 
    p->proc=0L;
    interrupts();
    return true;
}

#define TIMER_PERIOD (1000000 / SHED_FREQ)  //125  interrupts period in uS
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-variable"

void REVOMINIScheduler::_run_timers(){
    uint32_t now = _micros();
    static uint32_t last_run = 0;

#ifdef SHED_PROF
    uint32_t full_t = now;
    uint32_t job_t = 0;
#endif                

    volatile uint32_t dt = now - last_run; // time from last run - just for debug

    last_run = now;

    for(int i = 0; i<_num_timers; i++){
        revo_timer &tim = _timers[i];
        
        if(tim.proc){    // task not cancelled?
/*
    у нас время в 32-разрядном счетчике, который может переполниться
    ovf - флаг переполнения времени. dt - время с момента прошлого тика
    
    now - tim.last_run - время с момента прошлого запуска, с учетом всех переполнений
    
*/
            if( (now - tim.last_run) > tim.period) { // time to run?
                if(tim.sem && !tim.sem->take_nonblocking()) { // semaphore active? take!
                    // can't get semaphore, just do nothing - will try next time
                    continue;
                }
#ifdef SHED_PROF
                uint32_t t = _micros();
#endif          
                bool ret=false;
                Revo_cb r = { .h=tim.proc }; // don't touch it without hardware debugger!
                switch(tim.mode){
                case 0:
                    ret = (r.pcb)();       // call task
                    break;
                case 1:
                    (r.mp)();              // call task
                    ret=1;
                    break;
                }
                if(tim.sem) tim.sem->give(); //  semaphore active? give back ASAP!

                if(ret) {  // reschedule
                    tim.last_run    += tim.period; // прошлое время запуска - по надобности а не по факту
                } else {
// all callee never returns false to unregister itself so we can use it as flag to simply reschedule
//                    tim.proc = 0L;               // cancel task
                }

                now = _micros();
#ifdef SHED_PROF
                t = now - t;               // work time

                if(tim.micros < t)
                    tim.micros    =  t;      // max time
                tim.count     += 1;          // number of calls
                tim.fulltime  += t;          // full time, mean time = full / count
                job_t += t;                  // time of all jobs
#endif                
            }
        }
    }


#ifdef SHED_PROF
    full_t = _micros() - full_t;         // full time of scheduler
    uint32_t shed_t = full_t - job_t;   // net time

    if(full_t>max_loop_time)
        max_loop_time=full_t;

    task_time += job_t; // full time in tasks
    shed_time += shed_t;
#endif                

}
#pragma GCC diagnostic pop

// ]


//[ -------- realization of cooperative multitasking --------

bool REVOMINIScheduler::adjust_stack(size_t stackSize)
{  // Set main task stack size
  s_top = stackSize;
  return true;
}



#if 0 // not used -- executes  C function as task

void REVOMINIScheduler::init_task(func_t t_setup, func_t t_loop, const uint8_t* stack)
{
  // Add task last in run queue (main task)
    task_t task;
    task.next = &s_main;
    task.prev = s_main.prev;
    s_main.prev->next = &task;
    s_main.prev = &task;
    task.stack = stack;
    task.id = ++task_n; // counter

#ifdef MTASK_PROF
    task.time=0;   // total time
    task.delay=0;  // max execution time
    task.start=_micros(); 
#endif

  // Create context for new task, caller will return
  if (setjmp(task.context)) {
    // we comes via longjmp
    if (t_setup != NULL) {
         t_setup();
         yield();
    }
    while (1) {
        t_loop();
        yield();        // in case that function not uses delay();
    }
  }
  // caller returns
}

// start C function as task
bool REVOMINIScheduler::start_task(func_t taskSetup, func_t taskLoop, size_t stackSize)
{
  // Check called from main task and valid task loop function
  if (!is_main_task() || (taskLoop == NULL)) return false;

  // Adjust stack size with size of task context
  stackSize += sizeof(task_t);

  // Allocate stack(s) and check if main stack top should be set
  size_t frame = RAMEND - (size_t) &frame;
  volatile uint8_t stack[s_top - frame]; // should be volatile else it will be optimized out
  if (s_main.stack == NULL) s_main.stack = (const uint8_t*)stack; // remember on first call stack of main task

  // Check that the task can be allocated
  if (s_top + stackSize > STACK_MAX) return false;

  // Adjust stack top for next task allocation
  s_top += stackSize;

  // Initiate task with given functions and stack top
  init_task(taskSetup, taskLoop, (const uint8_t*)(stack - stackSize));
  return true;
}
#endif


void REVOMINIScheduler::init_task(AP_HAL::MemberProc proc, const uint8_t* stack)
{
  // Add task last in run queue (main task)
    task_t task;
    task.next = &s_main;
    task.prev = s_main.prev;
    s_main.prev->next = &task;
    s_main.prev = &task;
    task.stack = stack;
    task.id = ++task_n; // counter

#ifdef MTASK_PROF
    task.time=0;   // total time
    task.delay=0;  // max execution time
    task.start=_micros(); 
#endif

  // Create context for new task, caller will return
  if (setjmp(task.context)) {
    // we comes via longjmp

    while (1) {
        proc();
        yield();        // in case that function not uses delay();
    }
  }
  // caller returns
}


bool REVOMINIScheduler::start_task(AP_HAL::MemberProc proc,  size_t stackSize){
  // Check called from main task and valid task loop function
  if (!is_main_task() || (!proc)) return false;

  // Adjust stack size with size of task context
  stackSize += sizeof(task_t);

  // Allocate stack(s) and check if main stack top should be set
  size_t frame = RAMEND - (size_t) &frame;
  volatile uint8_t stack[s_top - frame]; // should be volatile else it will be optimized out
  if (s_main.stack == NULL) s_main.stack = (const uint8_t*)stack; // remember on first call stack of main task

  // Check that the task can be allocated
  if (s_top + stackSize > STACK_MAX) return false;

  // Adjust stack top for next task allocation
  s_top += stackSize;

  // Initiate task with given functions and stack top
  init_task(proc, (const uint8_t*)(stack - stackSize));
  return true;
}

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-label"
void REVOMINIScheduler::yield(uint16_t ttw) // time to wait 
{
    if(task_n==0) return;

// if yield() called with a time it can remember that task don't want to run all this tome and exclude it from time sliceing
    uint32_t t =  _micros();
    s_running->t_yield = t;
    s_running->ttw     = ttw; // remember that task want to wait

#ifdef MTASK_PROF
    uint32_t dt =  t - s_running->start; // time in task
    s_running->time+=dt;                           // calculate sum
    if(dt>s_running->delay) s_running->delay = dt; // and remember maximum
    
    uint64_t ticks = stopwatch_getticks();
#endif
    if (setjmp(s_running->context)) {
        // we come here via longjmp - context switch is over
#ifdef MTASK_PROF
        yield_time += stopwatch_getticks() - s_running->ticks; // time of longjmp
        yield_count++;                  // count each context switch
#endif
        return;
    }
    // begin of context switch
#ifdef MTASK_PROF
    yield_time += stopwatch_getticks()-ticks; // time of setjmp
#endif

next:
    // Next task in run queue will continue
    s_running = s_running->next;
//  if(!s_running->active) goto next; // a way to skip unneeded tasks

    // task has a ttw  and time since than moment still less than ttw - skip task
    if(s_running->ttw && (t-s_running->t_yield) < s_running->ttw) goto next;
    s_running->ttw=0; // time to wait is over
    
// and here we can check task max execution time and reject task if more than we have (if ID not 0!)


#ifdef MTASK_PROF
    s_running->start = _micros();
    s_running->ticks = stopwatch_getticks();
#endif
    longjmp(s_running->context, true);
    // never comes here
}
#pragma GCC diagnostic pop


size_t REVOMINIScheduler::task_stack(){
  unsigned char marker;
  return (&marker - s_running->stack);
}



////////////////////////////////////
/*
union Revo_handler { // кровь кишки ассемблер :) преобразование функторов в унифицированный вид
    voidFuncPtr vp;
    AP_HAL::MemberProc mp;          это С а не С++ поэтому мы не можем объявить поддержку функторов явно, и вынуждены передавать
    uint64_t h; // treat as handle             <-- как 64-битное число
    uint32_t w[2]; // words, to check. если функтор то старшее - адрес флеша, младшее - адрес в RAM. 
                                    Если ссылка на функцию то младшее - адрес флеша, старше 0
};
*/

#define ADDRESS_IN_FLASH(a) ((a)>FLASH_BASE && (a)<CCMDATARAM_BASE)

void revo_call_handler(Revo_hal_handler hh){
    Revo_handler h = { .h = hh.h };

    if(ADDRESS_IN_FLASH(h.w[0])){
        (h.vp)();
    } else if(ADDRESS_IN_FLASH(h.w[1])) {
        (h.mp)();
    }
}
