#include <stdint.h>
#include "uart_api.h"
#include "i2c_master_api.h"
#include "gpio_api.h"
#include "eeprom_api.h"
#include "keypad_api.h"
#include "my_printf.h"
#include <string.h>

int main()
{
    // ---------------------------------------------
    // UART init
    // ---------------------------------------------
    uart_set_addr(0x90020000);
    uart_init(100000000, 115200, 8, 0, 1);

    // // ---------------------------------------------
    // // I2C init
    // // ---------------------------------------------
    // i2c_set_addr(0x90050000);
    // i2c_init(100000);         // 100kHz
    // i2c_enable();

    // my_printf("\r\n=== I2C EEPROM Test ===\r\n");

    // // ---------------------------------------------
    // // EEPROM 초기화 (필요할 때만 주석 해제)
    // // ---------------------------------------------
    // // eeprom_reset();  // 다른 사람이 비밀번호 저장했을 때 초기화용

    // // ---------------------------------------------
    // // I2C EEPROM Test (optional)
    // // ---------------------------------------------
    // eeprom_test();
    
    // ---------------------------------------------
    // Keypad Test
    // ---------------------------------------------
    keypad_init(0x90030000);
    
    my_printf("\r\n=== GPIO Debug Test ===\r\n");
    
    // GPIO 초기 상태 확인
    gpio_set_addr(0x90030000);
    uint32_t initial_gpio = gpio_read();
    my_printf("Initial GPIO: 0x%08x\r\n", initial_gpio);
    my_printf("Initial Columns [7:4]: 0x%x\r\n", (initial_gpio >> 4) & 0x0F);
    
    // 각 Row를 개별 테스트
    my_printf("\r\nRow Test:\r\n");
    for (int row = 0; row < 4; row++) {
        uint32_t row_pattern = 0x000000F0 & ~(1 << (row + 4));
        gpio_write(row_pattern);
        volatile int delay = 10000; while (delay--); // 긴 지연
        uint32_t gpio_val = gpio_read();
        uint32_t columns = (gpio_val >> 4) & 0x0F;
        my_printf("Row%d LOW (0x%02x): Columns=0x%x\r\n", 
                 row+1, row_pattern, columns);
    }
    gpio_write(0x000000F0); // 복원
    
    my_printf("\r\nKeypad Test:\r\n");
    my_printf("Press any key on keypad...\r\n");
    
    int key_count = 0;
    while (1) {
        char key = keypad_get_char();
        if (key != 0) {
            key_count++;
            my_printf("Key: %c (count: %d)\r\n", key, key_count);
            keypad_delay_ms(500); // 더 긴 지연
            
            if (key_count >= 20) {
                my_printf("Too many keys detected - stopping\r\n");
                break;
            }
        }
    }

    return 0;
}

