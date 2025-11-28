#include <stdint.h>
#include "my_printf.h"
#include "uart_api.h"
#include "i2c_api.h"

#ifndef BAUD_RATE
#define BAUD_RATE 115200
#endif

int main(void)
{
    // UART 초기화
    uart_init(0, BAUD_RATE, 8, 0, 1);
    my_printf("main start\n");    
  
    i2c_set_addr(0x90040000U);
    i2c_init(); // data0 레지스터를 0으로 클리어하여 idle 상태 유지
    my_printf("I2C EEPROM write test start\n\n");
    
    // I2C WRITE 트랜잭션
    uint8_t  dev7  = 0x57;          // I2C 디바이스 7-bit 주소
    uint8_t  word  = 0x00;           // 워드/오프셋 주소
    uint32_t wdata = 0x11223344;     // 쓸 데이터 (4바이트)
    
    i2c_csr();
    uint32_t data0;
    uint32_t data1;
    my_printf("[I2C WRITE] dev7=0x%02x word=0x%02x data=0x%08x\n", dev7, word, wdata);
    
    // while (1){
    //i2c_write_data(wdata);

    i2c_start_simple(dev7, word, 0 /* is_read: write */, 0 /* random */, 0 /* page */);

    uint32_t status;
    uint8_t state;
    i2c_get_status_and_state(&status, &state);
    my_printf("[I2C STATE] status=0x%08x (busy=%d, done=%d, state=%d)\n", 
              status, status & 0x1, (status >> 1) & 0x1, state);

    while (1){
    
    i2c_read_word(0x90040008, data0);
    i2c_read_word(0x9004000C, data1);
    my_printf("data0=0x%08x\n", data0);
    my_printf("data1=0x%08x\n", data1);
        for (volatile int i = 0; i < 1000000; i++) {  // 지연 시간 줄임
            __asm__ __volatile__("nop");
        }
    }
}