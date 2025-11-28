#include <stdint.h>
#include "my_printf.h"
#include "uart_api.h"
// include i2c api with a relative path from this directory
#include "../../../ips/i2c_axi_lite/api/c/i2c_api.h"

static void busy_delay(unsigned loops)
{
    volatile unsigned i;
    for (i = 0; i < loops; ++i) {
        __asm__ __volatile__("nop");
    }
}

void eeprom_write_byte(uint8_t dev7, uint8_t word, uint8_t data)
{
    i2c_set_addr(0x90040000U);
    i2c_write_data((uint32_t)data);
    i2c_start_simple(dev7, word, /*is_read*/0, /*random*/0, /*page*/0);
    busy_delay(5000000); // increased wait for EEPROM tWR
}

uint8_t eeprom_read_byte(uint8_t dev7, uint8_t word)
{
    i2c_set_addr(0x90040000U);// random read sequence via core state machine
    i2c_start_simple(dev7, word, /*is_read*/1, /*random*/1, /*page*/0);
    busy_delay(10000000);
    uint8_t v = (uint8_t)(i2c_read_data() & 0xFFu);
    return v;
}

//------------------------------------------------------------------------------
// 32-bit (4-byte) page write/read using DATA1/DATA2
//------------------------------------------------------------------------------
void eeprom_write_word32(uint8_t dev7, uint8_t word, uint32_t data32)
{
    i2c_set_addr(0x90040000U);// DATA1에 4바이트를 한 번에 적재
    i2c_write_data(data32);// page=1로 설정하여 최대 4바이트 전송
    i2c_start_simple(dev7, word, /*is_read*/0, /*random*/0, /*page*/1);
    busy_delay(10000000); // 페이지 프로그램 시간 여유 증가
}

uint32_t eeprom_read_word32(uint8_t dev7, uint8_t word)
{
    i2c_set_addr(0x90040000U);// random read + page=1로 최대 4바이트 읽기
    i2c_start_simple(dev7, word, /*is_read*/1, /*random*/1, /*page*/1);
    busy_delay(10000000);
    return i2c_read_data(); // DATA2 32비트 버퍼 반환
}
