/******************************************************************************
 * The MIT License
 *
 * Copyright (c) 2010 Michael Hope.
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
 * @file dmaF2.c
 * @brief Direct Memory Access peripheral support
 */

#include "dma.h"
#include "bitband.h"
#include "util.h"

/*
 * Devices
 */

static DMA_Handler dma1_handlers[8] IN_CCM;

static const dma_dev dma1 = {
    .regs     = (dma_reg_map *)DMA1_BASE,
    .clk_id   = RCC_AHB1Periph_DMA1,
/*    .handlers = {{ .handler = NULL, .irq_line = 11 },
                 { .handler = NULL, .irq_line = 12 },
                 { .handler = NULL, .irq_line = 13 },
                 { .handler = NULL, .irq_line = 14 },
                 { .handler = NULL, .irq_line = 15 },
                 { .handler = NULL, .irq_line = 16 },
                 { .handler = NULL, .irq_line = 17 },
                 { .handler = NULL, .irq_line = 47 }}
*/
    .irq_lines = { 11, 12, 13, 14, 15, 16, 17, 47},
    .handlers  = dma1_handlers
};
/** DMA1 device */
const dma_dev * const _DMA1 = &dma1;


static DMA_Handler dma2_handlers[8] IN_CCM;

static const dma_dev dma2 = {
    .regs     = (dma_reg_map *)DMA2_BASE,
    .clk_id   = RCC_AHB1Periph_DMA2,
/*    .handlers = {{ .handler = NULL, .irq_line = 56 },
                 { .handler = NULL, .irq_line = 57 },
                 { .handler = NULL, .irq_line = 58 },
                 { .handler = NULL, .irq_line = 59 },
                 { .handler = NULL, .irq_line = 60 },
                 { .handler = NULL, .irq_line = 68 },
                 { .handler = NULL, .irq_line = 69 },
                 { .handler = NULL, .irq_line = 70 }} // !@#$ 
*/
    .irq_lines = { 56, 57, 58, 59, 60, 68, 69, 70},
    .handlers  = dma2_handlers

};
/** DMA2 device */
const dma_dev * const _DMA2 = &dma2;


/*
 * Convenience routines
 */

/**
 * @brief Initialize a DMA device.
 * @param dev Device to initialize.
 */
void dma_init(const dma_dev *dev) {

    RCC_AHB1PeriphClockCmd(dev->clk_id, ENABLE);
}

/**
 * @brief Attach an interrupt to a DMA transfer.
 *
 * Interrupts are enabled using appropriate mode flags in
 * dma_setup_transfer().
 *
 * @param dev DMA device
 * @param stream Stream to attach handler to
 * @param handler Interrupt handler to call when channel interrupt fires.
 * @see dma_setup_transfer()
 * @see dma_detach_interrupt()
 */
void dma_attach_interrupt(const dma_dev *dev,
                          dma_stream stream,
                          void (*handler)(void)) {
    dev->handlers[stream] = handler;
    NVIC_EnableIRQ(dev->irq_lines[stream]);
}

/**
 * @brief Detach a DMA transfer interrupt handler.
 *
 * After calling this function, the given channel's interrupts will be
 * disabled.
 *
 * @param dev DMA device
 * @param stream Stream whose handler to detach
 * @sideeffect Clears interrupt enable bits in the channel's CCR register.
 * @see dma_attach_interrupt()
 */
void dma_detach_interrupt(const dma_dev *dev, dma_stream stream) {
    NVIC_DisableIRQ(dev->irq_lines[stream]);
    dev->handlers[stream] = NULL;
}

void dma_clear_isr_bits(const dma_dev *dev, dma_stream stream) {
    switch (stream) {
    case 0:
        dev->regs->LIFCR|=0x0000003d;
        break;
    case 1:
        dev->regs->LIFCR|=0x00000f40;
        break;
    case 2:
        dev->regs->LIFCR|=0x003d0000;
        break;
    case 3:
        dev->regs->LIFCR|=0x0f400000;
        break;
    case 4:
        dev->regs->HIFCR|=0x0000003d;
        break;
    case 5:
        dev->regs->HIFCR|=0x00000f40;
        break;
    case 6:
        dev->regs->HIFCR|=0x003d0000;
        break;
    case 7:
        dev->regs->HIFCR|=0x0f400000;
        break;
    }
}

/*
 * IRQ handlers
 */

static inline void dispatch_handler(const dma_dev *dev, dma_stream stream) {
    DMA_Handler handler = dev->handlers[stream];
    if (handler) {
        handler();
    }
    dma_clear_isr_bits(dev, stream); /* in case handler doesn't */
}

void DMA1_Stream0_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM0);
}

void DMA1_Stream1_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM1);
}

void DMA1_Stream2_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM2);
}

void DMA1_Stream3_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM3);
}

void DMA1_Stream4_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM4);
}

void DMA1_Stream5_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM5);
}

void DMA1_Stream6_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM6);
}

void DMA1_Stream7_IRQHandler(void) {
    dispatch_handler(_DMA1, DMA_STREAM7);
}

void DMA2_Stream0_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM0);
}

void DMA2_Stream1_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM1);
}

void DMA2_Stream2_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM2);
}

void DMA2_Stream3_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM3);
}

void DMA2_Stream4_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM4);
}

void DMA2_Stream5_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM5);
}

void DMA2_Stream6_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM6);
}

void DMA2_Stream7_IRQHandler(void) {
    dispatch_handler(_DMA2, DMA_STREAM7);
}

