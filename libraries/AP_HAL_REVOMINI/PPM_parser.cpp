#include <exti.h>
#include <timer.h>
#include "RCInput.h"
#include <pwm_in.h>
#include <AP_HAL/utility/dsm.h>
#include "sbus.h"
#include "GPIO.h"
#include "ring_buffer_pulse.h"


using namespace AP_HAL;
using namespace REVOMINI;


extern const AP_HAL::HAL& hal;


void PPM_parser::init(uint8_t ch){
    memset((void *)&val[0], 0, sizeof(val));
    last_pulse={0,0};
    channel_ctr=0;
    
    _ch = ch + 1;
    hal.scheduler->register_timer_process(FUNCTOR_BIND_MEMBER(&PPM_parser::parse_pulses,void));
}


void PPM_parser::parse_pulses(){
    if(_ch==0) return; // not initialized

    Pulse p;

    while( getPPM_Pulse(&p, _ch-1)){
// addHist(p.length);
        rxIntRC(last_pulse.length, p.length, p.state);
        last_pulse = p;
    }

}


void PPM_parser::rxIntRC(uint16_t value0, uint16_t value1, bool state)
{

    if(state && _rc_mode!=BOARD_RC_SBUS) { // falling and not SBUS detected
        if(_rc_mode==BOARD_RC_DSM || !_process_ppmsum_pulse( (value0 + value1) >>1 ) ) { // process PPM only if no DSM detected

            // not PPM - try treat as DSM
            _process_dsm_pulse(value0>>1, value1>>1);
        }
    } else { // rising
            // try treat as SBUS
            _process_sbus_pulse(value1>>1, value0>>1); // was 0 so now is length of 0, last is a length of 1
    }
}


bool PPM_parser::_process_ppmsum_pulse(uint16_t value)
{
    if (value >= 2700) { // Frame synchronization
	if( channel_ctr >= REVOMINI_RC_INPUT_MIN_CHANNELS ) {
	    valid_channels = channel_ctr;
	}
	channel_ctr = 0;
	_got_ppm=true;

        return true;	    
    } else if(value > 700 && value < 2300) {
        if (channel_ctr < REVOMINI_RC_INPUT_NUM_CHANNELS) {
    	    last_signal =  systick_uptime();
            val[channel_ctr] = value;

            channel_ctr++;
            if (channel_ctr >= REVOMINI_RC_INPUT_NUM_CHANNELS) {
                valid_channels = REVOMINI_RC_INPUT_NUM_CHANNELS;
            }
        }
        return true;
    } else { // try another protocols
        return false;
    }
}





/*
  process a SBUS input pulse of the given width
  
  pulses are captured on each edges and SBUS parser called on rising edge
  
*/
 
void PPM_parser::_process_sbus_pulse(uint16_t width_s0, uint16_t width_s1)
{
    // convert to bit widths, allowing for up to 4usec error, assuming 100000 bps - inverted
    uint16_t bits_s0 = (width_s0+4) / 10;
    uint16_t bits_s1 = (width_s1+4) / 10;

    uint8_t byte_ofs = sbus_state.bit_ofs/12;
    uint8_t bit_ofs  = sbus_state.bit_ofs%12;
    uint16_t nlow;

//hal.console->printf("\np %d\\%d", bits_s0, bits_s1);


    if (bits_s1 == 0 || bits_s0 == 0) {
        // invalid data
//hal.console->printf("\nreset 0");
        goto reset;
    }

//hal.console->printf("\nb %d.%d",  byte_ofs,  bit_ofs);

    if (bits_s1+bit_ofs > 10) { // invalid data as last two bits must be stop bits
//hal.console->printf("\nreset 1");
        goto reset;
    }
        

    // pull in the high bits
    sbus_state.bytes[byte_ofs] |= ((1U<<bits_s1)-1) << bit_ofs;
    sbus_state.bit_ofs += bits_s1;
    bit_ofs += bits_s1;

    // pull in the low bits
    nlow = bits_s0;
    if (nlow + bit_ofs > 12) {
        nlow = 12 - bit_ofs;
    }
    bits_s0 -= nlow;
    sbus_state.bit_ofs += nlow;

//hal.console->printf(" v=%x",  sbus_state.bytes[byte_ofs]);

    if (sbus_state.bit_ofs == 25*12 && bits_s0 > 12) { // all frame got and was gap
        // we have a full frame
        uint8_t bytes[25];
        uint16_t i;

//hal.console->printf("\ngot frame");

        for (i=0; i<25; i++) {
            // get inverted data
            uint16_t v = ~sbus_state.bytes[i];
    
            if ((v & 1) != 0) {        // check start bit
//hal.console->printf("\nreset 3");
                goto reset;
            }
            
            if ((v & 0xC00) != 0xC00) {// check stop bits
//hal.console->printf("\nreset 4 %d", i);
                goto reset;
            }
            // check parity
            uint8_t parity = 0, j;
            for (j=1; j<=8; j++) {
                parity ^= (v & (1U<<j))?1:0;
            }
            if (parity != (v&0x200)>>9) {
//hal.console->printf("\nreset 5  %d", i);
                goto reset;
            }
            bytes[i] = ((v>>1) & 0xFF);
        }

//hal.console->printf("\nframe");

        uint16_t values[REVOMINI_RC_INPUT_NUM_CHANNELS];
        uint16_t num_values=0;
        bool sbus_failsafe=false, sbus_frame_drop=false;


        if (sbus_decode(bytes, values, &num_values,
                        &sbus_failsafe, &sbus_frame_drop,
                        REVOMINI_RC_INPUT_NUM_CHANNELS) &&
            num_values >= REVOMINI_RC_INPUT_MIN_CHANNELS) 
        {

//hal.console->printf(" OK");

            for (i=0; i<num_values; i++) {
                val[i] = values[i];
            }
            valid_channels = num_values;
            
            _rc_mode = BOARD_RC_SBUS; // lock input mode, SBUS has a parity and other checks so false positive is unreal
            
            if (!sbus_failsafe) {
                _got_dsm = true;
                last_signal = systick_uptime();
            }
        }
        goto reset_ok;
    } else if (bits_s0 > 12) { // Was inter-frame gap but not full frame 
//hal.console->printf("\nreset 6");
        goto reset;
    }
    return;
reset:
//    hal.console->printf("\nreset");

reset_ok:
    memset(&sbus_state, 0, sizeof(sbus_state));
}



/*
  process a DSM satellite input pulse of the given width
  
  pulses are captured on each edges and DSM parser called on falling edge - eg. beginning of start bit
  
*/

void PPM_parser::_process_dsm_pulse(uint16_t width_s0, uint16_t width_s1)
{
    // convert to bit widths, allowing for up to 1usec error, assuming 115200 bps
    uint16_t bits_s0 = ((width_s0+4)*(uint32_t)115200) / 1000000;
    uint16_t bits_s1 = ((width_s1+4)*(uint32_t)115200) / 1000000;
    uint8_t bit_ofs, byte_ofs;
    uint16_t nbits;

    if (bits_s0 == 0 || bits_s1 == 0) {
        // invalid data
        goto reset;
    }

    byte_ofs = dsm_state.bit_ofs/10;
    bit_ofs = dsm_state.bit_ofs%10;

    if(byte_ofs > 15) {
        // invalid data
        goto reset;
    }

    // pull in the high bits
    nbits = bits_s0;
    if (nbits+bit_ofs > 10) {
        nbits = 10 - bit_ofs;
    }
    dsm_state.bytes[byte_ofs] |= ((1U<<nbits)-1) << bit_ofs;
    dsm_state.bit_ofs += nbits;
    bit_ofs += nbits;


    if (bits_s0 - nbits > 10) {
        if (dsm_state.bit_ofs == 16*10) {
            // we have a full frame
            uint8_t bytes[16];
            uint8_t i;
            for (i=0; i<16; i++) {
                // get raw data
                uint16_t v = dsm_state.bytes[i];

                // check start bit
                if ((v & 1) != 0) {
                    goto reset;
                }
                // check stop bits
                if ((v & 0x200) != 0x200) {
                    goto reset;
                }
                bytes[i] = ((v>>1) & 0xFF);
            }
            uint16_t values[8];
            uint16_t num_values=0;
            if (dsm_decode(AP_HAL::micros64(), bytes, values, &num_values, 8) &&
                num_values >= REVOMINI_RC_INPUT_MIN_CHANNELS) {

                _rc_mode = BOARD_RC_DSM; // lock input mode, DSM has a checksum so false positive is unreal

                for (i=0; i<num_values; i++) {
                    val[i] = values[i];
                }
                valid_channels = num_values;
                _got_dsm = true;
                last_signal = systick_uptime();
            }
        }
        memset(&dsm_state, 0, sizeof(dsm_state));
    }

    byte_ofs = dsm_state.bit_ofs/10;
    bit_ofs  = dsm_state.bit_ofs%10;

    if (bits_s1+bit_ofs > 10) {
        // invalid data
        goto reset;
    }

    // pull in the low bits
    dsm_state.bit_ofs += bits_s1;
    return;
reset:
    memset(&dsm_state, 0, sizeof(dsm_state));
}


