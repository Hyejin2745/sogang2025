//------------------------------------------------------------------------------
// Copyright (c) 2025
// EEPROM API using I2C
// AT24C02 EEPROM 호환
//------------------------------------------------------------------------------
#ifndef EEPROM_API_H
#define EEPROM_API_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// EEPROM 설정
// Device Address: 0x50 (AT24C02 기본 7-bit 주소)
// Memory Size: 256 bytes (0x00 ~ 0xFF)
//------------------------------------------------------------------------------

/**
 * @brief EEPROM 초기화 (특정 주소들을 초기값으로 리셋)
 * 
 * 다른 사용자가 저장한 데이터를 초기화할 때 사용
 * 필요할 때만 호출하여 EEPROM을 깨끗한 상태로 만듦
 */
void eeprom_reset(void);

/**
 * @brief EEPROM 읽기/쓰기 테스트
 * 
 * EEPROM의 기본 동작을 확인하는 테스트 함수
 * - 0x00 주소에 테스트 데이터 쓰기
 * - 쓴 데이터 읽어서 검증
 * - 결과를 터미널에 출력
 */
void eeprom_test(void);

#ifdef __cplusplus
}
#endif

#endif // EEPROM_API_H
