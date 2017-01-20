
#ifndef __AP_HAL_REVOMINI_SCHEDULER_H__
#define __AP_HAL_REVOMINI_SCHEDULER_H__


#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>

#include "AP_HAL_REVOMINI_Namespace.h"
//#include "HAL_REVOMINI_Class.h"

#include "Semaphores.h"

#include <delay.h>
#include <systick.h>
#include <boards.h>
#include <timer.h>
#include <AP_HAL/AP_HAL.h>
#include <setjmp.h>

#define REVOMINI_SCHEDULER_MAX_TIMER_PROCS 10
#define REVOMINI_SCHEDULER_MAX_IO_PROCS 10
#define REVOMINI_SCHEDULER_MAX_SHEDULED_PROCS 32

#define SHED_FREQ 8000 // in Hz


/** Default tasks stack size and stack max. */
#define DEFAULT_STACK_SIZE  1024
#define MAIN_STACK_SIZE  16384
#define STACK_MAX  65535

extern "C" {
    extern unsigned _estack; // defined by link script
    extern unsigned __isr_vector_start; // defined by link script
    extern uint32_t us_ticks;
}

#define RAMEND ((size_t)&_estack)

typedef enum {
    SCHED_CANCEL=0,
    SCHED_OK=1,
    SCHED_RESCHEDULE=2,
} SchedState;


 #define SHED_PROF // profiling
// #define MTASK_PROF

typedef struct RevoTimer {
    uint32_t period;            // interval in uS
    uint32_t last_run;          // last run time
    uint64_t proc;          //AP_HAL::Device::PeriodicCb proc and AP_HAL::MemberProc mp together
    REVOMINI::Semaphore *sem;
    uint8_t mode;
#ifdef SHED_PROF
    uint32_t micros;    // max exec time
    uint32_t count;     // number of calls
    uint64_t fulltime;  // full consumed time to calc mean
#endif
} revo_timer;

union Revo_cb { // кровь кишки ассемблер :) преобразование функторов в унифицированный вид
    AP_HAL::MemberProc mp;
    AP_HAL::Device::PeriodicCb pcb;
    uint64_t h; // treat as handle
    uint32_t w[2]; // words, to check
};

class REVOMINI::REVOMINIScheduler : public AP_HAL::Scheduler {
public:
    typedef void (*func_t)();

    REVOMINIScheduler();
    void     init();
    void     delay(uint16_t ms) { _delay(ms); } // uses internal static methods
    void     delay_microseconds(uint16_t us) { _delay_microseconds(us); }
    void     delay_microseconds_boost(uint16_t us) override { _delay_microseconds_boost(us); }
    
    inline   uint32_t millis() {    return _millis(); }
    inline   uint32_t micros() {   /* return systick_micros();*/ return _micros(); }
    
    void     register_delay_callback(AP_HAL::Proc, uint16_t min_time_ms);
    void     register_timer_process(AP_HAL::MemberProc);
    void     register_io_process(AP_HAL::MemberProc);
    void     suspend_timer_procs();
    void     resume_timer_procs();

    inline bool in_timerprocess() {   return _in_timer_proc; }

    void     register_timer_failsafe(AP_HAL::Proc, uint32_t period_us);

    void     system_initialized();

    void     reboot(bool hold_in_bootloader);

// drivers are not the best place for its own sheduler
    static AP_HAL::Device::PeriodicHandle register_timer_task(uint32_t period_us, AP_HAL::Device::PeriodicCb proc, REVOMINI::Semaphore *sem) {
        Revo_cb r = { .pcb=proc };
        return _register_timer_task(period_us, r.h, sem, 0);
    }

    static void _delay(uint16_t ms);
    static void _delay_microseconds(uint16_t us);
    static void _delay_microseconds_boost(uint16_t us);
    static inline bool _in_timerprocess() {   return _in_timer_proc; }

    static inline  uint32_t _millis() {    return systick_uptime(); } //systick_uptime returns 64-bit time
    static inline  uint64_t _millis64() {  return systick_uptime(); }

    static inline  uint32_t _micros() {   /* return systick_micros();*/ return timer_get_count32(TIMER5); }
    static         uint64_t _micros64(); 

    
    static bool           adjust_timer_task(AP_HAL::Device::PeriodicHandle h, uint32_t period_us);
    static bool           unregister_timer_task(AP_HAL::Device::PeriodicHandle h);
    void                  loop();      // to add ability to print out scheduler's stats in main thread


    static void _do_io_process();

//    bool                  _run_1khz_procs();
    static inline bool in_interrupt(){ return (SCB->ICSR & SCB_ICSR_VECTACTIVE_Msk) || (__get_BASEPRI()); }


//{ this functions do a cooperative multitask and inspired by Arduino-Scheduler (Mikael Patel)
    
  /**
   * Initiate scheduler and main task with given stack size. Should
   * be called before start of any tasks if the main task requires a
   * stack size other than the default size. Returns true if
   * successful otherwise false.
   * @param[in] stackSize in bytes.
   * @return bool.
   */
    static bool adjust_stack(size_t stackSize);
    
  /**
   * Start a task with given functions and stack size. Should be
   * called from main task (in setup). The functions are executed by
   * the task. The taskSetup function (if provided) is run once.
   * The taskLoop function is repeatedly called. The taskSetup may be
   * omitted (NULL). Returns true if successful otherwise false.
   * @param[in] taskSetup function (may be NULL).
   * @param[in] taskLoop function (may not be NULL).
   * @param[in] stackSize in bytes.
   * @return bool.
   */
  static bool start_task(func_t taskSetup, func_t taskLoop, size_t stackSize = DEFAULT_STACK_SIZE);
  static bool start_task(AP_HAL::MemberProc proc,  size_t stackSize = DEFAULT_STACK_SIZE);

  /**               
   * Context switch to next task in run queue.
   */
  static void yield(uint16_t ttw=0); // optional time to wait
  
  /**
   * Return current task stack size.
   * @return bytes
   */
  static size_t task_stack();
  
  static bool is_main_task() { return s_running == &s_main; }

//}



protected:

/**
   * Initiate a task with the given functions and stack. When control
   * is yield to the task the setup function is first called and then
   * the loop function is repeatedly called.
   * @param[in] setup task function (may be NULL).
   * @param[in] loop task function (may not be NULL).
   * @param[in] stack top reference.
   */
    static void init_task(func_t t_setup, func_t t_loop, const uint8_t* stack);
    // the same but for AP_HAL::MemberProc
    static void init_task(AP_HAL::MemberProc proc, const uint8_t* stack);
  
  
  /**
   * Task run-time structure.
   */
  struct task_t {
    task_t* next;               //!< Next task
    task_t* prev;               //!< Previous task
    jmp_buf context;            //!< Task context
    const uint8_t* stack;       //!< Task stack
    uint16_t id;                // id of task
    uint32_t t_yield;      // time of yield
    uint32_t ttw;          // time to work
#ifdef MTASK_PROF
    uint32_t ticks; // ticks of CPU to calculate context switch time
    uint32_t start; // microseconds of timeslice start
    uint64_t time;  // full time
    uint32_t delay; // maximal execution time of task
#endif
  };
  
  /** Main task. */
  static task_t s_main;

  /** Running task. */
  static task_t* s_running;
  
  /** Task stack allocation top. */
  static size_t s_top;
  
  static uint16_t task_n; // counter
  
 
#define await(cond) while(!(cond)) yield()
  
//} end of multitask
    
private:
    static void board_set_rtc_signature(uint32_t sig);

    static AP_HAL::Device::PeriodicHandle _register_timer_task(uint32_t period_us, uint64_t proc, REVOMINI::Semaphore *sem, uint8_t mode=0);

    static volatile bool _in_timer_proc;

    static AP_HAL::Proc _delay_cb;
    static uint16_t _min_delay_cb_ms;
    static bool _initialized;

    /* _timer_isr_event() and _run_timer_procs are static so they can be
     * called from an interrupt. */
    static void _timer_isr_event(TIM_TypeDef *tim);
    static void _run_timer_procs(bool called_from_isr);

    static void _timer5_ovf(TIM_TypeDef *tim);

    static uint32_t timer5_ovf_cnt;
    
    static AP_HAL::Proc _failsafe;

    static volatile bool _timer_suspended;
    static volatile bool _timer_event_missed;
//    static AP_HAL::MemberProc _timer_proc[REVOMINI_SCHEDULER_MAX_TIMER_PROCS];
//    static uint8_t _num_timer_procs;
    static uint32_t _scheduler_last_call;

//    static AP_HAL::MemberProc _io_process[REVOMINI_SCHEDULER_MAX_IO_PROCS];
    static uint8_t _num_io_proc;

    static revo_timer _timers[REVOMINI_SCHEDULER_MAX_SHEDULED_PROCS];
    static uint8_t    _num_timers;

    static void _run_timers(void);

    void _print_stats();
    void stats_proc(void);
    
#ifdef SHED_PROF
    static uint64_t shed_time;
    static uint64_t task_time;
    static bool flag_10s;
    
    static uint64_t delay_time;
    static uint64_t delay_int_time;
    static uint32_t max_loop_time;
    
    bool _set_10s_flag();
#endif

#ifdef MTASK_PROF
    static uint64_t yield_time;
    static uint32_t yield_count;
#endif


};

#endif // __AP_HAL_REVOMINI_SCHEDULER_H__
