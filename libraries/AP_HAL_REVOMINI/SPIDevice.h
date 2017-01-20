/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-
/*
 * Copyright (C) 2015  Intel Corporation. All rights reserved.
 *
 * This file is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#pragma once

/*
#include <inttypes.h>
#include <vector>


#include <AP_HAL/SPIDevice.h>

#include "Scheduler.h"
#include <spi.h>
#include <boards.h>
*/

#include <AP_HAL/HAL.h>
#include "Semaphores.h"

namespace REVOMINI {


typedef enum SPIFrequency {
    SPI_18MHZ       = 0, /**< 18 MHz */
    SPI_9MHZ        = 1, /**< 9 MHz */
    SPI_4_5MHZ      = 2, /**< 4.5 MHz */
    SPI_2_25MHZ     = 3, /**< 2.25 MHz */
    SPI_1_125MHZ    = 4, /**< 1.125 MHz */
    SPI_562_500KHZ  = 5, /**< 562.500 KHz */
    SPI_281_250KHZ  = 6, /**< 281.250 KHz */
    SPI_140_625KHZ  = 7, /**< 140.625 KHz */
} SPIFrequency;


struct spi_pins {
    uint8_t sck;
    uint8_t miso;
    uint8_t mosi;
};

struct SPIDesc {
    const char * const name;
    const spi_dev * const dev;
    const uint8_t bus;
    const spi_mode mode;
    const int16_t cs_pin;
    const SPIFrequency lowspeed;
    const SPIFrequency highspeed;
};


struct spi_trans {
    const spi_dev *dev;
    uint32_t send_len;
    uint8_t  sent;
    uint8_t  sent1;
    uint32_t recv_len;
    uint8_t  recv0;
    uint8_t  recv1;
};

class SPIDevice : public AP_HAL::SPIDevice {
public:
    SPIDevice(const SPIDesc &device_desc);

    ~SPIDevice() {}

    /* AP_HAL::SPIDevice implementation */

    /* See AP_HAL::Device::set_speed() */
    bool set_speed(AP_HAL::Device::Speed speed) override;

    /* See AP_HAL::Device::transfer() */
    bool transfer(const uint8_t *send, uint32_t send_len,
                        uint8_t *recv, uint32_t recv_len) override;

    /* See AP_HAL::SPIDevice::transfer_fullduplex() */
    bool transfer_fullduplex(const uint8_t *send, uint8_t *recv, uint32_t len) override;

    /* See AP_HAL::Device::get_semaphore() */
    inline AP_HAL::Semaphore *get_semaphore() { return &_semaphores[_desc.bus]; }

    /* See AP_HAL::Device::register_periodic_callback() */
    inline AP_HAL::Device::PeriodicHandle register_periodic_callback(
        uint32_t period_usec, AP_HAL::Device::PeriodicCb proc) override
    {
        return REVOMINIScheduler::register_timer_task(period_usec, proc, &_semaphores[_desc.bus]);
    }


    bool adjust_periodic_callback(AP_HAL::Device::PeriodicHandle h, uint32_t period_usec) override
    {
        return REVOMINIScheduler::adjust_timer_task(h, period_usec);
    }

    bool unregister_callback(PeriodicHandle h) { return REVOMINIScheduler::unregister_timer_task(h); }

    bool set_chip_select(bool set) override {
#if 0
        if(set) _cs_assert();
        else    _cs_release();
        
        return true;
#else
        return false;
#endif
    }


protected:
    const SPIDesc &_desc;

    AP_HAL::DigitalSource *_cs;
    SPIFrequency _speed;

    static REVOMINI::Semaphore _semaphores[3]; // per bus

    bool _initialized;
    void init(void);

    inline void _cs_assert(){                    _cs->write(0); delay_ns100(1); } // Select device and wait a little
    inline void _cs_release(){  delay_ns100(5);  _cs->write(1); } // Deselect device, time from http://datasheetspdf.com/mobile/735133/MPU-6000.html page 19

    const spi_pins* dev_to_spi_pins(const spi_dev *dev);

    spi_baud_rate determine_baud_rate(SPIFrequency freq);

    uint8_t _transfer(uint8_t data);
    
    static bool bus_busy;
    
    static struct spi_trans spi_trans_array[256];
    static uint8_t spi_trans_ptr;
};

class SPIDeviceManager : public AP_HAL::SPIDeviceManager {
public:
    friend class SPIDevice;

    SPIDeviceManager(){ }

    AP_HAL::OwnPtr<AP_HAL::SPIDevice> get_device(const char *name);

protected:

};

}
