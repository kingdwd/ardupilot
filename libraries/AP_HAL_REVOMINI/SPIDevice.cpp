/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-
#include <AP_HAL/AP_HAL.h>



#include <spi.h>
#include "Semaphores.h"

#include <inttypes.h>
#include <vector>
#include <AP_HAL/HAL.h>
#include <AP_HAL/SPIDevice.h>

#include "Scheduler.h"
#include <spi.h>
#include <boards.h>

#pragma GCC push_options
#pragma GCC optimize ("O0")


#include "SPIDevice.h"
#include "GPIO.h"

//#pragma GCC pop_options

//#define SOFT_SPI 1


using namespace REVOMINI;


static const SPIDesc spi_device_table[] = {    // different SPI tables per board subtype
    BOARD_SPI_DEVICES
};

#define REVOMINI_SPI_DEVICE_NUM_DEVICES (sizeof(spi_device_table)/sizeof(SPIDesc))

static const spi_pins board_spi_pins[] = {
    { // 0
        BOARD_SPI1_SCK_PIN,
        BOARD_SPI1_MISO_PIN,
        BOARD_SPI1_MOSI_PIN
    },
    { // 1
        BOARD_SPI2_SCK_PIN,
        BOARD_SPI2_MISO_PIN,
        BOARD_SPI2_MOSI_PIN
    },
    { //2
        BOARD_SPI3_SCK_PIN,
        BOARD_SPI3_MISO_PIN,
        BOARD_SPI3_MOSI_PIN
    }
};


REVOMINI::Semaphore SPIDevice::_semaphores[4] IN_CCM; // per bus+1


bool SPIDevice::bus_busy=false;


struct spi_trans SPIDevice::spi_trans_array[256]  IN_CCM;
uint8_t SPIDevice::spi_trans_ptr=0;


AP_HAL::OwnPtr<AP_HAL::SPIDevice>
SPIDeviceManager::get_device(const char *name)
{
    const SPIDesc *desc = nullptr;
    
    /* Find the bus description in the table */
    for (uint8_t i = 0; i < REVOMINI_SPI_DEVICE_NUM_DEVICES; i++) {
        if (!strcmp(spi_device_table[i].name, name)) {
            desc = &spi_device_table[i];
            break;
        }
    }
 
    if (!desc) {
        AP_HAL::panic("SPI: invalid device name");
    }

    return AP_HAL::OwnPtr<AP_HAL::SPIDevice>(new SPIDevice(*desc));
}


SPIDevice::SPIDevice(const SPIDesc &device_desc)
    : _desc(device_desc)
    , _initialized(false)
{
    if(_desc.cs_pin < BOARD_NR_GPIO_PINS) {
        _cs = REVOMINIGPIO::get_channel(_desc.cs_pin);
        if (!_cs) {
            AP_HAL::panic("Unable to instantiate cs pin");
        }
    } else {
        _cs = NULL;
    }
        
}        

const spi_pins* SPIDevice::dev_to_spi_pins(const spi_dev *dev) {
    if (     dev->SPIx == SPI1)
        return &board_spi_pins[0];
    else if (dev->SPIx == SPI2)
        return &board_spi_pins[1];
    else if (dev->SPIx == SPI3)
        return &board_spi_pins[2];
    else {
          assert_param(0);
          return NULL;
    }
}

spi_baud_rate SPIDevice::determine_baud_rate(SPIFrequency freq)
{

	spi_baud_rate rate;

	switch(freq) {
	case SPI_36MHZ:
		rate = SPI_BAUD_PCLK_DIV_2;
		break;
	case SPI_18MHZ:
		rate = SPI_BAUD_PCLK_DIV_4;
		break;
	case SPI_9MHZ:
		rate = SPI_BAUD_PCLK_DIV_8;
		break;
	case SPI_4_5MHZ:
		rate = SPI_BAUD_PCLK_DIV_16;
		break;
	case SPI_2_25MHZ:
		rate = SPI_BAUD_PCLK_DIV_32;
		break;
	case SPI_1_125MHZ:
		rate = SPI_BAUD_PCLK_DIV_64;
		break;
	case SPI_562_500KHZ:
		rate = SPI_BAUD_PCLK_DIV_128;
		break;
	case SPI_281_250KHZ:
		rate = SPI_BAUD_PCLK_DIV_256;
		break;
	case SPI_140_625KHZ:
		rate = SPI_BAUD_PCLK_DIV_256;
		break;
	default:
		rate = SPI_BAUD_PCLK_DIV_32;
		break;
	}
	return rate;
}





#define SCK_H       {sck_port->BSRRL = sck_pin; }
#define SCK_L       {sck_port->BSRRH = sck_pin; }

#define MOSI_H      {mosi_port->BSRRL = mosi_pin; }
#define MOSI_L      {mosi_port->BSRRH = mosi_pin; }

#define MISO_read   ((miso_port->IDR & miso_pin)!=0)

static volatile GPIO_TypeDef *sck_port;
static          uint16_t      sck_pin;

static volatile GPIO_TypeDef *mosi_port;
static          uint16_t      mosi_pin;

static volatile GPIO_TypeDef *miso_port;
static          uint16_t      miso_pin;

static uint16_t dly_time;
static void dly_spi() {
    delay_ns100(dly_time);
};




uint8_t SPIDevice::_transfer_s(uint8_t bt) {

    for(int ii = 0; ii < 8; ++ii) {
        if (bt & 0x80) {
            MOSI_H;
        } else {
            MOSI_L;
        }
        SCK_L;

        dly_spi();
        SCK_H;
         
        bt <<= 1;
        if (MISO_read) {
            bt |= 1;
        }
        dly_spi();
    }

    return bt;
}


/////////////// hardware


void SPIDevice::init(){
    if(_cs) {
        _cs->mode(OUTPUT);
        _cs_release();    // do not hold the SPI bus initially
    }

    const spi_pins *pins = dev_to_spi_pins(_desc.dev);

    if (!pins || pins->sck > BOARD_NR_GPIO_PINS || pins->mosi > BOARD_NR_GPIO_PINS || pins->miso > BOARD_NR_GPIO_PINS) {
        return;
    }


    if(_desc.soft) { //software
        const gpio_dev *sck_dev  = PIN_MAP[pins->sck].gpio_device;
              uint8_t   sck_bit  = PIN_MAP[pins->sck].gpio_bit;

        const gpio_dev *mosi_dev = PIN_MAP[pins->mosi].gpio_device;
              uint8_t   mosi_bit = PIN_MAP[pins->mosi].gpio_bit;

        const gpio_dev *miso_dev = PIN_MAP[pins->miso].gpio_device; 
              uint8_t   miso_bit = PIN_MAP[pins->miso].gpio_bit;

        gpio_set_mode(sck_dev,  sck_bit,  GPIO_OUTPUT_PP);
        gpio_set_mode(mosi_dev, mosi_bit, GPIO_OUTPUT_PP);
        gpio_set_mode(miso_dev, miso_bit, GPIO_INPUT_PU);

        gpio_write_bit(sck_dev,  sck_bit, 1); // passive SCK high

        sck_port = sck_dev->GPIOx;
        sck_pin  = 1<<sck_bit;

        mosi_port = mosi_dev->GPIOx;
        mosi_pin  = 1<<mosi_bit;

        miso_port = miso_dev->GPIOx;
        miso_pin  = 1<<miso_bit;


    } else { /// hardware
        spi_init(_desc.dev); // disable device

        spi_gpio_master_cfg(_desc.dev,
                    PIN_MAP[pins->sck].gpio_device, PIN_MAP[pins->sck].gpio_bit,
                    PIN_MAP[pins->miso].gpio_bit,   PIN_MAP[pins->mosi].gpio_bit);


        spi_master_enable(_desc.dev, determine_baud_rate(_desc.lowspeed), _desc.mode, MSBFIRST);         
    }
}


bool SPIDevice::set_speed(AP_HAL::Device::Speed speed)
{

    if(!_initialized) {
        init();
        _initialized=true;
    }

    switch (speed) {
    case AP_HAL::Device::SPEED_HIGH:
        _speed = _desc.highspeed;
        break;
    case AP_HAL::Device::SPEED_LOW:
    default:
        _speed = _desc.lowspeed;
        break;
    }

    return true;
}



uint8_t SPIDevice::_transfer(uint8_t data) {
    uint8_t buf[1];

    //write 1byte
    spi_tx(_desc.dev, &data, 1);

    //read one byte
    while (!spi_is_rx_nonempty(_desc.dev))
            ;
    buf[0] = (uint8_t)spi_rx_reg(_desc.dev);
    return buf[0];
}


    

bool SPIDevice::transfer(const uint8_t *send, uint32_t send_len, uint8_t *recv, uint32_t recv_len){
    if(bus_busy) {
        return false;
    }
    
    int ret=0;

    bus_busy = true;
    _cs_assert();

    if(_desc.soft) {
        uint16_t rate;

        switch(_speed) {
        case SPI_36MHZ:
        case SPI_18MHZ:
        case SPI_9MHZ:
        case SPI_4_5MHZ:
            rate = 1;
            break;
        case SPI_2_25MHZ:
            rate = 2;
	    break;
        case SPI_1_125MHZ:
	    rate = 4; // 400 ns delay
	    break;
        case SPI_562_500KHZ:
	    rate = 8;
	    break;
        case SPI_281_250KHZ:
	    rate = 16;
	    break;
        case SPI_140_625KHZ:
        default:
	    rate = 32;
	    break;
        }

        dly_time = rate; 

        if (send != NULL && send_len) {
            for (uint16_t i = 0; i < send_len; i++) {
                _transfer_s(send[i]);
            }    
        } 
    
        if(recv !=NULL && recv_len) {
            for (uint16_t i = 0; i < recv_len; i++) {
                recv[i] = _transfer_s(0);
            }
        }
    } else {
        spi_set_speed(_desc.dev, determine_baud_rate(_speed)); //- on cs_assert()

        ret = spimaster_transfer(_desc.dev, send, send_len, recv, recv_len);
    }

#if 0
    spi_trans_array[spi_trans_ptr].dev      = _desc.dev;
    spi_trans_array[spi_trans_ptr].send_len = send_len;
    if(send_len)
      spi_trans_array[spi_trans_ptr].sent = send[0];
    else spi_trans_array[spi_trans_ptr].sent = 0;
    if(send_len>1)
      spi_trans_array[spi_trans_ptr].sent1 = send[1];
    else spi_trans_array[spi_trans_ptr].sent1 = 0;
    spi_trans_array[spi_trans_ptr].recv_len = recv_len;
    if(recv_len)
      spi_trans_array[spi_trans_ptr].recv0 = recv[0];
    else spi_trans_array[spi_trans_ptr].recv0 = 0;
    if(recv_len>1)
      spi_trans_array[spi_trans_ptr].recv1 = recv[1];
    else spi_trans_array[spi_trans_ptr].recv1 = 0;
    
    spi_trans_ptr++;
#endif
    _cs_release();
    
    bus_busy = false;
    
    return ret==0;

}


bool SPIDevice::transfer_fullduplex(const uint8_t *send, uint8_t *recv, uint32_t len) {

    _cs_assert();

    if(_desc.soft) {
        if (send != NULL && recv !=NULL && len) {
            for (uint16_t i = 0; i < len; i++) {
                recv[i] = _transfer_s(send[i]);
            }    
        } 
    } else {
        spi_set_speed(_desc.dev, determine_baud_rate(_speed)); //- on cs_assert()

        if (send != NULL && recv !=NULL && len) {
            for (uint16_t i = 0; i < len; i++) {
                recv[i] = _transfer(send[i]);
            }    
        } 
    }
    _cs_release();
    return true;
}

