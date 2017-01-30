/*
  hacked up DataFlash library for Desktop support
*/

#include "DataFlash_Revo.h"

#include <AP_HAL/AP_HAL.h>

#if CONFIG_HAL_BOARD == HAL_BOARD_REVOMINI

#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>
#include <assert.h>

#pragma GCC diagnostic ignored "-Wunused-result"


extern const AP_HAL::HAL& hal;

static uint8_t buffer[2][DF_PAGE_SIZE];

// Public Methods //////////////////////////////////////////////////////////////
void DataFlash_Revo::Init()
{

    DataFlash_Backend::Init();
    
    df_NumPages=0;
    
    hal.gpio->pinMode(DF_RESET,OUTPUT);
    // Reset the chip
    hal.gpio->write(DF_RESET,0);
    hal.scheduler->delay(1);
    hal.gpio->write(DF_RESET,1);

    _spi = hal.spi->get_device(HAL_DATAFLASH_NAME);

    if (!_spi) {
        AP_HAL::panic("PANIC: DataFlash SPIDeviceDriver not found");
        return; /* never reached */
    }

    _spi_sem = _spi->get_semaphore();
    if (!_spi_sem) {
        AP_HAL::panic("PANIC: DataFlash SPIDeviceDriver semaphore is null");
        return; /* never reached */
    }


    log_write_started=true;

    df_PageSize = DF_PAGE_SIZE;

    // reserve last page for config information
    df_NumPages   = DF_NUM_PAGES - 1;


}

//  try to take a semaphore safely from both in a timer and outside
bool DataFlash_Revo::_sem_take(uint8_t timeout)
{
    if (hal.scheduler->in_timerprocess()) {
        return _spi_sem->take_nonblocking();
    }
    return _spi_sem->take(timeout);
}

bool DataFlash_Revo::cs_assert(){
    if (!_sem_take(50))
        return false;

    hal.gpio->write(DF_RESET,0);
    return true;
}

void DataFlash_Revo::cs_release(){
    hal.gpio->write(DF_RESET,1);

    _spi_sem->give();
}


// This function is mainly to test the device
void DataFlash_Revo::ReadManufacturerID()
{
    // activate dataflash command decoder
    if (!cs_assert()) return;

    // Read manufacturer and ID command...
    spi_write(JEDEC_DEVICE_ID); //

    df_manufacturer = spi_read();
    df_device = spi_read(); //memorytype
    df_device = (df_device << 8) | spi_read(); //capacity
    spi_read();

    // release SPI bus for use by other sensors
    cs_release();
}


// Read the status register
uint8_t DataFlash_Revo::ReadStatusReg()
{
    uint8_t tmp;

    // activate dataflash command decoder
    if (!cs_assert()) return JEDEC_STATUS_BUSY;

    // Read status command
    spi_write(JEDEC_READ_STATUS);
    tmp = spi_read(); // We only want to extract the READY/BUSY bit

    // release SPI bus for use by other sensors
    cs_release();
    
    return tmp;
}

uint8_t DataFlash_Revo::ReadStatus()
{
  // We only want to extract the READY/BUSY bit
    int32_t status = ReadStatusReg();
    if (status < 0)
            return -1;
    return status & JEDEC_STATUS_BUSY;
}


void DataFlash_Revo::PageToBuffer(unsigned char BufferNum, uint16_t PageAdr)
{

//	pread(flash_fd, buffer[BufferNum], DF_PAGE_SIZE, (PageAdr-1)*DF_PAGE_SIZE);

    if (!cs_assert()) return;

    uint8_t cmd[4];
    cmd[0] = JEDEC_READ_DATA;
    cmd[1] = (PageAdr >> 16) & 0xff;
    cmd[2] = (PageAdr >>  8) & 0xff;
    cmd[3] = (PageAdr >>  0) & 0xff;

    _spi->transfer(cmd, sizeof(cmd), NULL, 0);

    _spi->transfer(NULL,0, buffer[BufferNum], DF_PAGE_SIZE);
    
    cs_release();
}

void DataFlash_Revo::BufferToPage (unsigned char BufferNum, uint16_t PageAdr, unsigned char wait)
{
    //	pwrite(flash_fd, buffer[BufferNum], DF_PAGE_SIZE, (PageAdr-1)*(uint32_t)DF_PAGE_SIZE);
    
    Flash_Jedec_WriteEnable();
    
    if (!cs_assert()) return;

    uint8_t cmd[4];
    cmd[0] = JEDEC_PAGE_WRITE;
    cmd[1] = (PageAdr >> 16) & 0xff;
    cmd[2] = (PageAdr >>  8) & 0xff;
    cmd[3] = (PageAdr >>  0) & 0xff;

    _spi->transfer(cmd, sizeof(cmd),NULL, 0);

    _spi->transfer(buffer[BufferNum], DF_PAGE_SIZE, NULL, 0);

    cs_release();

    if(wait)   WaitReady();

}

void DataFlash_Revo::BufferWrite (unsigned char BufferNum, uint16_t IntPageAdr, unsigned char Data)
{
	buffer[BufferNum][IntPageAdr] = (uint8_t)Data;
}

void DataFlash_Revo::BlockWrite(uint8_t BufferNum, uint16_t IntPageAdr, 
                                const void *pHeader, uint8_t hdr_size,
                                const void *pBuffer, uint16_t size)
{
    if (!_writes_enabled) {
        return;
    }
    if (hdr_size) {
        memcpy(&buffer[BufferNum][IntPageAdr],
               pHeader,
               hdr_size);
    }
    memcpy(&buffer[BufferNum][IntPageAdr+hdr_size],
           pBuffer,
           size);
}

// read size bytes of data to a page. The caller must ensure that
// the data fits within the page, otherwise it will wrap to the
// start of the page
bool DataFlash_Revo::BlockRead(uint8_t BufferNum, uint16_t IntPageAdr, void *pBuffer, uint16_t size)
{
    memcpy(pBuffer, &buffer[BufferNum][IntPageAdr], size);
    return true;
}



void DataFlash_Revo::PageErase (uint16_t PageAdr)
{

    uint8_t cmd[4];
    cmd[0] = sector_erase;
    cmd[1] = (PageAdr >> 16) & 0xff;
    cmd[2] = (PageAdr >>  8) & 0xff;
    cmd[3] = (PageAdr >>  0) & 0xff;

    Flash_Jedec_WriteEnable();
    
    if (!cs_assert()) return;

    _spi->transfer(cmd, sizeof(cmd), NULL, 0);
        
    cs_release();
}

void DataFlash_Revo::BlockErase (uint16_t BlockAdr)
{

    for(uint8_t i=0; i<8; i++) {
        PageErase ( BlockAdr * 8 + i );
        hal.scheduler->delay(1);
    }

}


void DataFlash_Revo::ChipErase()
{
    for (int i=0; i<DF_NUM_PAGES; i++) {
        PageErase(i);
        hal.scheduler->delay(1);
    }
}


void DataFlash_Revo::Flash_Jedec_WriteEnable(void)
{
    // activate dataflash command decoder
    if (!cs_assert()) return;

    spi_write(JEDEC_WRITE_ENABLE);

    cs_release();
}


#endif
