//------------------------------------------------------------------------------
// Copyright (c) 2025
// 4x4 Matrix Keypad API using GPIO
// PMODKYPD (Digilent PMOD Keypad) 호환
//------------------------------------------------------------------------------
#ifndef KEYPAD_API_H
#define KEYPAD_API_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// 키패드 하드웨어 연결 정보
// gpio_in[4:7]  = Column 입력 (C0~C3) - Pull-down 설정
// gpio_out[4:7] = Row 출력 (R0~R3) - 스캔용
//------------------------------------------------------------------------------

/**
 * @brief 키패드 초기화
 * 
 * @param gpio_base_addr GPIO 베이스 주소 (예: 0x90030000)
 * 
 * 초기화 내용:
 * - Row (gpio_out[4:7]): 출력 모드, 초기값 HIGH
 * - Column (gpio_in[4:7]): 입력 모드, Pull-down 설정
 */
void keypad_init(uint32_t gpio_base_addr);

/**
 * @brief 키패드 스캔 수행
 * 
 * @return 눌린 키의 인덱스 (0~15), 키가 안 눌리면 -1
 * 
 * 동작 방식:
 * 1. Row를 하나씩 LOW로 설정
 * 2. Column 입력값 읽기
 * 3. Column이 HIGH가 되면 키 눌림 감지
 * 4. 키 인덱스 = row * 4 + col
 */
int keypad_scan(void);

/**
 * @brief 키패드에서 문자 읽기
 * 
 * @return 눌린 키에 해당하는 문자, 키가 안 눌리면 0
 * 
 * 키 매핑:
 * 1 2 3 A
 * 4 5 6 B  
 * 7 8 9 C
 * 0 F E D
 */
char keypad_get_char(void);

/**
 * @brief 키패드 디바운싱 대기
 * 
 * @param ms 대기 시간 (밀리초)
 * 
 * 키 입력 후 안정화를 위한 지연 함수
 */
void keypad_delay_ms(uint32_t ms);

/**
 * @brief 키 눌림 대기 (블로킹)
 * 
 * @return 눌린 키 문자
 * 
 * 키가 눌릴 때까지 대기하고 문자 반환
 */
char keypad_wait_key(void);

#ifdef __cplusplus
}
#endif

#endif // KEYPAD_API_H
