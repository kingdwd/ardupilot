#include <exti.h>
#include <timer.h>
#include "RCInput.h"
#include <pwm_in.h>
#include <AP_HAL/utility/dsm.h>
#include "sbus.h"
#include "GPIO.h"
#include "ring_buffer_pulse.h"

#include "RC_PPM_parser.h"

#ifdef BOARD_SPEKTRUM_RX_PIN
 #include "RC_DSM_parser.h"
#endif
#ifdef BOARD_NRF_CS_PIN
 #include "RC_NRF_parser.h"
#endif

// Constructors ////////////////////////////////////////////////////////////////
using namespace AP_HAL;
using namespace REVOMINI;


/*
    DSM satellite connection
        1   2   3   4
pins    *   *   *   *   *   *   *
use    gnd vcc 26  103 xxx xxx xxx
DSM    GND     rx  en

*/


extern const AP_HAL::HAL& hal;
/*
static const uint8_t input_channels[]={ 
    4,  // PB14 T12/1 - PPM
    5,  // PB15 T12/2 - PPM2
    12, // PC6  T8/1  - 6_tx 
    13, // PC7  T8/2  - 6_rx 
    14, // PC8  T8/3  - Soft_scl 
    15, // PC9  T8/4  - Soft_sda
};
*/

_parser *REVOMINIRCInput::parsers[] = { // individual parsers on each PPM pin and DSM USART
    new PPM_parser, 
    new PPM_parser, 
#ifdef BOARD_SPEKTRUM_RX_PIN
    new DSM_parser, 
#endif
#ifdef BOARD_NRF_CS_PIN
    new NRF_parser,
#endif
}; 

#define PPM_INPUTS (sizeof(parsers) / sizeof(_parser))


uint8_t           REVOMINIRCInput::_valid_channels = 0;
uint64_t          REVOMINIRCInput::_last_read = 0;


uint16_t REVOMINIRCInput::_override[8];
bool REVOMINIRCInput::_override_valid;

bool REVOMINIRCInput::is_PPM = true;

uint8_t REVOMINIRCInput::_last_read_from=0;


/* constrain captured pulse to be between min and max pulsewidth. */
static inline uint16_t constrain_pulse(uint16_t p) {
    if (p > RC_INPUT_MAX_PULSEWIDTH) return RC_INPUT_MAX_PULSEWIDTH;
    if (p < RC_INPUT_MIN_PULSEWIDTH) return RC_INPUT_MIN_PULSEWIDTH;
    return p;
}




REVOMINIRCInput::REVOMINIRCInput()
{   }

void REVOMINIRCInput::init() {

    memset((void *)&_override[0],   0, sizeof(_override));

    for(uint8_t i=0; i<PPM_INPUTS;i++) {
        parsers[i]->init(i);
    }


/* OPLINK AIR port pinout
1       2       3       4       5       6       7
               D2      A15                
gnd    +5      26      103                     
               rx      pow
               int     cs
used as:

*/




#ifdef PWM_SUPPORTED // there is no pins 2&3 in RevoMini


/*  initial check for pin2-pin3 bridge. If detected switch to PPMSUM  
    default to standard PWM
*/
    

    is_PPM = false;
    uint8_t channel3_status = 0;
    const uint8_t pin2  = 5; //input pin 2
    const uint8_t pin3  = 12;//input pin 3

    
    //set pin2 as output and pin 3 as input
    REVOMINIGPIO::_pinMode(pin2, OUTPUT);
    REVOMINIGPIO::_pinMode(pin3, INPUT);

    //default pin3 to 0
    REVOMINIGPIO::_write(pin3, 0);
    REVOMINIScheduler::_delay(1);

    //write 1 to pin 2 and read pin3
    REVOMINIGPIO::_write(pin2, 1);
    REVOMINIScheduler::_delay(1);
    //if pin3 is 1 increment counter
    if (REVOMINIGPIO::_read(pin3) == 1)
	channel3_status++;

    //write 0 to pin 2 and read pin3
    REVOMINIGPIO::_write(pin2, 0);
    REVOMINIScheduler::_delay(1);
    //if pin3 is 0 increment counter
    if (REVOMINIGPIO::_read(pin3) == 0)
	channel3_status++;

    //write 1 to pin 2 and read pin3
    REVOMINIGPIO::_write(pin2, 1);
    REVOMINIScheduler::_delay(1);
    //if pin3 is 1 increment counter
    if (REVOMINIGPIO::_read(pin3) == 1)
	channel3_status++;

    //if counter is 3 then we are in PPMSUM
    if (channel3_status == 3)
        is_PPM = true;
#else
    is_PPM=true;
#endif

#ifdef PWM_SUPPORTED
#define NUM_PWM_CHANNELS 6 // PWM_CHANNELS defined only in .c

    if (!is_PPM) { //PWM
	// Init Radio In
	hal.console->println("Init Default PWM");
        for (byte channel = 0; channel < NUM_PWM_CHANNELS; channel++)
            pinData[channel].edge = FALLING_EDGE;
    }
#endif    

    clear_overrides();

    pwmInit(is_PPM); // PPM sum mode
    

}

// we have 3 individual sources of data - internal DSM from UART5 and 2 PPM parsers
bool REVOMINIRCInput::new_input()
{
    if(_override_valid) return true;

    for(uint8_t i=0; i<PPM_INPUTS;i++) {
        if(parsers[i]->get_last_signal() >_last_read) return true;
    }
    
    return false;
}


uint8_t REVOMINIRCInput::num_channels()
{
#ifdef PWM_SUPPORTED
    if(is_PPM){
        return _valid_channels;
    } 
    // PWM
    noInterrupts();
    uint8_t n = _rcin.channel_count;
    interrupts(); 
    return n;
#else

    return _valid_channels;
#endif
}


uint16_t REVOMINIRCInput::last_4=0;

//#define LOST_TIME 50 // this is wrong! Any packet lost and viola... 
#define LOST_TIME 500

uint16_t REVOMINIRCInput::_read_ppm(uint8_t ch,uint8_t n){
    uint16_t data=0;
    
    _parser *p = parsers[n];
    noInterrupts();
        data =            p->get_val(ch);
        _valid_channels = p->get_valid_channels();
    interrupts();
    return data;
}



uint16_t REVOMINIRCInput::read(uint8_t ch)
{
    uint16_t data=0;
    uint64_t pulse=0;
    uint64_t last=0;

    if(ch>=REVOMINI_RC_INPUT_NUM_CHANNELS) return 0;

    uint64_t now=systick_uptime();
    uint8_t got=0;

    for(uint8_t i=0; i<PPM_INPUTS;i++) {
        _parser *p = parsers[i];
        pulse = p->get_last_signal();
        last  = p->get_last_change();
        if( pulse >_last_read && (now - last ) < RC_DEAD_TIME) {
            data = _read_ppm(ch,i);
            got = i+1;
            break;
        }
    }
    
    if(got)  {
        _last_read_from =got;
        _last_read = pulse;
    } else {
        if(_last_read_from) {
            uint8_t n = _last_read_from-1;
            _parser *p = parsers[n];
            pulse = p->get_last_signal();
            last  = p->get_last_change();
            data = _read_ppm(ch,n);
            _last_read = pulse;
        } else {

#ifdef PWM_SUPPORTED
            if (!is_PPM) {
                data = pwmRead(ch, &pulse);
                break;
            } 
#endif    
            if( ch == 2) data = 900;
            else         data = 1000;
        }
    
    }

    /* Check for override */
    uint16_t over = _override[ch];
    if(over) return over;

    if( ch == 4) {
        last_4 = data;
    }

    if( ch == 2 ) { // throttle
        if( (now - pulse) > LOST_TIME || (now-last) > RC_DEAD_TIME ){
            data = 900;
        }

/*
 Receiver-DEVO-RX719-for-Walkera-Aibao
 failsafe: mode below 1000 and throttle at 1500
*/            
        if(last_4 < 1000 && data >1300)
            data = 900;

    }
    return data;
}

uint8_t REVOMINIRCInput::read(uint16_t* periods, uint8_t len)
{

    for (uint8_t i = 0; i < len; i++){
        periods[i] = read(i);
    }

    return _valid_channels;
}



bool REVOMINIRCInput::set_overrides(int16_t *overrides, uint8_t len)
{
    bool res = false;
    for (int i = 0; i < len; i++) {
        res |= set_override(i, overrides[i]);
    }
    return res;
}

bool REVOMINIRCInput::set_override(uint8_t channel, int16_t override)
{
    if (override < 0) return false; /* -1: no change. */
    if (channel < 8) {
        _override[channel] = override;
        if (override != 0) {
    	    _override_valid = true;
            return true;
        }
    }
    return false;
}

void REVOMINIRCInput::clear_overrides()
{
    for (int i = 0; i < 8; i++) {
	set_override(i, 0);
    }
}

bool REVOMINIRCInput::rc_bind(int dsmMode){
#ifdef BOARD_SPEKTRUM_RX_PIN
    return parsers[2]->bind(dsmMode); // only DSM
#else
    return false;
#endif

}
