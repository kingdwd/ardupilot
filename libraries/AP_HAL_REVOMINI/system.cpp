#include <stdarg.h>
#include <stdio.h>

#include <AP_HAL/AP_HAL.h>
#include <AP_HAL/system.h>

#include "Scheduler.h"
//#include "wirish/wirish.h"

extern const AP_HAL::HAL& hal;

using namespace REVOMINI;

namespace AP_HAL {

void init()
{
}

void panic(const char *errormsg, ...)
{
    /* Suspend timer processes. We still want the timer event to go off
     * to run the _failsafe code, however. */
    // REVISIT: not tested on FLYMAPLE
    va_list ap;

    hal.scheduler->suspend_timer_procs();

    va_start(ap, errormsg);
    hal.console->vprintf(errormsg, ap);
    va_end(ap);
    hal.console->printf("\n");


    if(is_bare_metal())  // bare metal build without bootloader should reboot to DFU after any fault
        board_set_rtc_register(DFU_RTC_SIGNATURE, RTC_SIGNATURE_REG);

//    for(;;);
    error_throb(0);

/*
    int16_t  slope   = 1;
    uint16_t CC      = 0x0000;
    uint16_t TOP_CNT = 0x0200;
    uint16_t i       = 0;
    uint8_t n;


    // Error fade. 
    while (1) {
        if (CC == TOP_CNT)  {
            slope = -1;
        } else if (CC == 0) {
            slope = 1;
        }

        if (i == TOP_CNT)  {
            CC += slope;
            i = 0;
        }

        if (i < CC) {
            n=1;
        } else {
            n=0;
        }
        gpio_write_bit(PIN_MAP[HAL_GPIO_A_LED_PIN].gpio_device, PIN_MAP[HAL_GPIO_A_LED_PIN].gpio_bit, n);
        i++;
    } */

}

uint32_t millis()
{
    // Use function provided by libmaple.
    return REVOMINIScheduler::_millis();
}

uint64_t millis64(){
    return REVOMINIScheduler::_millis64();
}

uint32_t micros() {
    return REVOMINIScheduler::_micros();
}

uint64_t micros64(){
    return REVOMINIScheduler::_micros64();
}

} // namespace AP_HAL

