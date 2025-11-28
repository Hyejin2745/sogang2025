/**
 * @file i2c_api.c
 * @brief I2C AXI-Lite peripheral API based on i2c_csr.v.
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025
// All rights reserved.
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdint.h>
#include "i2c_api.h"
// If standard printf is unavailable (no libc), map to my_printf
#if !defined(I2C_API_USE_STDIO)
#include "my_printf.h"
#define printf my_printf
#endif

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Register access macros (same convention as gpio_api.c)
//------------------------------------------------------------------------------
#if defined(TRX_BFM) && (TRX_BFM==1)
    #include "trx_axi_api.h"
    extern con_Handle_t con_handle;
    #define CSR_READ(A, D)  BfmRead (con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
    #define CSR_WRITE(A, D) BfmWrite(con_handle, (unsigned int)(A), (unsigned int*)&(D), 4, 1)
#elif defined(COSIM_LIB) && (COSIM_LIB==1)
    #include "cosim_bfm_api.h"
    #define CSR_READ(A, D)  bfm_read ((uint32_t)(A), (uint8_t*)&(D), 4, 1)
    #define CSR_WRITE(A, D) bfm_write((uint32_t)(A), (uint8_t*)&(D), 4, 1)
#elif defined(XDMA_LIB) && (XDMA_LIB==1)
    #include "xdma_api.h"
    extern XdmaHandle_t xdma_handle;
    #define CSR_READ(A, D)  xdmaUserRegRead (xdma_handle, A, &(D))
    #define CSR_WRITE(A, D) xdmaUserRegWrite(xdma_handle, A, D)
#else
#   define CSR_WRITE(A, B)   *(volatile unsigned *)A = B;
#   define CSR_READ(A, B)    B = *(volatile unsigned *)A;
#endif

//------------------------------------------------------------------------------
// Base address and register offsets (see i2c_csr.v)
//------------------------------------------------------------------------------
static uint32_t ADDR_I2C    = 0x90040000;
static uint32_t CSRA_VERSION = 0x90040000+0x00;
static uint32_t CSRA_NAME    = 0x90040000+0x04;
static uint32_t CSRA_DATA0   = 0x90040000+0x08;
static uint32_t CSRA_DATA1   = 0x90040000+0x0C;
static uint32_t CSRA_STATUS  = 0x90040000+0x10;
static uint32_t CSRA_DATA2   = 0x90040000+0x14;

//------------------------------------------------------------------------------
// Register-level helpers
//------------------------------------------------------------------------------
uint32_t i2c_read_data(void)
{
    uint32_t v;
    CSR_READ(CSRA_DATA2, v);
    return v;
}

void i2c_write_data(uint32_t value)
{
    CSR_WRITE(CSRA_DATA1, value);
}

void i2c_read_word(uint32_t addr,uint32_t value)
{
    CSR_READ(addr, value);
}

//------------------------------------------------------------------------------
// STATUS와 state를 함께 읽기
// STATUS 레지스터: bit[0]=busy, bit[1]=done, bit[12:8]=state (5비트)
//------------------------------------------------------------------------------
void i2c_get_status_and_state(uint32_t *status, uint8_t *state)
{
    uint32_t s;
    CSR_READ(CSRA_STATUS, s);
    if (status != NULL) {
        *status = s;
    }
    if (state != NULL) {
        *state = (uint8_t)((s >> 8) & 0x1F);  // bit[12:8] 추출
    }
}

void i2c_start_simple(uint8_t dev7,
                      uint8_t word,
                      uint8_t is_read,
                      uint8_t random,
                      uint8_t page)
{
    // volatile로 선언하여 컴파일러 최적화 방지
    volatile uint32_t ctrl = 0;
    ctrl |= I2C_CTRL_DEV7(dev7);
    ctrl |= I2C_CTRL_RW(is_read);
    ctrl |= I2C_CTRL_WORD(word);
    ctrl |= I2C_CTRL_RANDOM(random);
    ctrl |= I2C_CTRL_PAGE(page);
    ctrl |= I2C_CTRL_START;
    
    // 디버깅: ctrl 값 확인
    printf("i2c_start_simple: ctrl=0x%08x\n", (uint32_t)ctrl);
    
    // // ========== 상세 디버깅 시작 ==========
    // printf("=== CSR_WRITE 디버깅 시작 ===\n");
    
    // // 1. 주소 확인
    // printf("1. 주소 확인:\n");
    // printf("   CSRA_DATA0 = 0x%08x\n", CSRA_DATA0);
    // printf("   CSRA_VERSION = 0x%08x (비교용)\n", CSRA_VERSION);
    // printf("   CSRA_NAME = 0x%08x (비교용)\n", CSRA_NAME);
    
    // // 2. 쓰기 전 값 확인
    // printf("2. 쓰기 전 레지스터 값:\n");
    // uint32_t data0_before, version_before, name_before;
    // CSR_READ(CSRA_DATA0, data0_before);
    // CSR_READ(CSRA_VERSION, version_before);
    // CSR_READ(CSRA_NAME, name_before);
    // printf("   DATA0 before = 0x%08x\n", data0_before);
    // printf("   VERSION = 0x%08x (읽기 테스트)\n", version_before);
    // printf("   NAME = 0x%08x (읽기 테스트)\n", name_before);
    
    // // 3. CSR_WRITE 매크로 확장 확인
    // printf("3. CSR_WRITE 매크로 테스트:\n");
    // printf("   ctrl 값 = 0x%08x\n", ctrl);
    // printf("   CSR_WRITE(CSRA_DATA0, ctrl) 실행...\n");
    
    // // 4. 직접 포인터로 쓰기 테스트
    // volatile uint32_t *data0_ptr = (volatile uint32_t *)CSRA_DATA0;
    // volatile uint32_t *version_ptr = (volatile uint32_t *)CSRA_VERSION;
    // printf("   data0_ptr = (volatile uint32_t *)0x%08x\n", (uint32_t)data0_ptr);
    // printf("   version_ptr = (volatile uint32_t *)0x%08x\n", (uint32_t)version_ptr);
    
    // // 5. 방법 1: CSR_WRITE 매크로 사용
    // printf("   방법 1: CSR_WRITE 매크로 사용\n");
    // printf("      매크로 확장: *(volatile unsigned *)0x%08x = 0x%08x\n", CSRA_DATA0, ctrl);
    CSR_WRITE(CSRA_DATA0, ctrl);
    
    // 쓰기 후 값 확인 (디버깅)
    uint32_t data0_after;
    CSR_READ(CSRA_DATA0, data0_after);
    printf("i2c_start_simple: after write, DATA0=0x%08x (expected=0x%08x)\n", data0_after, (uint32_t)ctrl);
    if (data0_after != (uint32_t)ctrl) {
        printf("WARNING: DATA0 write failed! Written=0x%08x, Read=0x%08x\n", (uint32_t)ctrl, data0_after);
    }
    // printf("      CSR_WRITE 완료\n");
    
    // // 6. 방법 2: 직접 포인터 사용
    // printf("   방법 2: 직접 포인터 사용 (*data0_ptr = ctrl)\n");
    // printf("      *((volatile uint32_t *)0x%08x) = 0x%08x\n", (uint32_t)data0_ptr, ctrl);
    // *data0_ptr = ctrl;
    // printf("      직접 포인터 쓰기 완료\n");
    
    // // 7. 방법 3: 인라인 어셈블리로 직접 쓰기 (RISC-V)
    // printf("   방법 3: 인라인 어셈블리로 직접 쓰기\n");
    // uint32_t addr_val = CSRA_DATA0;
    // printf("      sw 명령어: sw 0x%08x, 0(0x%08x)\n", ctrl, addr_val);
    // __asm__ __volatile__(
    //     "sw %0, 0(%1)"
    //     :
    //     : "r" (ctrl), "r" (addr_val)
    //     : "memory"
    // );
    // printf("      인라인 어셈블리 쓰기 완료\n");
    
    // // 8. 쓰기 후 값 확인 (각 방법마다 즉시 확인)
    // printf("4. 쓰기 후 레지스터 값 (각 방법마다 즉시 확인):\n");
    // uint32_t data0_after1, data0_after2, data0_after3;
    
    // // 방법 1 후 확인
    // CSR_READ(CSRA_DATA0, data0_after1);
    // printf("   방법 1 후 CSR_READ = 0x%08x\n", data0_after1);
    
    // // 방법 2 후 확인
    // data0_after2 = *data0_ptr;
    // printf("   방법 2 후 직접 포인터 = 0x%08x\n", data0_after2);
    
    // // 방법 3 후 확인
    // __asm__ __volatile__(
    //     "lw %0, 0(%1)"
    //     : "=r" (data0_after3)
    //     : "r" (addr_val)
    //     : "memory"
    // );
    // printf("   방법 3 후 인라인 어셈블리 = 0x%08x\n", data0_after3);
    
    // // 최종 확인 (모든 쓰기 후)
    // uint32_t data0_final;
    // CSR_READ(CSRA_DATA0, data0_final);
    // printf("   최종 CSR_READ = 0x%08x\n", data0_final);
    
    // // 9. 결과 분석
    // printf("5. 결과 분석:\n");
    // printf("   예상 값 = 0x%08x\n", ctrl);
    // if (data0_after1 == ctrl) {
    //     printf("   ✓ CSR_READ: 성공\n");
    // } else {
    //     printf("   ✗ CSR_READ: 실패 (읽은 값 = 0x%08x)\n", data0_after1);
    // }
    // if (data0_after2 == ctrl) {
    //     printf("   ✓ 직접 포인터: 성공\n");
    // } else {
    //     printf("   ✗ 직접 포인터: 실패 (읽은 값 = 0x%08x)\n", data0_after2);
    // }
    // if (data0_after3 == ctrl) {
    //     printf("   ✓ 인라인 어셈블리: 성공\n");
    // } else {
    //     printf("   ✗ 인라인 어셈블리: 실패 (읽은 값 = 0x%08x)\n", data0_after3);
    // }
    
    // printf("=== CSR_WRITE 디버깅 종료 ===\n\n");
    // // ========== 상세 디버깅 종료 ==========
    
    // 디버그: 전송될 8-bit device address 계산
    uint8_t addr8 = (dev7 << 1) | (is_read ? 1 : 0);
    printf("i2c_start_simple: data0=0x%08x\n", ctrl);
    printf("  dev7=0x%02x (7-bit), is_read=%d, addr8=0x%02x (8-bit: ", dev7, is_read, addr8);
    // 8-bit 주소를 비트 단위로 출력
    for (int i = 7; i >= 0; i--) {
        printf("%d", (addr8 >> i) & 1);
    }
    printf(")\n");
}

//------------------------------------------------------------------------------
// I2C 하드웨어 초기화: data0 레지스터를 0으로 클리어하여 idleS 상태 유지
// 이전 펌웨어 실행 후 남아있을 수 있는 START 비트(bit[31])를 제거
//------------------------------------------------------------------------------
void i2c_init(void)
{
    // DATA0 레지스터를 0으로 클리어 (START 비트 제거)
    uint32_t zero = 0;
    CSR_WRITE(CSRA_DATA0, zero);

    // 초기 상태 확인
    uint32_t status;
    uint8_t state;
    i2c_get_status_and_state(&status, &state);
    printf("i2c_init initial status=0x%08x (busy=%d, done=%d, state=%d)\n\n", 
           status, status & 0x1, (status >> 1) & 0x1, state);
    
    // int loop_count = 0;
    // do {
    //     CSR_READ(CSRA_STATUS, status);
    //     timeout--;
    //     loop_count++;
        
    //     // 주기적으로 상태 출력 (1000번마다)
    //     if (loop_count % 1000 == 0) {
    //         uint8_t current_state = i2c_get_state();
    //         printf("i2c_init waiting... status=0x%08x (busy=%d, done=%d, state=%d) timeout=%d\n", 
    //                status, status & 0x1, (status >> 1) & 0x1, current_state, timeout);
    //     }
        
    //     if (timeout <= 0) {
    //         uint8_t final_state = i2c_get_state();
    //         printf("i2c_init timeout! final status=0x%08x (busy=%d, done=%d, state=%d)\n", 
    //                status, status & 0x1, (status >> 1) & 0x1, final_state);
    //         break; // 타임아웃 시 종료
    //     }
        
    //     // 상태 머신이 클럭에 맞춰 동작하도록 충분한 지연
    //     // I2C 클럭이 500kHz이고 분주비가 100이면, 한 비트당 약 200 클럭 사이클
    //     // 전체 트랜잭션이 완료되려면 수백~수천 클럭 사이클 필요
    //     volatile int i;
    //     for (i = 0; i < 100; i++) {  // 지연 시간 줄임
    //         __asm__ __volatile__("nop");
    //     }
    // } while ((status & 0x1) != 0); // busy 비트가 0이 될 때까지 대기

}

//------------------------------------------------------------------------------
// CSR dump and base address management
//------------------------------------------------------------------------------
void i2c_csr(void)
{
    uint32_t dataR;
    CSR_READ(CSRA_VERSION, dataR); printf("I2C VERSION: 0x%08x\n", dataR);
    CSR_READ(CSRA_NAME   , dataR); printf("I2C NAME   : 0x%08x\n", dataR);
    CSR_READ(CSRA_DATA0  , dataR); printf("I2C DATA0  : 0x%08x\n", dataR);
    CSR_READ(CSRA_DATA1  , dataR); printf("I2C DATA1  : 0x%08x\n", dataR);
    CSR_READ(CSRA_STATUS , dataR); printf("I2C STATUS : 0x%08x\n", dataR);
    CSR_READ(CSRA_DATA2  , dataR); printf("I2C DATA2  : 0x%08x\n", dataR);
    printf("\n");
}

int i2c_set_addr(uint32_t offset)
{
    ADDR_I2C    = offset;
    CSRA_VERSION = offset+0x00;
    CSRA_NAME    = offset+0x04;
    CSRA_DATA0   = offset+0x08;
    CSRA_DATA1   = offset+0x0C;
    CSRA_STATUS  = offset+0x10;
    CSRA_DATA2   = offset+0x14;
    return 0;
}

uint32_t i2c_get_addr(void)
{
    return ADDR_I2C;
}

//------------------------------------------------------------------------------
#undef CSR_WRITE
#undef CSR_READ

#ifdef __cplusplus
}
#endif

//------------------------------------------------------------------------------
// Revision History
// 2025.11.07: Initial version.
//------------------------------------------------------------------------------
