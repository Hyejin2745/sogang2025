//------------------------------------------------------------------------------
// Copyright (c) 2025
// 4x4 Matrix Keypad API using GPIO
// PMODKYPD (Digilent PMOD Keypad) 호환
//------------------------------------------------------------------------------
#include <stdint.h>
#include "keypad_api.h"
#include "gpio_api.h"

static uint32_t keypad_gpio_addr = 0x90030000;

// 키 매핑: [row][col] = key_value
// PMOD 키패드 레이아웃 (핀 매핑에 맞춤)
static const char keypad_map[4][4] = {
    {'0', 'F', 'E', 'D'},  // Row 0 → ROW4 (gpio_in[4])
    {'7', '8', '9', 'C'},  // Row 1 → ROW3 (gpio_in[5])
    {'4', '5', '6', 'B'},  // Row 2 → ROW2 (gpio_in[6])
    {'1', '2', '3', 'A'}   // Row 3 → ROW1 (gpio_in[7])
};

void keypad_init(uint32_t gpio_base_addr) {
    keypad_gpio_addr = gpio_base_addr;
    
    // GPIO 주소 설정
    gpio_set_addr(gpio_base_addr);
    
    // 실제 하드웨어 연결:
    // - gpio_out[4:7] = ROW1~4 (풀업저항 없음, 출력으로 사용)
    // - gpio_in[4:7] = COL1~4 (풀업저항 있음, 입력으로 사용)
    // 
    // 동작 방식: Row를 순차적으로 LOW로 구동하고 Column 상태 읽기
    // gpio_out[4:7] = Row 제어 (LOW로 구동)
    // gpio_in[4:7] = Column 입력 (풀업으로 HIGH, 키 누르면 LOW)
    
    // 초기 상태: 모든 Row를 HIGH로 설정 (비활성화)
    gpio_write(0x000000F0);  // Row 모두 HIGH (0xF0 = 0b11110000)
}

int keypad_scan(void) {
    gpio_set_addr(keypad_gpio_addr);
    
    // 각 Row를 순차적으로 LOW로 구동하고 Column을 읽음
    for (int row = 0; row < 4; row++) {
        // 현재 Row만 LOW로 설정, 나머지 Row는 HIGH 유지
        // gpio_out[4:7] = ROW1~4 제어
        uint32_t row_pattern = 0x000000F0 & ~(1 << (row + 4));
        gpio_write(row_pattern);
        
        // 신호 안정화를 위한 짧은 지연
        volatile int delay = 1000;  // 약 10μs @ 100MHz
        while (delay--);
        
        // Column 입력 읽기 (gpio_in[4:7] = COL1~4)
        uint32_t input = gpio_read();
        uint32_t columns = (input >> 4) & 0x0F;  // 상위 4비트 추출
        
        // 키 감지 확인
        // Column 핀에 풀업으로 평상시 Column은 HIGH(1)
        // 키가 눌리면 해당 Column이 LOW(0)로 변경됨
        if (columns != 0x0F) {  // Column 중 하나라도 LOW이면 키 눌림
            // 눌린 Column 찾기
            for (int col = 0; col < 4; col++) {
                // 해당 Column 비트가 LOW인지 확인
                if (!(columns & (1 << col))) {
                    // 키가 눌림: row와 col 조합으로 키 인덱스 계산
                    // 모든 Row를 HIGH로 복원
                    gpio_write(0x000000F0);
                    return row * 4 + col;
                }
            }
        }
    }
    
    // 모든 Row를 HIGH로 복원 (기본 상태)
    gpio_write(0x000000F0);
    
    return -1;  // 키가 눌리지 않음
}

char keypad_get_char(void) {
    int key = keypad_scan();
    if (key >= 0 && key < 16) {
        // key = row * 4 + col이므로
        // key / 4 = row, key % 4 = col
        int row = key / 4;
        int col = key % 4;
        return keypad_map[row][col];
    }
    return 0;  // 키가 눌리지 않음
}

void keypad_delay_ms(uint32_t ms) {
    // 간단한 지연 함수 (대략적인 밀리초 단위)
    // 100MHz 클럭 기준 대략 100,000 사이클 = 1ms
    volatile uint32_t delay = ms * 100000;
    while (delay--) {
        __asm__ __volatile__("nop");
    }
}

char keypad_wait_key(void) {
    char key;
    
    // 키가 눌릴 때까지 대기
    do {
        key = keypad_get_char();
        if (key != 0) {
            // 키가 눌렸으면 디바운싱 대기
            keypad_delay_ms(50);  // 50ms 디바운싱
            
            // 키가 여전히 눌려있는지 확인
            char confirm = keypad_get_char();
            if (confirm == key) {
                // 키가 떼어질 때까지 대기 (키 반복 방지)
                while (keypad_get_char() != 0) {
                    keypad_delay_ms(10);
                }
                return key;
            }
        }
        keypad_delay_ms(10);  // 스캔 간격
    } while (1);
}
