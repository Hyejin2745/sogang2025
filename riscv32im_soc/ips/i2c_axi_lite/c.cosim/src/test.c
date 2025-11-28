#include <stdio.h>
#include <stdint.h>
#include "i2c_api.h"

// 간단한 I2C EEPROM(24xx 계열 가정) 읽기/쓰기 예제
//  - dev7  : 7-bit device address (예: 0x50)
//  - word  : 8-bit word/offset address
//  - write : DATA1에 데이터를 쓰고, DATA0에 control + START 비트를 써서 트랜잭션 시작
//  - read  : control에 읽기 플래그를 세팅하고, DATA2에서 결과를 읽어옴

int test(void)
{
    uint8_t  dev7  = 0x57;          // I2C 디바이스 7-bit 주소 예제
    uint8_t  word  = 0x00;          // 워드/오프셋 주소
    uint32_t wdata = 0x11223344;    // 쓸 데이터 (최대 4바이트)
    uint32_t rdata;

    printf("---- I2C CSR dump ----\n");
    
    printf("I2C base addr : 0x%08X\n", i2c_get_addr());

    // 1) I2C WRITE 트랜잭션
    printf("\n[I2C WRITE]\n");
    printf("  dev7=0x%02X word=0x%02X data=0x%08X\n", dev7, word, wdata);

    // DATA1(write buffer)에 데이터 쓰기
    i2c_write_data(wdata);

    // DATA0(control)에 트랜잭션 정보 + START 비트 설정
    // is_read = 0 (write), random = 0, page = 0
    i2c_start_simple(dev7,
                     word,
                     0 /* is_read: write */,
                     0 /* random */,
                     0 /* page */);

    printf("  write transaction issued.\n");

    // 2) I2C READ 트랜잭션
    //    실제 디바이스 특성에 따라 status polling, random read 등이 필요할 수 있음.
    printf("\n[I2C READ]\n");
    printf("  dev7=0x%02X word=0x%02X\n", dev7, word);

    // is_read = 1 (read), random = 0, page = 1 (4바이트 읽기)
    i2c_start_simple(dev7,
                     word,
                     1 /* is_read: read */,
                     0 /* random */,
                     1 /* page */);  // page=1로 변경하여 4바이트 읽기

    // I2C 코어의 상태가 stop까지 도달할 시간을 충분히 주기 위해 STATUS를 폴링한다.
    //  - csr_status[0] = busy (state != idle)
    //  - csr_status[1] = done (state == stop)
    // 여기서는 "done == 1" 이 될 때까지 기다리고, 그 후에도 busy가 0이 될 때까지 기다린다.
    // (i2c_tb.v의 #100 대기와 유사한 효과)
    {
        int timeout = 1000; // AXI 트랜잭션과 I2C FSM이 충분히 돌 수 있도록 넉넉히 확보
        int done_count = 0;
        
        while (1) {
            uint32_t status;
            uint8_t state;
            i2c_get_status_and_state(&status, &state);
            uint32_t busy   = status & 0x1;
            uint32_t done   = (status >> 1) & 0x1;
            
            if (done) {
                done_count++;
                // done이 1이 된 후에도 몇 번 더 폴링하여 상태가 안정화되도록 함
                // (i2c_tb.v의 #100 대기와 유사한 효과)
                if (done_count >= 10) {
                    printf("  STATUS: busy=%u done=%u (stop reached, stabilized)\n", busy, done);
                    break;
                }
            } else {
                done_count = 0;  // done이 0이면 카운터 리셋
            }
            
            if (--timeout <= 0) {
                printf("I2C status polling timeout: status=0x%08X (busy=%u done=%u)\n",
                       status, busy, done);
                break;
            }
        }
    }
    
    // stop 이후 DATA2를 읽어서 값 확인
    rdata = i2c_read_data();
    printf("    read data : 0x%08X\n", rdata);
    
    i2c_csr();

    printf("\nI2C cosim test done.\n");
    return 0;
}


