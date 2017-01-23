/******************************************************************************
 * The MIT License
 *
based on:
 
 * Copyright (c) 2010 Perry Hung.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *****************************************************************************/

/**
 * @brief Generic board initialization routines.
 *
 */

#include "boards.h"
#include "systick.h"
#include "gpio_hal.h"
#include "timer.h"
#include "adc.h"
#include <usb.h>

static void setupFlash(void);
static void setupClocks(void);
static void setupNVIC(void);
static void enableFPU(void);
static void setupCCM(void);

void setupADC(void);
void setupTimers(void);
void usb_init(void);


void usb_init(void){


    usb_attr_t usb_attr;
    usb_open();

    usb_default_attr(&usb_attr);
    usb_attr.preempt_prio = 1;
    usb_attr.sub_prio = 3;
    usb_attr.use_present_pin = 1;
    usb_attr.present_port = _GPIOC;
    usb_attr.present_pin = 5;

    usb_configure(&usb_attr);

}

inline void enableFPU(void){
#if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
	SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));	// set CP10 and CP11 Full Access
#endif
}


inline static void setupFlash(void) {

}

/*
 * Clock setup.  Note that some of this only takes effect if we're
 * running bare metal and the bootloader hasn't done it for us
 * already.
 *
 */
inline static void setupClocks() {
}


inline static void setupCCM(){
    extern unsigned _sccm,_eccm; // defined by link script

    RCC->AHB1ENR |= RCC_AHB1ENR_CCMDATARAMEN;
    asm volatile("dsb \n");

    volatile unsigned *dest = &_sccm;
    while (dest < &_eccm) {
        *dest++ = 0;
    }
}

inline static void setupNVIC() {
    /* 4 bit preemption,  0 bit subpriority */
    NVIC_PriorityGroupConfig( NVIC_PriorityGroup_4);
}

#define DFU_RTC_SIGNATURE       0xDEADBEEF
#define BOOT_RTC_REG            (_IO uint32_t *)(RTC_BASE + 0x50)

inline void goDFU();

inline void goDFU(){            // Reboot to BootROM - to DFU mode
    asm volatile("\
    ldr     r0, =0x1FFF0000\n\
    ldr     sp,[r0, #0]    \n\
    ldr     r0,[r0, #4]    \n\
    bx      r0             \n\
    ");
}

void board_set_rtc_signature(uint32_t sig);
void board_set_rtc_signature(uint32_t sig)
{
        // enable the backup registers.
        PWR->CR   |= PWR_CR_DBP;
        RCC->BDCR |= RCC_BDCR_RTCEN;

        RTC_WriteBackupRegister(0, sig);

        // disable the backup registers
//        RCC->BDCR &= RCC_BDCR_RTCEN;
        PWR->CR   &= ~PWR_CR_DBP;
}


uint32_t board_get_rtc_signature();
uint32_t board_get_rtc_signature()
{
        // enable the backup registers.
        PWR->CR   |= PWR_CR_DBP;
        RCC->BDCR |= RCC_BDCR_RTCEN;

        uint32_t ret = RTC_ReadBackupRegister(0);

        // disable the backup registers
//        RCC->BDCR &= RCC_BDCR_RTCEN;
        PWR->CR   &= ~PWR_CR_DBP;
        
        return ret;
}


// 1st executing function

void inline init(void) {
    setupCCM(); // needs because stack in CCM
    

    if(board_get_rtc_signature() == DFU_RTC_SIGNATURE) {
        board_set_rtc_signature(0);
        goDFU();
    }


    setupFlash();  // empty
    setupClocks(); // empty

    SystemInit();
    SystemCoreClockUpdate();

    enableFPU();
    setupNVIC();
    systick_init(SYSTICK_RELOAD_VAL);

    stopwatch_init(); // will use stopwatch_delay_us

    boardInit();
/*
     only CPU init here, all another moved to modules .init() functions
*/
}

void pre_init(){ // before any stack usage @NG

    init();
}
