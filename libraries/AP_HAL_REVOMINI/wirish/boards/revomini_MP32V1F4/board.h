#ifndef _BOARD_STM32V1F4_H_
#define _BOARD_STM32V1F4_H_


void boardInit(void);

#define BOARD_OWN_NAME "REVOMINI"

/**
 * @brief Configuration of the Cortex-M4 Processor and Core Peripherals
 */
#define __CM4_REV                 0x0001  /*!< Core revision r0p1                            */
#define __MPU_PRESENT             1       /*!< STM32F4XX provides an MPU                     */
#define __NVIC_PRIO_BITS          4       /*!< STM32F4XX uses 4 Bits for the Priority Levels */
#define __Vendor_SysTickConfig    0       /*!< Set to 1 if different SysTick Config is used  */
#define __FPU_PRESENT             1       /*!< FPU present      */

#define CYCLES_PER_MICROSECOND  168
#define SYSTICK_RELOAD_VAL      (CYCLES_PER_MICROSECOND*1000-1)

#undef  STM32_PCLK1
#undef  STM32_PCLK2
#define STM32_PCLK1   (CYCLES_PER_MICROSECOND*1000000/4)
#define STM32_PCLK2   (CYCLES_PER_MICROSECOND*1000000/2)


#define BOARD_BUTTON_PIN        254 // no button

#define BOARD_RFM22B_CS_PIN     103 // PA15 CS_RFM22B
#define BOARD_RFM22B_INT_PIN    26  // PD2

//#define BOARD_BUZZER_PIN        5 // PB15, PWM2 - used as PPM2


#define BOARD_NR_USARTS         5
#define BOARD_USART1_TX_PIN     23 
#define BOARD_USART1_RX_PIN     24 
#define BOARD_USART3_TX_PIN     0
#define BOARD_USART3_RX_PIN     100
#define BOARD_USART6_TX_PIN     12
#define BOARD_USART6_RX_PIN     13

#define BOARD_USART4_RX_PIN     48
#define BOARD_USART4_TX_PIN     47

#define BOARD_USART5_RX_PIN     26  // PD2  EXTI_RFM22B / UART5_RX
//#define BOARD_BUTTON_PIN        103 // PA15 CS_RFM22B

#define BOARD_SPEKTRUM_RX_PIN   BOARD_RFM22B_INT_PIN // PD2
#define BOARD_SPEKTRUM_PWR_PIN  BOARD_RFM22B_CS_PIN // PA15
#define BOARD_SPEKTRUM_PWR_ON   1
#define BOARD_SPEKTRUM_PWR_OFF  0



   
#define BOARD_NR_SPI            3
#define BOARD_SPI1_SCK_PIN      52
#define BOARD_SPI1_MISO_PIN     53
#define BOARD_SPI1_MOSI_PIN     54
#define BOARD_SPI2_SCK_PIN      255
#define BOARD_SPI2_MISO_PIN     255
#define BOARD_SPI2_MOSI_PIN     255
#define BOARD_SPI3_MOSI_PIN     18
#define BOARD_SPI3_MISO_PIN     17
#define BOARD_SPI3_SCK_PIN      16

#define BOARD_DATAFLASH_CS_PIN   104


#define BOARD_MPU6000_CS_PIN		51
#define BOARD_MPU6000_DRDY_PIN	10  // PC4
//#define INVENSENSE_INTERRUPT_PIN	BOARD_MPU6000_DRDY_PIN	


#define BOARD_SBUS_INVERTER     6

#define BOARD_USB_SENSE 11      // PC5


// bus 2 (soft) pins
#define BOARD_SOFT_SCL 14
#define BOARD_SOFT_SDA 15

// SoftSerial pins
#define BOARD_SOFTSERIAL_TX 14
#define BOARD_SOFTSERIAL_RX 15


# define BOARD_GPIO_A_LED_PIN        36  // BLUE
//# define HAL_GPIO_B_LED_PIN        37  // YELLOW OPTIONAL (not included)
# define BOARD_GPIO_B_LED_PIN        9      //  frequency select - resistor to VCC or ground
# define BOARD_GPIO_C_LED_PIN        105 // RED

# define BOARD_LED_ON           LOW
# define BOARD_LED_OFF          HIGH


#define BOARD_NR_GPIO_PINS      109


#define BOARD_I2C_BUS_INT 0  // hardware I2C
#define BOARD_I2C_BUS_EXT 2  // external soft I2C


#define BOARD_BARO_DEFAULT HAL_BARO_MS5611_I2C
#define BOARD_BARO_MS5611_I2C_ADDR 0x77


#define BOARD_COMPASS_DEFAULT HAL_COMPASS_HMC5843
#define BOARD_COMPASS_HMC5843_I2C_ADDR 0x1E
#define BOARD_HMC5883_DRDY_PIN  38  // PB7 - but it not used by driver
#define BOARD_COMPASS_HMC5843_ROTATION ROTATION_YAW_270 

#define HAL_COMPASS_HMC5843_I2C_BUS     BOARD_I2C_BUS_INT
#define HAL_COMPASS_HMC5843_I2C_EXT_BUS BOARD_I2C_BUS_EXT // external compass on soft I2C
#define HAL_COMPASS_HMC5843_I2C_ADDR    BOARD_COMPASS_HMC5843_I2C_ADDR
#define HAL_COMPASS_HMC5843_ROTATION    BOARD_COMPASS_HMC5843_ROTATION

#define BOARD_INS_DEFAULT HAL_INS_MPU60XX_SPI
#define BOARD_INS_ROTATION  ROTATION_YAW_180
#define BOARD_INS_MPU60x0_NAME            "mpu6000"

#define BOARD_STORAGE_SIZE            4096 // EEPROM size

#define BOARD_DATAFLASH_NAME "dataflash"


# define BOARD_PUSHBUTTON_PIN   254
# define BOARD_USB_MUX_PIN      -1
# define BOARD_BATTERY_VOLT_PIN     8   // Battery voltage on A0 (PC2) D8
# define BOARD_BATTERY_CURR_PIN     7   // Battery current on A1 (PC1) D7
# define BOARD_SONAR_SOURCE_ANALOG_PIN 254

#define BOARD_USB_DMINUS 108

#define BOARD_NRF_NAME "nrf24"
#define BOARD_NRF_CS_PIN BOARD_RFM22B_CS_PIN

// motor layouts
#define REVO_MOTORS_ARDUCOPTER 0
#define REVO_MOTORS_OPENPILOT 1
#define REVO_MOTORS_CLEANFLIGHT 2


#ifdef BOARD_NRF_NAME
   //                                    name            device   bus  mode         cs_pin                       speed_low       speed_high soft
#define BOARD_SPI_DEVICES    { BOARD_INS_MPU60x0_NAME,   _SPI1,   1,  SPI_MODE_3, BOARD_MPU6000_CS_PIN,          SPI_1_125MHZ,   SPI_9MHZ,  true }, \
                             { BOARD_DATAFLASH_NAME,     _SPI3,   3,  SPI_MODE_3, 254 /* caller controls CS */ , SPI_1_125MHZ,   SPI_18MHZ, false },\
                             { BOARD_NRF_NAME,           _SPI3,   3,  SPI_MODE_3, 254 /* caller controls CS */,  SPI_1_125MHZ,   SPI_9MHZ,  false },
#else
//
#define BOARD_SPI_DEVICES    { BOARD_INS_MPU60x0_NAME,   _SPI1,   1,  SPI_MODE_3, BOARD_MPU6000_CS_PIN,          SPI_1_125MHZ,   SPI_9MHZ,  true }, \
                             { BOARD_DATAFLASH_NAME,     _SPI3,   3,  SPI_MODE_3, 254 /* caller controls CS */ , SPI_1_125MHZ,   SPI_18MHZ, false },
#endif

/*
    // @Param: MOTOR_LAYOUT
    // @DisplayName: Motor layout scheme
    // @Description: Selects how motors are numbered
    // @Values: 0:ArduCopter,1:OpenPilot,2:CleanFlight
    // @User: Advanced
    AP_GROUPINFO("_MOTOR_LAYOUT", 0,  HAL_REVOMINI, _motor_layout, REVO_MOTORS_ARDUCOPTER),

    // @Param: USE_SOFTSERIAL
    // @DisplayName: Use SoftwareSerial driver
    // @Description: Use SoftwareSerial driver instead SoftwareI2C on Input Port pins 7 & 8
    // @Values: 0:disabled,1:enabled
    // @User: Advanced
    AP_GROUPINFO("_USE_SOFTSERIAL", 1,  HAL_REVOMINI, _use_softserial, 0),

*/
#define BOARD_HAL_VARINFO \
    AP_GROUPINFO("MOTOR_LAYOUT", 0,  AP_Param_Helper, _motor_layout, REVO_MOTORS_ARDUCOPTER), \
    AP_GROUPINFO("SOFTSERIAL", 1, AP_Param_Helper, _use_softserial, 0)

// parameters
#define BOARD_HAL_PARAMS \
    AP_Int8 _motor_layout; \
    AP_Int8 _use_softserial;
    
    
#define ERROR_USART _USART1 // main port

#endif
