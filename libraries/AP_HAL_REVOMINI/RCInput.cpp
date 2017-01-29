#include <exti.h>
#include <timer.h>
#include "RCInput.h"
#include <pwm_in.h>
#include <AP_HAL/utility/dsm.h>
#include "sbus.h"
#include "GPIO.h"
#include "ring_buffer_pulse.h"

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


#define PPM_INPUTS 2

extern const AP_HAL::HAL& hal;

#define RISING_EDGE 1
#define FALLING_EDGE 0

#define MINONWIDTH 950
#define MAXONWIDTH 2075

#define MINCHECK 900
#define MAXCHECK 2100

static const uint8_t input_channels[]={ 
    4,  // PB14 T12/1 - PPM
    5,  // PB15 T12/2 - PPM2
    12, // PC6  T8/1  - 6_tx 
    13, // PC7  T8/2  - 6_rx 
    14, // PC8  T8/3  - Soft_scl 
    15, // PC9  T8/4  - Soft_sda
};


PPM_parser REVOMINIRCInput::parsers[PPM_INPUTS]; // individual parsers on each PPM pin

REVOMINIUARTDriver REVOMINIRCInput::uartSDriver(_UART5);
volatile uint16_t REVOMINIRCInput::_dsm_val[REVOMINI_RC_INPUT_NUM_CHANNELS] IN_CCM;
volatile uint64_t REVOMINIRCInput::_dsm_last_signal IN_CCM;
volatile uint8_t  REVOMINIRCInput::_dsm_channels = 0;
struct REVOMINIRCInput::DSM        REVOMINIRCInput::dsm;


uint8_t           REVOMINIRCInput::_valid_channels = 0;
uint64_t          REVOMINIRCInput::_last_read = 0;



uint16_t REVOMINIRCInput::_override[8];

bool REVOMINIRCInput::_override_valid;

bool REVOMINIRCInput::is_PPM = true;


enum BOARD_LAST_INPUT REVOMINIRCInput::_last_read_from=BOARD_INPUT_NONE;


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
    memset((void *)&_dsm_val[0],    0, sizeof(_dsm_val));


    _dsm_last_signal=0;

    REVOMINIGPIO::_pinMode(BOARD_SPEKTRUM_PWR_PIN, OUTPUT);
    REVOMINIGPIO::_pinMode(BOARD_SPEKTRUM_RX_PIN, INPUT_PULLUP);
    REVOMINIGPIO::_write(BOARD_SPEKTRUM_PWR_PIN, BOARD_SPEKTRUM_PWR_ON);

    for(uint8_t i=0; i<PPM_INPUTS;i++) {
        parsers[i].init(i);
    }

    // initialize DSM UART
    uartSDriver.begin(115200);
    uartSDriver.setCallback(add_dsm_uart_input);

/* OPLINK AIR port pinout
1       2       3       4       5       6       7
                        
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
    
#ifdef BOARD_SPEKTRUM_PWR_PIN
    REVOMINIGPIO::_pinMode(BOARD_SPEKTRUM_PWR_PIN, OUTPUT);
    REVOMINIGPIO::_write(BOARD_SPEKTRUM_PWR_PIN, BOARD_SPEKTRUM_PWR_ON);
#endif

}

// we have 3 individual sources of data - internal DSM from UART5 and 2 PPM parsers

bool REVOMINIRCInput::new_input()
{
    return _override_valid || 
           _dsm_last_signal >_last_read ||
           parsers[0].last_signal >_last_read ||
           parsers[1].last_signal >_last_read;
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

uint16_t REVOMINIRCInput::_read_dsm(uint8_t ch){
    uint16_t data=0;
    noInterrupts();
        _last_read = _dsm_last_signal;
        data = _dsm_val[ch];
        _valid_channels = _dsm_channels;
    interrupts();
    return data;
}

uint16_t REVOMINIRCInput::_read_ppm(uint8_t ch,uint8_t n){
    uint16_t data=0;
    noInterrupts();
        _last_read = parsers[n].last_signal;
        data =       parsers[n].val[ch];
        _valid_channels = parsers[n].valid_channels;
    interrupts();
    return data;
}

uint16_t REVOMINIRCInput::read(uint8_t ch)
{
    uint16_t data=0;
    uint32_t pulse=0;

    if(ch>=REVOMINI_RC_INPUT_NUM_CHANNELS) return 0;

    if(_dsm_last_signal >_last_read){ // read new data
        data = _read_dsm(ch);
        pulse = _last_read;
        _last_read_from = BOARD_INPUT_DSM;
    } else if( parsers[0].last_signal >_last_read) {
        data = _read_ppm(ch,0);
        pulse =      _last_read;
        _last_read_from = BOARD_INPUT_P0;
    } else if( parsers[1].last_signal >_last_read) {
        data = _read_ppm(ch,1);
        pulse =      _last_read;
        _last_read_from = BOARD_INPUT_P1;
    } else {
        switch(_last_read_from){                // read latest source
        case BOARD_INPUT_DSM:
            data = _read_dsm(ch);
            pulse = _last_read;
            break;
        case BOARD_INPUT_P0:
            data = _read_ppm(ch,0);
            pulse =      _last_read;
            break;
        case BOARD_INPUT_P1:
            data = _read_ppm(ch,1);
            pulse =      _last_read;
            break;
        default:  
#ifdef PWM_SUPPORTED
            if (!is_PPM) {
                data = pwmRead(ch, &pulse);
                break;
            } 
#endif    
            data = 0;
            break;
        }
    
    }


    /* Check for override */
    uint16_t over = _override[ch];
    if(over) return over;

    if( ch == 4) {
        last_4 = data;
    }

    if( ch == 2) {
        if( systick_uptime() - pulse > LOST_TIME)
            data = 900;

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
    uartSDriver.end();
    
    REVOMINIGPIO::_write(BOARD_SPEKTRUM_PWR_PIN, BOARD_SPEKTRUM_PWR_OFF); /*power down DSM satellite*/

    REVOMINIScheduler::_delay(500);

    REVOMINIGPIO::_pinMode(BOARD_SPEKTRUM_RX_PIN, OUTPUT);           /*Set UART RX pin to active output mode*/

    REVOMINIGPIO::_write(BOARD_SPEKTRUM_PWR_PIN, BOARD_SPEKTRUM_PWR_ON);     /* power up DSM satellite*/

    REVOMINIScheduler::_delay(72);

    for (int i = 0; i < dsmMode; i++) {                         /*Pulse RX pin a number of times*/
	REVOMINIScheduler::_delay_microseconds(120);
	REVOMINIGPIO::_write(BOARD_SPEKTRUM_RX_PIN, 0);
	REVOMINIScheduler::_delay_microseconds(120);
	REVOMINIGPIO::_write(BOARD_SPEKTRUM_RX_PIN, 1);
    }

    REVOMINIScheduler::_delay(50);

    uartSDriver.begin(115200);                                  	/*Restore USART RX pin to RS232 receive mode*/

    return true;
}


/*
  add some bytes of input in DSM serial stream format, coping with partial packets - UART input callback
 */
void REVOMINIRCInput::add_dsm_uart_input() {
    
    while(uartSDriver.available()){
        
        // at least 1 byte we have
        const uint8_t dsm_frame_size = sizeof(dsm.frame);

        uint32_t now = AP_HAL::millis();    
        if (now - dsm.last_input_ms > 5) {
            // resync based on time
            dsm.partial_frame_count = 0;
        }
        dsm.last_input_ms = now;
    
        if (dsm.partial_frame_count + 1 > dsm_frame_size) {
            return; // we can't add bytes to buffer
        }
        


        dsm.frame[dsm.partial_frame_count] = uartSDriver.read();
        dsm.partial_frame_count += 1;

	if (dsm.partial_frame_count == dsm_frame_size) {
            dsm.partial_frame_count = 0;
            uint16_t values[16] {};
            uint16_t num_values=0;
            if (dsm_decode(AP_HAL::micros64(), dsm.frame, values, &num_values, 16) &&
                num_values >= 5) {
                for (uint8_t i=0; i<num_values; i++) {
                    if (values[i] != 0) {
                        _dsm_val[i] = values[i];
                    }
                }
                /*
                  the apparent number of channels can change on DSM,
                  as they are spread across multiple frames. We just
                  use the max num_values we get
                 */
                if (num_values > _dsm_channels) {
                    _dsm_channels = num_values;
                }
                _dsm_last_signal = systick_uptime();
#if 0
                HAP_PRINTF("Decoded DSM %u channels %u %u %u %u %u %u %u %u\n",
                           (unsigned)num_values,
                           values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7]);
#endif
            }
        }
    }
}



