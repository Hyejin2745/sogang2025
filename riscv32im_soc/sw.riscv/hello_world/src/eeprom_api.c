//------------------------------------------------------------------------------
// Copyright (c) 2025
// EEPROM API using I2C
// AT24C02 EEPROM 호환
//------------------------------------------------------------------------------
#include <stdint.h>
#include "eeprom_api.h"
#include "i2c_master_api.h"
#include "my_printf.h"

void eeprom_reset(void)
{
    uint8_t dev_addr = 0x50;    // AT24C02 기본 7-bit 주소
    uint8_t reset_value = 0xFF; // 또는 0x00으로 초기화 (원하는 값으로 변경)
    
    // 0x00 주소에 초기화 값 쓰기
    if (i2c_write_d7r8(dev_addr, 0x00, reset_value) == 0) {
        my_printf("[I2C] EEPROM 0x00 Reset OK\r\n");
    } else {
        my_printf("[I2C] EEPROM Reset Failed\r\n");
        return;
    }
    if (i2c_write_d7r8(dev_addr, 0x01, reset_value) == 0) {
        my_printf("[I2C] EEPROM 0x01 Reset OK\r\n");
    } else {
        my_printf("[I2C] EEPROM Reset Failed\r\n");
        return;
    }
    
    my_printf("[I2C] EEPROM Reset Complete\r\n");
}

void eeprom_test(void)
{
    uint8_t read_data = 0;
    uint8_t write_data = 0x37;  // 쓰기 테스트용 값
    uint8_t dev_addr = 0x50;    // AT24C02 기본 7-bit 주소 (A2=A1=A0=0, 4핀 패키지)

    my_printf("\r\n[I2C] EEPROM Test Start\r\n");

    // EEPROM Write : reg 0x00 에 write_data 저장
    if (i2c_write_d7r8(dev_addr, 0x00, write_data) == 0) {
        my_printf("[I2C] Write OK (0x%02x)\r\n", write_data);
    } else {
        my_printf("[I2C] Write Failed\r\n");
    }

    // EEPROM 내부 write 완료 대기 (twr)
    for (volatile int i = 0; i < 10000000; i++);

    // EEPROM Read : reg 0x00 읽기
    if (i2c_read_d7r8(dev_addr, 0x00, &read_data) == 0) {
        my_printf("[I2C] Read 0x00 OK  (0x%02x)\r\n", read_data);
    } else {
        my_printf("[I2C] Read Failed\r\n");
    }

    // 읽은 값이 맞는지 확인
    if (read_data == write_data) {
        my_printf("[I2C] EEPROM Test PASS\r\n");
        
    } else {
        my_printf("[I2C] EEPROM Test FAIL\r\n");
        
    }
}
