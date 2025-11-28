/*==============================================================================
 * RISC-V 키패드 프로그램을 위한 링커 스크립트
 *==============================================================================*/

MEMORY
{
    /* 메모리 영역 정의 */
    RAM : ORIGIN = 0x00000000, LENGTH = 128K
    ROM : ORIGIN = 0x00000000, LENGTH = 128K
}

/* 엔트리 포인트 */
ENTRY(_start)

/* 섹션 정의 */
SECTIONS
{
    /* 텍스트 섹션 (코드) */
    .text : {
        *(.text.start)     /* 시작 코드 */
        *(.text)           /* 메인 코드 */
        *(.text.*)         /* 기타 텍스트 섹션 */
    } > RAM

    /* 읽기 전용 데이터 */
    .rodata : {
        *(.rodata)         /* 상수 데이터 */
        *(.rodata.*)       /* 기타 읽기 전용 데이터 */
    } > RAM

    /* 초기화된 데이터 */
    .data : {
        *(.data)           /* 초기화된 전역 변수 */
        *(.data.*)         /* 기타 초기화된 데이터 */
    } > RAM

    /* 초기화되지 않은 데이터 */
    .bss : {
        *(.bss)            /* 초기화되지 않은 전역 변수 */
        *(.bss.*)          /* 기타 초기화되지 않은 데이터 */
        *(COMMON)          /* 공통 심볼 */
    } > RAM

    /* 스택 영역 */
    .stack : {
        . = ALIGN(8);
        . += 0x1000;       /* 4KB 스택 */
    } > RAM

    /* 힙 영역 */
    .heap : {
        . = ALIGN(8);
        . += 0x1000;       /* 4KB 힙 */
    } > RAM

    /* 심볼 정의 */
    _text_start = ADDR(.text);
    _text_end = ADDR(.text) + SIZEOF(.text);
    
    _data_start = ADDR(.data);
    _data_end = ADDR(.data) + SIZEOF(.data);
    
    _bss_start = ADDR(.bss);
    _bss_end = ADDR(.bss) + SIZEOF(.bss);
    
    _stack_start = ADDR(.stack);
    _stack_end = ADDR(.stack) + SIZEOF(.stack);
    
    _heap_start = ADDR(.heap);
    _heap_end = ADDR(.heap) + SIZEOF(.heap);
}
