
#ifndef __AP_HAL_REVOMINI_UARTDRIVER_H__
#define __AP_HAL_REVOMINI_UARTDRIVER_H__

#include <AP_HAL_REVOMINI/AP_HAL_REVOMINI.h>

#include <usart.h>

#include <gpio_hal.h>
#include "Scheduler.h"

#define DEFAULT_TX_TIMEOUT 10000

class REVOMINI::REVOMINIUARTDriver : public AP_HAL::UARTDriver  {
public:
    REVOMINIUARTDriver(const struct usart_dev *usart);

  /* REVOMINI implementations of UARTDriver virtual methods */
  void begin(uint32_t b);
  void inline begin(uint32_t b, uint16_t rxS, uint16_t txS) {   begin(b); }
  void inline end() {  usart_disable(_usart_device); }
  void flush();
  bool inline is_initialized(){ return _initialized; }

  inline void set_blocking_writes(bool blocking) { /* usart_reset_tx(_usart_device); */ _usart_device->state->usetxrb = !blocking; }

  inline bool tx_pending() {   return (usart_txfifo_nbytes(_usart_device) > 0); }

  inline void setCallback(usart_cb cb) { usart_set_callback(_usart_device, cb); }

  /* REVOMINI implementations of Stream virtual methods */
  uint32_t inline available() override {     return usart_data_available(_usart_device); }
  uint32_t inline  txspace() override {    return usart_txfifo_freebytes(_usart_device); }
  int16_t read() override;

  /* Empty implementations of Print virtual methods */
  size_t write(uint8_t c);
  size_t write(const uint8_t *buffer, size_t size);

private:

    const struct usart_dev *_usart_device;
    bool _initialized;
};

#endif // __AP_HAL_EMPTY_UARTDRIVER_H__
