
#ifndef __AP_HAL_REVOMINI_CLASS_H__
#define __AP_HAL_REVOMINI_CLASS_H__


#if CONFIG_HAL_BOARD == HAL_BOARD_REVOMINI

#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>
//#include "AP_HAL_REVOMINI_Namespace.h"

#include <AP_Param/AP_Param.h>

//#include "RCOutput.h"
#include <wirish.h>
#include <hal.h>
#include "USBDriver.h"
//#include "I2CDevice.h"
#include <pwm_in.h>
#include <usart.h>
#include <i2c.h>
#include <spi.h>


class HAL_REVOMINI : public AP_HAL::HAL {
public:
    HAL_REVOMINI();
    void run(int argc, char * const argv[], Callbacks* callbacks) const override;

    static void lateInit();

private:

    // parameters in hal_param_helper

};



#endif // __AP_HAL_REVOMINI_CLASS_H__
#endif // __HAL_BOARD_REVOMINI__
