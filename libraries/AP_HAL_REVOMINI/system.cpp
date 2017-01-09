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

    for(;;);
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

