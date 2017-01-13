
#ifndef __AP_HAL_REVOMINI_CLASS_H__
#define __AP_HAL_REVOMINI_CLASS_H__

#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>

#if CONFIG_HAL_BOARD == HAL_BOARD_REVOMINI
#include <AP_Param/AP_Param.h>

#include "AP_HAL_REVOMINI_Namespace.h"
#include <wirish.h>
#include <hal.h>


class HAL_REVOMINI : public AP_HAL::HAL {
public:
    HAL_REVOMINI();
    void run(int argc, char * const argv[], Callbacks* callbacks) const override;

    void lateInit(); // 2nd stage

private:

    // parameters in hal_param_helper

};



#endif // __AP_HAL_REVOMINI_CLASS_H__
#endif // __HAL_BOARD_REVOMINI__
