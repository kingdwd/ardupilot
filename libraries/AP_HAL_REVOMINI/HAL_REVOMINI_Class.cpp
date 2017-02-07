
#include <AP_HAL/AP_HAL.h>
#if CONFIG_HAL_BOARD == HAL_BOARD_REVOMINI

#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>
#include "AP_HAL_REVOMINI_Namespace.h"
#include "AP_HAL_REVOMINI_Private.h"
#include "HAL_REVOMINI_Class.h"
#include "Util.h"
#include <assert.h>
#include <AP_HAL_Empty/AP_HAL_Empty.h>
#include <AP_HAL_Empty/AP_HAL_Empty_Private.h>

#if defined(USE_SOFTSERIAL)
#include "UART_SoftDriver.h"
#endif


using namespace AP_HAL;
using namespace REVOMINI;


static REVOMINI::I2CDeviceManager i2c_mgr_instance;

// XXX make sure these are assigned correctly
static USBDriver USB_Driver(1);                 // ACM
static REVOMINIUARTDriver uart1Driver(_USART1); // main port
static REVOMINIUARTDriver uart3Driver(_USART3); // flexi port
static REVOMINIUARTDriver uart6Driver(_USART6); // pin 7&8(REVO)/5&6(RevoMini) of input port
#if FRAME_CONFIG == QUAD_FRAME && defined( BOARD_USART4_RX_PIN) && defined( BOARD_USART4_TX_PIN)
static REVOMINIUARTDriver uart4Driver(_UART4);  // pin 5&6 of servo port
#endif




#ifdef USE_SOFTSERIAL
static SerialDriver softDriver(false);  // pin 7&8 of input port
#endif

// only for DSM satellite, served in rc_input
//static REVOMINIUARTDriver uart5Driver(_UART5,0);  // D26/PD2  6 EXTI_RFM22B / UART5_RX  input-only UART for DSM satellite

/*
        input port pinout
        1    2    3    4    5    6    7   8
pin              b14  b15  c6   c7   c8   c9
       gnd  vcc  PPM  buzz 6_tx 6_rx Sscl Ssda
USE_SOFTSERIAL ->                    S_tx S_rx
*/


/* OPLINK AIR port pinout
1       2       3       4       5       6       7
                        
gnd    +5      26      103                     
               rx      pow
*/

static REVOMINI::SPIDeviceManager spiDeviceManager;
static REVOMINIAnalogIn  analogIn;
static REVOMINIStorage   storageDriver;
static REVOMINIGPIO      gpioDriver;
static REVOMINIRCInput   rcinDriver;
static REVOMINIRCOutput  rcoutDriver;
static REVOMINIScheduler schedulerInstance;
static REVOMINIUtil      utilInstance;



/*
        AP_HAL::UARTDriver* _uartA, // console
        AP_HAL::UARTDriver* _uartB, // 1st GPS
        AP_HAL::UARTDriver* _uartC, // telem1
        AP_HAL::UARTDriver* _uartD, // telem2
        AP_HAL::UARTDriver* _uartE, // 2nd GPS
        AP_HAL::UARTDriver* _uartF, // extra1
*/
HAL_REVOMINI::HAL_REVOMINI() :
    AP_HAL::HAL(
        &USB_Driver,   /* uartA - USB console */
        &uart6Driver,  /* uartD - pin 7&8(REVO)/5&6(RevoMini) of input port - for GPS */
        &uart1Driver,  /* uartB - main port  - for telemetry */
        &uart3Driver,  /* uartC - flexi port - for OSD */
#if FRAME_CONFIG == QUAD_FRAME && defined(BOARD_USART4_RX_PIN)
        &uart4Driver,  /* uartE  - PWM pins 5&6 */
#else
        NULL,          /* no uartE */
#endif
#if defined(USE_SOFTSERIAL) && defined(BOARD_SOFTSERIAL_TX) && defined(BOARD_SOFTSERIAL_RX)
        &softDriver,   /* uartF */
#else
        NULL,          /* no uartF */
#endif
        &i2c_mgr_instance,
        &spiDeviceManager, /* spi */
        &analogIn,      /* analogin */
        &storageDriver, /* storage */
        &USB_Driver,    /* console */
        &gpioDriver,    /* gpio */
        &rcinDriver,    /* rcinput */
        &rcoutDriver,   /* rcoutput */
        &schedulerInstance, /* scheduler */
        &utilInstance,	 /* util */
        NULL /* no optical flow */
    ) 

{}

extern const AP_HAL::HAL& hal;


void HAL_REVOMINI::run(int argc,char* const argv[], Callbacks* callbacks) const
{
    assert(callbacks);

    /* initialize all drivers and private members here.
     * up to the programmer to do this in the correct order.
     * Scheduler should likely come first. */

    scheduler->init();

    gpio->init();

    rcout->init(); 

    extern void usb_init();
    usb_init(); // moved from boards.cpp

    /* uartA is the USB serial port used for the console, so lets make sure it is initialized at boot */
    uartA->begin(115200); 

    rcin->init();

    storage->init(); // Uses EEPROM.*, flash_stm* reworked
    analogin->init();

    callbacks->setup();

#if 0 //[ here is too late :( so we need a small hack and call lateInit from REVOMINIScheduler::register_delay_callback 
//         which called when parameters already initialized
    
    REVOMINIRCOutput::lateInit(_motor_layout); // 2nd stage - now with loaded parameters
#endif //]

    scheduler->system_initialized(); // clear bootloader flag

    for (;;) {
        callbacks->loop();
        ((REVOMINI::REVOMINIScheduler *)scheduler)->loop(); // to execute stats in main loop
//        ((REVOMINI::REVOMINIRCInput *)rcin)->loop(); // to execute debug in main loop
    }
}

void HAL_REVOMINI::lateInit() {
    REVOMINIRCOutput::lateInit(1); // 2nd stage - now with loaded parameters
}

const AP_HAL::HAL& AP_HAL::get_HAL() {
    static const HAL_REVOMINI hal_revo;
    return hal_revo;
}


#endif
