#include "RCOutput.h"
#include "GPIO.h"

using namespace REVOMINI;

/*
    OpenPilot motor order (nose up, from top)
    
    1 2
    4 3
    
    ArduCopter motor order
    
    3 1
    2 4

    Cleanflight motor order
    
    4 2 
    3 1
    

so to mimics Arducopter motors should be changed as 
    1 -> 3
    2 -> 1
    3 -> 4
    4 -> 2

so to mimics Cleanflight motors should be changed as 
    1 -> 4
    2 -> 2
    3 -> 1
    4 -> 3


*/

#define REVOMINI_OUT_CHANNELS 6

// #if FRAME_CONFIG == QUAD_FRAME // this is only QUAD layouts

// OpenPilot
static const uint8_t output_channels_openpilot[]= {  // pin assignment
    46, //Timer3/3  - 1
    45, //Timer3/4  - 2
    50, //Timer2/3  - 3
    49, //Timer2/2  - 4
    48, //Timer2/1
    47, //Timer2/0
};

#if 0  // don't works as needed
// ArduCopter
static const uint8_t output_channels_arducopter[]= {  // pin assignment
    50, //Timer2/3  - 3
    46, //Timer3/3  - 1
    49, //Timer2/2  - 4
    45, //Timer3/4  - 2
    48, //Timer2/1
    47, //Timer2/0
};


// Cleanflight
static const uint8_t output_channels_cleanflight[]= {  // pin assignment
    49, //Timer2/2  - 4
    45, //Timer3/4  - 2
    46, //Timer3/3  - 1
    50, //Timer2/3  - 3
    48, //Timer2/1
    47, //Timer2/0
};

// Arducopter,shifted 2 pins right to use up to 2 servos
static const uint8_t output_channels_servo[]= {  // pin assignment
    50, //Timer2/3  - 1
    49, //Timer2/2  - 2
    48, //Timer2/1  - 3
    47, //Timer2/0  - 4
    46, //Timer3/3      servo1
    45, //Timer3/4      servo2
};



static const uint8_t * const revo_motor_map[]={
    output_channels_arducopter,
    output_channels_openpilot,
    output_channels_cleanflight,
    output_channels_servo,
};

#endif

// #endif

static const uint8_t *output_channels = output_channels_openpilot;  // current pin assignment

enum     REVOMINIRCOutput::output_mode REVOMINIRCOutput::_mode = REVOMINIRCOutput::MODE_PWM_NORMAL;

uint16_t REVOMINIRCOutput::_period[REVOMINI_MAX_OUTPUT_CHANNELS] IN_CCM;
uint16_t REVOMINIRCOutput::_enabled_channels;
bool     REVOMINIRCOutput::_sbus_enabled;
bool     REVOMINIRCOutput::_corked;
bool     REVOMINIRCOutput::_need_update;
uint8_t  REVOMINIRCOutput::_used_channels;

uint32_t REVOMINIRCOutput::_timer_frequency[REVOMINI_MAX_OUTPUT_CHANNELS] IN_CCM;

uint32_t REVOMINIRCOutput::_timer2_preload;
uint16_t REVOMINIRCOutput::_timer3_preload;

bool     REVOMINIRCOutput::_timer3_2flag=false;


#define PWM_TIMER_KHZ 2000          // 1000 in cleanflight
#define ONESHOT125_TIMER_KHZ 16000  // 8000 in cleanflight
#define ONESHOT42_TIMER_KHZ  28000  // 24000 in cleanflight
#define PWM_BRUSHED_TIMER_KHZ 16000 // 8000 in cleanflight

#define _BV(bit) (1U << (bit))

void REVOMINIRCOutput::init()
{
    memset(&_period[0], 0, sizeof(_period));

    set_output_mode(MODE_PWM_NORMAL); // init timers

    // enamled only for OneShot
    timer_disable_irq(TIMER2, TIMER_UPDATE_INTERRUPT);
    timer_disable_irq(TIMER3, TIMER_UPDATE_INTERRUPT);

    // interrupts to stop timer after pulse - 16-bit timer only
    timer_attach_interrupt(TIMER3, TIMER_UPDATE_INTERRUPT, _timer3_isr_event, 10); //

    _used_channels=0;
}


void REVOMINIRCOutput::lateInit(uint8_t map){ // 2nd stage with loaded parameters
    
//    if(map >= ARRAY_SIZE(revo_motor_map)) return; // don't initialize if parameter is wrong
//    output_channels = revo_motor_map[map];
    
    InitPWM();
}

void REVOMINIRCOutput::InitPWM()
{
    for(uint8_t i = 0; i < REVOMINI_MAX_OUTPUT_CHANNELS && i < REVOMINI_OUT_CHANNELS; i++) {
        uint8_t pin = output_channels[i];
        REVOMINIGPIO::_pinMode(pin, PWM);
    }
}

uint32_t inline REVOMINIRCOutput::_timer_period(uint16_t speed_hz) {
    return (uint32_t)((PWM_TIMER_KHZ*1000UL) / speed_hz);
}

uint16_t REVOMINIRCOutput::get_freq(uint8_t ch) {
    if(ch >= REVOMINI_OUT_CHANNELS) return 0;
    
    const timer_dev *dev = PIN_MAP[output_channels[ch]].timer_device;

    /* transform to period by inverse of _time_period(icr) */
    return (uint16_t)((PWM_TIMER_KHZ*1000UL) / timer_get_reload(dev));
}


void REVOMINIRCOutput::set_output_mode(enum REVOMINIRCOutput::output_mode mode) {

    _mode=mode;
    uint32_t period=0;
    
    // disable interrupt on any mode change
    timer_disable_irq(TIMER2, TIMER_UPDATE_INTERRUPT);
    timer_disable_irq(TIMER3, TIMER_UPDATE_INTERRUPT);
    
    switch(mode){
    case MODE_PWM_NORMAL:
// output uses timers 2 & 3 so let init them for PWM mode
        period    = ((PWM_TIMER_KHZ*1000UL) / 50) - 1; // 50Hz by default
                     // dev    period   freq, kHz
        configTimeBase(TIMER2, period,  PWM_TIMER_KHZ);       // 2MHz 0.5us ticks - for 50..490Hz PWM
        configTimeBase(TIMER3, period,  PWM_TIMER_KHZ);       // 2MHz 0.5us ticks 
        break;

#if 0 // standard OneShot

    case MODE_PWM_ONESHOT: // same as PWM but with manual restarting
// output uses timers 2 & 3 so let init them for PWM mode
        period    = (uint32_t)-2; // max possible
                     // dev    period   freq, kHz
        configTimeBase(TIMER2, period,  PWM_TIMER_KHZ);       // 2MHz 0.5us ticks - for 50..490Hz PWM
        configTimeBase(TIMER3, period,  PWM_TIMER_KHZ);       // 2MHz 0.5us ticks 

        _timer2_preload = period-1;
        _timer3_preload = period-1;
        _timer3_2flag=false;
    
        timer_enable_irq(TIMER3, TIMER_UPDATE_INTERRUPT); // to stop timer on overflow. 32-bit TIMER2 will never overflows
        return; // no resume

#else //MODE_PWM_ONESHOT125

//    case MODE_PWM_ONESHOT125:
    case MODE_PWM_ONESHOT:
        period    = (uint32_t)-2; // maximal available - manual restarting!    
//    at 16Mhz, period with 65536 will be 244Hz so even 16-bit timer will never overflows at 500Hz loop

                     // dev    period   freq, kHz
        configTimeBase(TIMER2, period,  ONESHOT125_TIMER_KHZ);       // 16MHz 62.5ns ticks - for 125uS..490Hz OneShot125
        configTimeBase(TIMER3, period,  ONESHOT125_TIMER_KHZ);       // 16MHz 62.5ns ticks 

        _timer2_preload = period-1;
        _timer3_preload = period-1;
        _timer3_2flag=false;
        
        timer_enable_irq(TIMER3, TIMER_UPDATE_INTERRUPT);
        return; // no resume
#endif
#if 0
    case MODE_PWM_ONESHOT42:
        period    = (uint32_t)-2; // maximal available - manual restarting!
//    at 28Mhz, period with 65536 will be 427Hz so even 16-bit timer should not overflows at 500Hz loop

                     // dev    period   freq, kHz
        configTimeBase(TIMER2, period,  ONESHOT42_TIMER_KHZ);       // 16MHz 62.5ns ticks - for 125uS..490Hz OneShot125
        configTimeBase(TIMER3, period,  ONESHOT42_TIMER_KHZ);       // 16MHz 62.5ns ticks 

        _timer2_preload = period-1;
        _timer3_preload = period-1;
        _timer3_2flag=false;
        
        timer_enable_irq(TIMER3, TIMER_UPDATE_INTERRUPT);
        return; // no resume
#endif

    case MODE_PWM_BRUSHED16KHZ: 
                     // dev    period   freq, kHz
        configTimeBase(TIMER2, 1000,    PWM_BRUSHED_TIMER_KHZ);       // 16MHz  - 0..1 in 1000 steps
        configTimeBase(TIMER3, 1000,    PWM_BRUSHED_TIMER_KHZ);       // 16MHz 
        break;
    }
    timer_resume(TIMER2);
    timer_resume(TIMER3);
}

// interrupts

void REVOMINIRCOutput::_timer3_isr_event(TIM_TypeDef* t) {
    if(_timer3_2flag){
        timer_pause(TIMER3);

        timer_set_count(TIMER3,_timer3_preload);
    }
    _timer3_2flag = ! _timer3_2flag;
}


// for Oneshot125 
// [1000;2000] => [125;250]
// so frequency of timers should be 8 times more - 16MHz, but timers on 84MHz can give only 16.8MHz

// channels 1&2, 3&4&5&6 can has a different rates
void REVOMINIRCOutput::set_freq(uint32_t chmask, uint16_t freq_hz) {          
    uint32_t mask=1;
    
    if(_mode != MODE_PWM_NORMAL) return; // no frequency in OneShoot or Brushed modes
    
    for(uint8_t i=0; i< REVOMINI_OUT_CHANNELS; i++) { // кто последний тот и папа
        if(chmask & mask) {
            const timer_dev *dev = PIN_MAP[output_channels[i]].timer_device;
            timer_set_reload(dev,  _timer_period(freq_hz)); 
        }
        mask <<= 1;
    }
}


/* constrain pwm to be between min and max pulsewidth */
static inline uint16_t constrain_period(uint16_t p) {
    if (p > RC_INPUT_MAX_PULSEWIDTH) return RC_INPUT_MAX_PULSEWIDTH;
    if (p < RC_INPUT_MIN_PULSEWIDTH) return RC_INPUT_MIN_PULSEWIDTH;
    return p;
}

void REVOMINIRCOutput::set_pwm(uint8_t ch, uint16_t pwm){
    if(ch>=REVOMINI_OUT_CHANNELS) return;

    if (!(_enabled_channels & _BV(ch))) return;      // not enabled

    uint8_t pin = output_channels[ch];
    if (pin >= BOARD_NR_GPIO_PINS) return;


    switch(_mode){
    case MODE_PWM_BRUSHED16KHZ:
        pwm -= 1000; // move from 1000..2000 to 0..1000
        break;
/*
    case MODE_PWM_ONESHOT42:
        break;
*/
    default:
        pwm <<= 1; // frequency of timers 2MHz or 16MHz 
        break;
    }

    const timer_dev *dev = PIN_MAP[pin].timer_device;
    timer_set_compare(dev, PIN_MAP[pin].timer_channel, pwm); 
}

void REVOMINIRCOutput::write(uint8_t ch, uint16_t period_us)
{
    if(ch>=REVOMINI_OUT_CHANNELS) return;

    if(_used_channels<ch) _used_channels=ch+1;

    
    uint16_t pwm = constrain_period(period_us);

    if(_period[ch]==pwm) return; // already so

    _period[ch]=pwm;
    
    _need_update=true;

    if(_corked) return;

    set_pwm(ch, pwm);
}



void REVOMINIRCOutput::write(uint8_t ch, uint16_t* period_us, uint8_t len)
{
    if(ch>=REVOMINI_OUT_CHANNELS) return;
    
    for (int i = 0; i < len; i++) {
        write(i + ch, period_us[i]);
    }
}

uint16_t REVOMINIRCOutput::read(uint8_t ch)
{
    if(ch>=REVOMINI_OUT_CHANNELS) return RC_INPUT_MIN_PULSEWIDTH;

    return _period[ch];
}

void REVOMINIRCOutput::read(uint16_t* period_us, uint8_t len)
{
// here we don't need to limit channel - all unsupported will be read as RC_INPUT_MIN_PULSEWIDTH
    for (int i = 0; i < len; i++) {
        period_us[i] = read(i);
    }
}


void REVOMINIRCOutput::enable_ch(uint8_t ch)
{
    if (ch >= REVOMINI_OUT_CHANNELS) 
        return;
    
    if (ch >= 8 && !(_enabled_channels & (1U<<ch))) {
        // this is the first enable of an auxiliary channel - setup
        // aux channels now. This delayed setup makes it possible to
        // use BRD_PWM_COUNT to setup the number of PWM channels.
        _init_alt_channels();
    }
    _enabled_channels |= (1U<<ch);
    if (_period[ch] == PWM_IGNORE_THIS_CHANNEL) {
        _period[ch] = 0;
    }
    REVOMINIGPIO::_pinMode(output_channels[ch], PWM);
}

void REVOMINIRCOutput::disable_ch(uint8_t ch)
{
    if (ch >= REVOMINI_OUT_CHANNELS) {
        return;
    }
    
    _enabled_channels &= ~(1U<<ch);
    _period[ch] = PWM_IGNORE_THIS_CHANNEL;
    

    uint8_t pin = output_channels[ch];
    if (pin >= BOARD_NR_GPIO_PINS) return;

/*    
    const timer_dev *dev = PIN_MAP[pin].timer_device;
    TIM_Cmd(dev->regs, DISABLE);
*/  // we shouldn't disable ALL timer but only one pin, it will be better to change it's mode from PWM to output

    REVOMINIGPIO::_pinMode(pin, OUTPUT);
    REVOMINIGPIO::_write(pin, 0);

}


void REVOMINIRCOutput::push()
{
    _corked = false;

    for (uint16_t ch = 0; ch < _used_channels; ch++) {
        set_pwm(ch, _period[ch]);
    }

    timer_pause(TIMER2);                     // stop timers
    timer_pause(TIMER3); 

    timer_set_count(TIMER2,_timer2_preload); // load a 3-step-back value to counters
    timer_set_count(TIMER3,_timer3_preload);

    timer_resume(TIMER2);                   // start timers again
    timer_resume(TIMER3);
}

