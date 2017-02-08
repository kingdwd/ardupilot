/*
 * UARTDriver.cpp --- AP_HAL_REVOMINI UART driver.
 *
 * Copyright (C) 2013, Virtualrobotix.com Roberto Navoni , Emile 
 * All Rights Reserved.
 *
 * This software is released under the "BSD3" license.  Read the file
 * "LICENSE" for more information.
 */

#include <AP_HAL/AP_HAL.h>

#if CONFIG_HAL_BOARD == HAL_BOARD_REVOMINI
#include "USBDriver.h"

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <usb.h>
#include <gpio_hal.h>
#include "Scheduler.h"

using namespace REVOMINI;

extern const AP_HAL::HAL& hal;

extern void delay(uint32_t ms);


USBDriver::USBDriver(bool usb):
    _usb_present(usb),
    _initialized(false),
    _blocking(false)
{
}

void USBDriver::begin(uint32_t baud) {

    _usb_present = gpio_read_bit(PIN_MAP[BOARD_USB_SENSE].gpio_device,PIN_MAP[BOARD_USB_SENSE].gpio_bit);

    _initialized = true;
}



/* REVOMINI implementations of Stream virtual methods */

int16_t USBDriver::read() {
    if(_usb_present && is_usb_opened() ){
	if (usb_data_available() <= 0)
	    return (-1);
	return usb_getc();
    }
    return 0;
}

/* REVOMINI implementations of Print virtual methods */
size_t USBDriver::write(uint8_t c) {

    if(_usb_present && is_usb_opened()){
        uint8_t n;
        if(_blocking){
            while(!(n=usb_putc(c)) ) ;
            return n;
        }else {
            usb_putc(c);
            return 1;
        }
    }
    return 0;
}

size_t USBDriver::write(const uint8_t *buffer, size_t size)
{
    size_t n = 0;
    uint32_t t = REVOMINIScheduler::_millis();

    if(_usb_present && is_usb_opened()){
        while (size) {
//                n += write(*buffer++);
            uint8_t k=usb_write((uint8_t *)buffer, size);
            size-=k;
            n+=k;
            buffer+=k;
            
            if(!_blocking  && (REVOMINIScheduler::_millis() - t > 300) ){
                reset_usb_opened();
                return size;
            }
        }
    }
    return n;

}

#endif // CONFIG_HAL_BOARD

