#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI_Namespace.h>

#define AP_HAL_BOARD_DRIVER             AP_HAL_REVOMINI
#define HAL_SERIAL0_BAUD_DEFAULT        115200
#define CONFIG_HAL_BOARD_SUBTYPE        HAL_BOARD_SUBTYPE_NONE


#define HAL_BOARD_NAME                  BOARD_OWN_NAME

#define HAL_CPU_CLASS                   HAL_CPU_CLASS_150
#define HAL_OS_POSIX_IO                 0

#define HAL_STORAGE_SIZE                BOARD_STORAGE_SIZE // EEPROM size

#define HAL_BARO_DEFAULT                BOARD_BARO_DEFAULT
#define HAL_BARO_MS5611_I2C_BUS         BOARD_I2C_BUS_INT
#define HAL_BARO_MS5611_I2C_ADDR        BOARD_BARO_MS5611_I2C_ADDR

#ifdef BOARD_I2C_BUS_EXT
 #define HAL_BARO_MS5611_I2C_BUS_EXT     BOARD_I2C_BUS_EXT  // external baro on soft I2C
 #define HAL_BARO_BMP280_BUS             BOARD_I2C_BUS_EXT  // external baro on soft I2C
#endif

#define HAL_BARO_BMP280_I2C_ADDR        (0x76)



#define HAL_COMPASS_DEFAULT             BOARD_COMPASS_DEFAULT
#define HAL_COMPASS_HMC5843_I2C_BUS     BOARD_I2C_BUS_INT
#define HAL_COMPASS_HMC5843_I2C_EXT_BUS BOARD_I2C_BUS_EXT // external compass on soft I2C
#define HAL_COMPASS_HMC5843_I2C_ADDR    BOARD_COMPASS_HMC5843_I2C_ADDR
#define HAL_COMPASS_HMC5843_ROTATION    BOARD_COMPASS_HMC5843_ROTATION


#define HAL_INS_DEFAULT                 BOARD_INS_DEFAULT
#define HAL_INS_DEFAULT_ROTATION        BOARD_INS_ROTATION
#define HAL_INS_MPU60x0_NAME            BOARD_INS_MPU60x0_NAME

//#define INVENSENSE_DRDY_PIN             BOARD_MPU6000_DRDY_PIN via interrupt

#ifdef BOARD_HMC5883_DRDY_PIN
#define HMC5883_DRDY_PIN                BOARD_HMC5883_DRDY_PIN
#endif

#define HAL_DATAFLASH_NAME              BOARD_DATAFLASH_NAME

# define HAL_GPIO_A_LED_PIN             BOARD_GPIO_A_LED_PIN
# define HAL_GPIO_B_LED_PIN             BOARD_GPIO_B_LED_PIN
# define HAL_GPIO_C_LED_PIN             BOARD_GPIO_C_LED_PIN

# define HAL_GPIO_LED_ON                BOARD_LED_ON
# define HAL_GPIO_LED_OFF               BOARD_LED_OFF

#ifdef BOARD_BUZZER_PIN
#define BUZZER_PIN                      BOARD_BUZZER_PIN
#endif

# define PUSHBUTTON_PIN                 BOARD_PUSHBUTTON_PIN
# define USB_MUX_PIN                    BOARD_USB_MUX_PIN
# define BATTERY_VOLT_PIN               BOARD_BATTERY_VOLT_PIN   // Battery voltage on A0 (PC2) D8
# define BATTERY_CURR_PIN               BOARD_BATTERY_CURR_PIN   // Battery current on A1 (PC1) D7
# define CONFIG_SONAR_SOURCE_ANALOG_PIN BOARD_SONAR_SOURCE_ANALOG_PIN
 


#undef TOSHIBA_LED_I2C_BUS // someone placed this not in board config
#define TOSHIBA_LED_I2C_ADDR 0x55    // default I2C bus address
#define TOSHIBA_LED_I2C_BUS  2       // external I2C

/*
#define EXTERNAL_LED_GPS          28    // GPS LED - AN10
#define EXTERNAL_LED_ARMED        29    // Armed LED - AN11
#define EXTERNAL_LED_MOTOR1       30    // Motor1 LED - AN8
#define EXTERNAL_LED_MOTOR2       31    // Motor2 LED - AN12
*/

// #define MAGNETOMETER ENABLED

 #define AC_TERRAIN             DISABLED // no SD card
 #define OPTFLOW                DISABLED
 #define ADSB_ENABLED           DISABLED
 #define PRECISION_LANDING      DISABLED
 #define CONFIG_PUSHBUTTON      DISABLED
 #define CONFIG_RELAY           DISABLED
 #define RANGEFINDER_ENABLED    DISABLED
 #define SPRAYER                DISABLED
 #define EPM_ENABLED            DISABLED
 #define MOUNT                  DISABLED // don't fit to flash
 #define CLI_ENABLED            DISABLED
 
 // for debugging
 #define FRSKY_TELEM_ENABLED   DISABLED
 #define NAV_GUIDED            DISABLED
// #define AC_RALLY              DISABLED
 #define AC_AVOID_ENABLED      DISABLED
 #define PROXIMITY_ENABLED     DISABLED
 #define CAMERA                DISABLED
 #define AC_FENCE              DISABLED
 #define NAV_GUIDED            DISABLED
 #define POSHOLD_ENABLED       DISABLED 

 #define LOGGING_ENABLED ENABLED

 