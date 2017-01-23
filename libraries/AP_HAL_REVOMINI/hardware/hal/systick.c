#include <systick.h>
#include <hal.h>
#include <timer.h>
#include <wirish.h>


volatile uint64_t systick_uptime_millis;


static void (*systick_user_callback)(void) = 0;

#ifdef ISR_PROF
    uint64_t isr_time=0;
#endif

void systick_attach_callback(void (*callback)(void)) {  
    systick_user_callback = callback; 
}

/**
 * @brief Initialize and enable SysTick.
 *
 * Clocks the system timer with the core clock, turns it on, and
 * enables interrupts.
 *
 * @param reload_val Appropriate reload counter to tick every 1 ms.
 */
void systick_init(uint32_t reload_val) {
    SysTick->LOAD = reload_val;
    systick_user_callback=0;
    systick_enable();
}


/*
 * SysTick ISR
 */

void SysTick_Handler(void)
{
    systick_uptime_millis++;

    if (systick_user_callback) {
        systick_user_callback();
    }
}


static void trobe(){
    int16_t  slope   = 1;
    uint16_t CC      = 0x0000;
    uint16_t TOP_CNT = 0x0200;
    uint16_t i       = 0;
    uint8_t n;

    const int HAL_GPIO_C_LED_PIN=105;

    /* Error fade. */
    while (1) {
        if (CC == TOP_CNT)  {
            slope = -1;
        } else if (CC == 0) {
            slope = 1;
        }

        if (i == TOP_CNT)  {
            CC += slope;
            i = 0;
        }

        if (i < CC) {
            n=1;
        } else {
            n=0;
        }
        gpio_write_bit(PIN_MAP[HAL_GPIO_C_LED_PIN].gpio_device, PIN_MAP[HAL_GPIO_C_LED_PIN].gpio_bit, n);

        i++;
    }

}


#define LED_GRN (*((int32_t *) 0x42408294)) // PB5
#define LED_YLW (*((int32_t *) 0x42408298)) // PB6 // Not included
#define LED_RED (*((int32_t *) 0x42408290)) // PB4


void HardFault_Handler(void)
{
    uint32_t *sp = (uint32_t *)&sp;
    
    timer_disable_all();
    
/*
xPSR
pc
lr
r12
r3
r2
r1
r0 <- SP

*/
    volatile uint32_t pc=sp[9];

    /* Go to infinite loop when Hard Fault exception occurs */
    LED_YLW = 0;
    LED_RED = 0;
    LED_GRN = 1;

    trobe();
}
/**
  * @brief  This function handles Memory Manage exception.
  * @param  None
  * @retval None
  */
void MemManage_Handler(void)
{
    timer_disable_all();
    /* Go to infinite loop when Memory Manage exception occurs */
    LED_YLW = 0;
    LED_GRN = 0;
    LED_RED = 1;

    trobe();

}

/**
  * @brief  This function handles Bus Fault exception.
  * @param  None
  * @retval None
  */
void BusFault_Handler(void)
{
    timer_disable_all();
    /* Go to infinite loop when Bus Fault exception occurs */
    LED_YLW = 0;
    LED_GRN = 0;
    LED_RED = 0;

    trobe();
}

/**
  * @brief  This function handles Usage Fault exception.
  * @param  None
  * @retval None
  */
void UsageFault_Handler(void)
{
    timer_disable_all();
    /* Go to infinite loop when Usage Fault exception occurs */
    LED_YLW = 0;
    LED_GRN = 1;
    LED_RED = 1;

    trobe();
}


uint32_t systick_micros(void)
{
    volatile uint32_t fms, lms;
    uint32_t cycle_cnt;
     
    do {
        // make sure systick_uptime() return the same value before and after
        // getting the systick count
        fms = systick_uptime();
        cycle_cnt = systick_get_count();
        lms = systick_uptime();
    } while (lms != fms);

#define US_PER_MS               1000
    /* SYSTICK_RELOAD_VAL is 1 less than the number of cycles it
       actually takes to complete a SysTick reload */
    uint32_t res = (fms * US_PER_MS) +
        (SYSTICK_RELOAD_VAL + 1 - cycle_cnt) / CYCLES_PER_MICROSECOND;

    return res;
#undef US_PER_MS
}
