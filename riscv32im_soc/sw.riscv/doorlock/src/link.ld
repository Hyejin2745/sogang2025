/*----------------------------------------------------------------------------
 * THE MEMORY MODEL ASSUMED BY THIS IMPLEMENTATION
 *----------------------------------------------------------------------------*/
OUTPUT_ARCH( "riscv" )
ENTRY( _start )
MEMORY
{
  RAM (RWXA) : ORIGIN = 0x00000000, LENGTH = 128K
  ROM (RX)   : ORIGIN = 0x93000000, LENGTH = 32K
}
SECTIONS
{
    .text : {
        PROVIDE(_text_start = .);
        *(.text.init);
        *(.tohost);
        *(.fromhost);
        *(.text .text.*);
        PROVIDE(_text_end = .);
        . = ALIGN(8);
    } >RAM

      . = ALIGN(8);
      PROVIDE(__global_pointer$ = .);

    .rodata : {
        . = ALIGN(8);
        PROVIDE(_rodata_start = .);
        *(.rodata .rodata.*);
        *(.srodata .srodata.*);
        PROVIDE(_rodata_end = .);
        . = ALIGN(8);
    } >RAM

    .data : {
        . = ALIGN(8);
        PROVIDE(_data_start = .);
        *(.data .data.*);
        *(.sdata .sdata.*);
        PROVIDE(_data_end = .);
        . = ALIGN(8);
    } >RAM

    .bss (NOLOAD) : {
        . = ALIGN(8);
        PROVIDE(_bss_start = .);
        *(.bss .bss.*);
        *(.sbss .sbss.*);
        PROVIDE(_bss_end = .);
        . = ALIGN(8);
    } >RAM

    PROVIDE(_memory_start = ORIGIN(RAM));
    PROVIDE(_memory_end   = ORIGIN(RAM)+LENGTH(RAM));
    PROVIDE(_stack_end    = _memory_end);
    PROVIDE(_start_of_ram = ORIGIN(RAM));
    PROVIDE(_start_of_ram = ORIGIN(RAM)+LENGTH(RAM));
    PROVIDE(_start_of_rom = ORIGIN(ROM));
    PROVIDE(_start_of_rom = ORIGIN(ROM)+LENGTH(ROM));
}
