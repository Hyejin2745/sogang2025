#pragma once
/**
 * @file i2c_api.h
 * @brief I2C AXI-Lite peripheral API based on i2c_csr.v.
 */
//------------------------------------------------------------------------------
// Copyright (c) 2025
// All rights reserved.
//------------------------------------------------------------------------------
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//------------------------------------------------------------------------------
// Control field helpers for DATA0 (see i2c_csr.v / i2c_core.v)
//   [7:1] device 7-bit address (MSB first on the wire)
//   [0]   R/W bit (0=write, 1=read)
//   [15:8] word address (8-bit)
//   [16]  random read flag (1=random)
//   [17]  page mode flag  (1=page mode)
//   [31]  start bit (1=drive SDA low to start)
//------------------------------------------------------------------------------
#define I2C_CTRL_RW(_rw_)         ((uint32_t)(((_rw_) & 0x1u) << 0))
#define I2C_CTRL_DEV7(_dev7_)     ((uint32_t)(((_dev7_) & 0x7Fu) << 1))
#define I2C_CTRL_WORD(_word_)     ((uint32_t)(((_word_) & 0xFFu) << 8))
#define I2C_CTRL_RANDOM(_b_)      ((uint32_t)(((_b_) & 0x1u) << 16))
#define I2C_CTRL_PAGE(_b_)        ((uint32_t)(((_b_) & 0x1u) << 17))
#define I2C_CTRL_START            (1u << 31)

//------------------------------------------------------------------------------
// Basic register-level helpers
//------------------------------------------------------------------------------
uint32_t i2c_read_data(void);      // read DATA2 (32-bit read buffer)
void     i2c_write_data(uint32_t); // write DATA1 (write buffer)
void     i2c_get_status_and_state(uint32_t *status, uint8_t *state); // read STATUS and state (bit[0]=busy, bit[1]=done, bit[12:8]=state)

//------------------------------------------------------------------------------
// Convenience: compose and kick a transaction in one call
//   dev7     : 7-bit device address
//   word     : 8-bit word/offset address
//   is_read  : 0=write, 1=read
//   random   : 1=random read (will internally issue write-then-read)
//   page     : 1=enable page mode (up to 4 bytes in DATA1)
//------------------------------------------------------------------------------
void i2c_start_simple(uint8_t dev7,
                      uint8_t word,
                      uint8_t is_read,
                      uint8_t random,
                      uint8_t page);

//------------------------------------------------------------------------------
// I2C 하드웨어 초기화: data0 레지스터를 0으로 클리어하여 idle 상태 유지
// 이전 펌웨어 실행 후 남아있을 수 있는 START 비트를 제거
//------------------------------------------------------------------------------
void i2c_init(void);

//------------------------------------------------------------------------------
// CSR dump and base address management
//------------------------------------------------------------------------------
void     i2c_csr(void);
int      i2c_set_addr(uint32_t offset);
uint32_t i2c_get_addr(void);

#ifdef __cplusplus
}
#endif

//------------------------------------------------------------------------------
// Revision History
// 2025.11.07: Initial version.
//------------------------------------------------------------------------------
