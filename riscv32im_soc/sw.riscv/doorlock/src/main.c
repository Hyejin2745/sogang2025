#include <stdint.h>
#include "my_printf.h"
#include "uart_api.h"
#include "i2c_master_api.h"

#ifndef BAUD_RATE
#define BAUD_RATE 115200
#endif

// EEPROM I2C 주소 (7-bit, 일반적으로 0x50~0x57)
#define EEPROM_ADDR 0x57

// 지연 함수
void delay(uint32_t count)
{
    for (volatile uint32_t i = 0; i < count; i++) {
        __asm__ __volatile__("nop");
    }
}

int main(void)
{
    // UART 초기화
    uart_init(0, BAUD_RATE, 8, 0, 1);
    my_printf("=== Doorlock I2C EEPROM Test ===\n");
    
    // I2C 초기화
    i2c_set_addr(0x90050000U);  // I2C_A 주소
    i2c_init(100000);           // 100kHz I2C 속도
    i2c_enable();
    
    // 테스트 데이터
    uint8_t write_addr = 0x00;   // EEPROM 메모리 주소
    uint8_t write_data[] = {0xAA, 0xBB, 0xCC, 0xDD};
    uint8_t read_data[4];
    
    // 데이터 쓰기
    my_printf("Writing to EEPROM...\n");
    my_printf("Address: 0x%02x, Data: ", write_addr);
    int write_ok = 1;
    for (int i = 0; i < 4; i++) {
        int ret = i2c_write_d7r8(EEPROM_ADDR, write_addr + i, write_data[i]);
        if (ret == 0) {
            my_printf("0x%02x ", write_data[i]);
        } else {
            my_printf("ERROR(%d) ", ret);
            write_ok = 0;
        }
    }
    my_printf("\n");
    
    if (!write_ok) {
        my_printf("Write failed!\n");
        return -1;
    }
    
    // EEPROM 쓰기 완료 대기 (필수)
    delay(100000);
    my_printf("Write completed, waiting...\n\n");
    
    // 데이터 읽기
    my_printf("Reading from EEPROM...\n");
    my_printf("Address: 0x%02x, Data: ", write_addr);
    int read_ok = 1;
    for (int i = 0; i < 4; i++) {
        int ret = i2c_read_d7r8(EEPROM_ADDR, write_addr + i, &read_data[i]);
        if (ret == 0) {
            my_printf("0x%02x ", read_data[i]);
        } else {
            my_printf("ERROR(%d) ", ret);
            read_ok = 0;
        }
    }
    my_printf("\n");
    
    if (!read_ok) {
        my_printf("Read failed!\n");
        return -1;
    }
    
    // 읽은 데이터 검증
    my_printf("\nVerification: ");
    int match = 1;
    for (int i = 0; i < 4; i++) {
        if (write_data[i] != read_data[i]) {
            match = 0;
            my_printf("\nMismatch at [%d]: wrote 0x%02x, read 0x%02x", 
                      i, write_data[i], read_data[i]);
        }
    }
    if (match) {
        my_printf("\nPASS\n");
    } else {
        my_printf("\nFAIL\n");
    }
    
    my_printf("\nTest completed\n");
    
    return 0;
}
