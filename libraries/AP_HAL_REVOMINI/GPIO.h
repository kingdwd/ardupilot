
#ifndef __AP_HAL_REVOMINI_GPIO_H__
#define __AP_HAL_REVOMINI_GPIO_H__

#include <wirish.h>
#include <AP_HAL/AP_HAL.h>
#include "AP_HAL_REVOMINI_Namespace.h"


#ifndef HIGH
 #define HIGH 0x1
#endif

#ifndef LOW
 #define LOW  0x0
#endif


#ifndef HAL_GPIO_A_LED_PIN
# define HAL_GPIO_A_LED_PIN        36  // BLUE
#endif
#ifndef HAL_GPIO_B_LED_PIN
# define HAL_GPIO_B_LED_PIN        106 //  LED PA13
#endif
#ifndef HAL_GPIO_C_LED_PIN
 # define HAL_GPIO_C_LED_PIN        105 // RED
#endif

#ifndef HAL_GPIO_LED_ON
 # define HAL_GPIO_LED_ON           LOW
 # define HAL_GPIO_LED_OFF          HIGH
#endif

typedef enum HALPinMode {
    OUTPUT, /* Basic digital output: when the pin is HIGH, the
               voltage is held at +3.3v (Vcc) and when it is LOW, it
               is pulled down to ground. */

    OUTPUT_OPEN_DRAIN, /**< In open drain mode, the pin indicates
                          "low" by accepting current flow to ground
                          and "high" by providing increased
                          impedance. An example use would be to
                          connect a pin to a bus line (which is pulled
                          up to a positive voltage by a separate
                          supply through a large resistor). When the
                          pin is high, not much current flows through
                          to ground and the line stays at positive
                          voltage; when the pin is low, the bus
                          "drains" to ground with a small amount of
                          current constantly flowing through the large
                          resistor from the external supply. In this
                          mode, no current is ever actually sourced
                          from the pin. */

    INPUT, /**< Basic digital input. The pin voltage is sampled; when
              it is closer to 3.3v (Vcc) the pin status is high, and
              when it is closer to 0v (ground) it is low. If no
              external circuit is pulling the pin voltage to high or
              low, it will tend to randomly oscillate and be very
              sensitive to noise (e.g., a breath of air across the pin
              might cause the state to flip). */

    INPUT_ANALOG, /**< This is a special mode for when the pin will be
                     used for analog (not digital) reads.  Enables ADC
                     conversion to be performed on the voltage at the
                     pin. */

    INPUT_PULLUP, /**< The state of the pin in this mode is reported
                     the same way as with INPUT, but the pin voltage
                     is gently "pulled up" towards +3.3v. This means
                     the state will be high unless an external device
                     is specifically pulling the pin down to ground,
                     in which case the "gentle" pull up will not
                     affect the state of the input. */

    INPUT_PULLDOWN, /**< The state of the pin in this mode is reported
                       the same way as with INPUT, but the pin voltage
                       is gently "pulled down" towards 0v. This means
                       the state will be low unless an external device
                       is specifically pulling the pin up to 3.3v, in
                       which case the "gentle" pull down will not
                       affect the state of the input. */

    INPUT_FLOATING, /**< Synonym for INPUT. */

    PWM, /**< This is a special mode for when the pin will be used for
            PWM output (a special case of digital output). */

    PWM_OPEN_DRAIN, /**< Like PWM, except that instead of alternating
                       cycles of LOW and HIGH, the voltage on the pin
                       consists of alternating cycles of LOW and
                       floating (disconnected). */
} HAL_PinMode;


typedef enum ExtIntTriggerMode {
    RISING, /**< To trigger an interrupt when the pin transitions LOW
               to HIGH */
    FALLING, /**< To trigger an interrupt when the pin transitions
                HIGH to LOW */
    CHANGE /**< To trigger an interrupt when the pin transitions from
              LOW to HIGH or HIGH to LOW (i.e., when the pin
              changes). */
} ExtIntTriggerMode;

#pragma GCC push_options
#pragma GCC optimize ("O0")

class REVOMINI::REVOMINIDigitalSource : public AP_HAL::DigitalSource {
public:
    REVOMINIDigitalSource(const gpio_dev *device, uint8_t bit): _device(device), _bit(bit){ }

    void    mode(uint8_t output);
    inline uint8_t read() {                 return gpio_read_bit(_device, _bit) ? HIGH : LOW; }
//#pragma GCC push_options
//#pragma GCC optimize ("O0")
    inline void    write(uint8_t value) {   gpio_write_bit(_device, _bit, value); }
//#pragma GCC pop_options

    inline void    toggle() {               gpio_toggle_bit(_device, _bit); }

private:
    const gpio_dev *_device;
    uint8_t _bit;
};



class REVOMINI::REVOMINIGPIO : public AP_HAL::GPIO {
public:
    REVOMINIGPIO();
    void    init() override;
    void    pinMode(uint8_t pin, uint8_t output) override;
    uint8_t read(uint8_t pin) override;
    void    write(uint8_t pin, uint8_t value) override;
    void    toggle(uint8_t pin) override;

    /* Alternative interface: */
    AP_HAL::DigitalSource* channel(uint16_t n);

    /* Interrupt interface: */
    bool    attach_interrupt(uint8_t interrupt_num, AP_HAL::Proc p, uint8_t mode);

    /* return true if USB cable is connected */
    inline bool    usb_connected(void) override {
        return gpio_read_bit(PIN_MAP[BOARD_USB_SENSE].gpio_device,PIN_MAP[BOARD_USB_SENSE].gpio_bit);
    }
    
    inline        int8_t  analogPinToDigitalPin(uint8_t pin) override { return pin; }
    static inline uint8_t analogPinToDigital(uint8_t pin){ return pin; }
    
// internal usage static versions
    static void           _pinMode(uint8_t pin, uint8_t output);
    static inline uint8_t _read(uint8_t pin) {          return gpio_read_bit( PIN_MAP[pin].gpio_device, PIN_MAP[pin].gpio_bit) ? HIGH : LOW; }
    static inline void    _write(uint8_t pin, uint8_t value) { gpio_write_bit(PIN_MAP[pin].gpio_device, PIN_MAP[pin].gpio_bit, value); }

    static inline AP_HAL::DigitalSource* get_channel(uint16_t pin) { return new REVOMINIDigitalSource(PIN_MAP[pin].gpio_device, PIN_MAP[pin].gpio_bit); }
};


static inline exti_trigger_mode exti_out_mode(ExtIntTriggerMode mode) {
    switch (mode) {
    case FALLING:
        return EXTI_FALLING;
    case CHANGE:
        return EXTI_RISING_FALLING;
    case RISING:
    default:
        return EXTI_RISING;
    }
}


#endif // __AP_HAL_REVOMINI_GPIO_H__
