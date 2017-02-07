#ifndef __AP_HAL_REVOMINI_RCINPUT_H__
#define __AP_HAL_REVOMINI_RCINPUT_H__

#pragma GCC push_options
#pragma GCC optimize ("O2")
#include <AP_HAL/AP_HAL.h>
#pragma GCC pop_options

#include "AP_HAL_REVOMINI.h"
#include "UARTDriver.h"
#include <usart.h>

#define REVOMINI_RC_INPUT_MIN_CHANNELS 4
#define REVOMINI_RC_INPUT_NUM_CHANNELS 20


#ifndef BOARD_SPEKTRUM_RX_PIN
 #ifdef BOARD_DSM_USART
    #define BOARD_SPEKTRUM_RX_PIN (BOARD_DSM_USART.rx_pin)
 #endif
#endif

enum BOARD_RC_MODE {
    BOARD_RC_NONE=0,
    BOARD_RC_SBUS,
    BOARD_RC_DSM,
};

enum BOARD_LAST_INPUT {
    BOARD_INPUT_NONE=0,
    BOARD_INPUT_DSM,
    BOARD_INPUT_P0,
    BOARD_INPUT_P1,
};



// helper class with all parsers to localize all internal data
class REVOMINI::PPM_parser {
public:
    PPM_parser()
        : last_signal(0)
        , _ch(0)
        , _got_ppm(false)
        , _got_dsm(false)
        , _was_ppm(false)
        , _was_dsm(false)
        , _rc_mode(BOARD_RC_NONE)
        , last_change(0)
     {}

    void init(uint8_t ch);

    volatile uint64_t last_signal;
    volatile uint16_t val[REVOMINI_RC_INPUT_NUM_CHANNELS];
    volatile uint8_t valid_channels;
    volatile uint64_t last_change;

protected:
    void parse_pulses(void);

private:

    void rxIntRC(uint16_t value0, uint16_t value1, bool state);

    bool _process_ppmsum_pulse(uint16_t value);
    void _process_dsm_pulse(uint16_t width_s0, uint16_t width_s1);
    void _process_sbus_pulse(uint16_t width_s0, uint16_t width_s1);


    void add_dsm_input();  // add some DSM input bytes, for RCInput over a PPMSUM line
    void add_sbus_input(); // add some SBUS input bytes, for RCInput over a PPMSUM line

    uint8_t _ch;

    Pulse last_pulse;
    uint8_t channel_ctr;

    bool _got_ppm;
    bool _got_dsm;

    bool _was_ppm; 
    bool _was_dsm;

    // state of add_dsm_input
    struct DSM {
        uint8_t frame[16];
        uint8_t partial_frame_count;
        uint64_t last_input_ms;
    } dsm;

    // state of add_sbus_input
    struct SBUS {
        uint8_t frame[26];
        uint8_t partial_frame_count;
        uint32_t last_input_ms;
    } sbus;
    
    
    // state of SBUS bit decoder
    struct SbusState {
        uint16_t bytes[25]; // including start bit, parity and stop bits
        uint16_t bit_ofs;
    } sbus_state;

    // state of DSM bit decoder
    struct DSM_State {
        uint16_t bytes[16]; // including start bit and stop bit
        uint16_t bit_ofs;
    } dsm_state;

    enum BOARD_RC_MODE _rc_mode;    
};






class REVOMINI::REVOMINIRCInput : public AP_HAL::RCInput {
public:
    REVOMINIRCInput();
    void init()  override;

    uint16_t read(uint8_t ch) override;
    uint8_t  read(uint16_t* periods, uint8_t len) override;
    
    bool     new_input() override;
    uint8_t  num_channels() override;

    bool set_overrides(int16_t *overrides, uint8_t len) override;
    bool set_override(uint8_t channel, int16_t override) override;
    void clear_overrides() override;
    
    bool rc_bind(int dsmMode) override;
    
private:
    static PPM_parser parsers[];
    
    static bool is_PPM;

    static uint64_t _last_read;
    static uint8_t  _valid_channels;


    uint16_t _read_dsm(uint8_t ch);
    uint16_t _read_ppm(uint8_t ch,uint8_t n);
    
    static uint16_t last_4;
    
    /* override state */
    static uint16_t _override[8];
    static bool _override_valid;
    
#ifdef BOARD_SPEKTRUM_RX_PIN
    static REVOMINIUARTDriver uartSDriver; 
    static volatile uint64_t _dsm_last_signal;
    static volatile uint16_t _dsm_val[REVOMINI_RC_INPUT_NUM_CHANNELS];
    static volatile uint8_t  _dsm_channels;
    static uint64_t last_dsm_change;

    static void add_dsm_uart_input(); // add some DSM input bytes, for RCInput over a serial port
    
    static struct DSM { // state of add_dsm_uart_input
        uint8_t frame[16];
        uint8_t partial_frame_count;
        uint64_t last_input_ms;
    } dsm;

    static void _rc_bind(uint16_t dsmMode);    
#endif

    static enum BOARD_LAST_INPUT  _last_read_from;
    
};

#endif // __AP_HAL_REVOMINI_RCINPUT_H__
