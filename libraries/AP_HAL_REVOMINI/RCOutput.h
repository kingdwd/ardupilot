#pragma once

#include "AP_HAL_REVOMINI_Namespace.h"
#include <timer.h>


#include <AP_HAL/RCOutput.h>

#include "AP_HAL_REVOMINI.h"
#include "GPIO.h"
#include <AP_HAL/HAL.h>


#define PWM_IGNORE_THIS_CHANNEL 1

#define REVOMINI_MAX_OUTPUT_CHANNELS 12


enum BOARD_PWM_MODES {
    BOARD_PWM_NORMAL=0,
    BOARD_PWM_ONESHOT,
    BOARD_PWM_ONESHOT125,
    BOARD_PWM_BRUSHED16KHZ,
    BOARD_PWM_ONESHOT42,
};

#define MOTORID1 0
#define MOTORID2 1
#define MOTORID3 2
#define MOTORID4 3
#define MOTORID5 4
#define MOTORID6 5
#define MOTORID7 6
#define MOTORID8 7
#define MOTORID9 8
#define MOTORID10 9
#define MOTORID11 10
#define MOTORID12 11


class REVOMINI::REVOMINIRCOutput : public AP_HAL::RCOutput {
public:
    void     init() override;
    void     set_freq(uint32_t chmask, uint16_t freq_hz) override;
    uint16_t get_freq(uint8_t ch) override;
    void     enable_ch(uint8_t ch) override;
    void     disable_ch(uint8_t ch) override;
    void     write(uint8_t ch, uint16_t period_us) override;
    void     write(uint8_t ch, uint16_t* period_us, uint8_t len);
    uint16_t read(uint8_t ch) override;
    void     read(uint16_t* period_us, uint8_t len) override;
    
    void cork() override{ _corked = true; }
    void push() override;
    
    static void    lateInit(uint8_t map); // 2nd stage with loaded parameters
    
    void set_output_mode(enum output_mode mode) override;
    
/*
    void     set_safety_pwm(uint32_t chmask, uint16_t period_us) override;
    void     set_failsafe_pwm(uint32_t chmask, uint16_t period_us) override;
    bool     force_safety_on(void) override;
    void     force_safety_off(void) override;
    void     force_safety_no_wait(void) override;
    void     set_esc_scaling(uint16_t min_pwm, uint16_t max_pwm) override {
        _esc_pwm_min = min_pwm;
        _esc_pwm_max = max_pwm;
    }

    void _timer_tick(void);
    bool enable_sbus_out(uint16_t rate_hz) override;
*/

private:
    static void InitPWM(void);
    static void set_pwm(uint8_t ch, uint16_t pwm);
    static uint32_t _timer_period(uint16_t speed_hz);
    static uint16_t _period[REVOMINI_MAX_OUTPUT_CHANNELS];
    static uint16_t _enabled_channels;
    static bool _sbus_enabled;
    static bool _corked;
    static bool _need_update;
    static void _init_alt_channels() {}// we don't has channels more than 8
    static uint8_t _used_channels;
    static enum BOARD_PWM_MODES _mode;
    static bool _once_mode;
    
    static uint32_t _timer_frequency[REVOMINI_MAX_OUTPUT_CHANNELS];
    
    static void _timer3_isr_event(TIM_TypeDef*);

    static uint32_t _timer2_preload;
    static uint16_t _timer3_preload;

    static bool _timer3_2flag;


};

