//------------------------------------------------------------------------------
// Copyright (c) 2025 by Ando Ki.
// All right reserved.
//------------------------------------------------------------------------------
// +---------+       +---------+       +---------+
// |         |------>|         |<=====>|         |
// | tester  |       | riscv   |       | tty     |
// |         |       | cache   |       |         |
// |         |       | soc     |       +---------+
// |         |       |         |
// |         |       |+-------+|
// |         |       || mem   ||
// |         |       ||       ||
// |         |       |+-------+|
// +---------+       +---------+
// tester loads image to 'mem'.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef ADDR_ENTRY
    `define ADDR_ENTRY 32'h0
`endif
`ifndef FILE_BIN
    `define FILE_BIN   "test.bin"
`endif
`ifndef BAUD_RATE
    `define BAUD_RATE   115200
`endif

module top ;
    //--------------------------------------------------------------------------
    localparam int  ACLK_FREQ_MHZ=100;
    localparam int  ACLK_FREQ=ACLK_FREQ_MHZ*1_000_000;
    localparam real ACLK_HALF=(1_000_000_000.0/ACLK_FREQ/2.0);
    reg  axi_aresetn=1'b0; initial begin #124; axi_aresetn=1'b1; end
    reg  axi_aclk=1'b0; always #ACLK_HALF axi_aclk <= ~axi_aclk;
    //--------------------------------------------------------------------------
    localparam BOOT_VECTOR            = 32'h0000_0000;
    localparam CORE_ID                = 0;
    localparam SUPPORT_SUPER          = 0;//Enable supervisor / user privilege levels.
    localparam SUPPORT_MMU            = 0;//Enable basic memory management unit.
    localparam SUPPORT_MULDIV         = 1;//Enable HW multiply / divide (RV-M).
    localparam SUPPORT_LOAD_BYPASS    = 1;//Support load result bypass paths.
    localparam SUPPORT_MUL_BYPASS     = 1;//Support multiply result bypass paths.
    localparam SUPPORT_REGFILE_XILINX = 0;//Support Xilinx optimised register file.
    localparam EXTRA_DECODE_STAGE     = 0;//Extra decode pipe stage for improved timing.
    localparam MEM_CACHE_ADDR_MIN     = 32'h0000_0000;//Lowest cacheable memory address.
    localparam MEM_CACHE_ADDR_MAX     = 32'h0FFF_FFFF;//Highest cacheable memory address.
    localparam MEM_ONCHIP_ADDR        = 32'h0000_0000;//Lowest on-chip memory address.
    localparam MEM_ONCHIP_SIZE        = 128*1024 ;//size of memory from MEM_CACHE_ADDR_MIN
    localparam ADDR_PERIPHERAL = 32'h9000_0000;// starting address of peripherals
    localparam SIZE_PERIPHERAL = 32'h1000_0000;// size of address of peripherals
    localparam BAUD_RATE       = `BAUD_RATE;// uart board rate
    localparam ADDR_PIC   = 32'h9000_0000;// starting address of PIC
    localparam ADDR_TIMER = 32'h9001_0000;// starting address of TIMER
    localparam ADDR_UART  = 32'h9002_0000;// starting address of UART
    localparam SIZE_PIC   = 32'h0000_1000;
    localparam SIZE_TIMER = 32'h0000_1000;
    localparam SIZE_UART  = 32'h0000_1000;
    localparam NUM_IRQ    = 5; // timer(0), uart(1), gpio(2), i2c(3), i2c_a(4)
    localparam IRQ_TIMER  = 0; // timer(0)
    localparam IRQ_UART   = 1; // uart(1)
    localparam IRQ_GPIO   = 2; // gpio(2)
    localparam IRQ_I2C    = 3; // i2c(3)
    localparam IRQ_I2C_A  = 4; // i2c_a(4)
    //--------------------------------------------------------------------------
    wire  cpu_resetn;
    wire  uart_txd;
    wire  uart_rxd;
    wire  uart_rts_n;
    wire  uart_cts_n=uart_rts_n;
    reg   [7:0] gpio_in_reg = 8'h0; // GPIO input for keypad simulation
    wire  [7:0] gpio_in = gpio_in_reg;
    wire  [7:0] gpio_out;         // GPIO output
    
    // 키패드 시뮬레이션: Row가 LOW일 때 해당 Column을 HIGH로 만듦
    always @(*) begin
        gpio_in_reg[7:4] = 4'h0; // 기본값: 모든 Column LOW (pull-down)
        
        // 키패드 매트릭스 시뮬레이션 (키 '1' 눌림 시뮬레이션)
        if (~gpio_out[4]) begin // Row 0이 LOW일 때
            gpio_in_reg[4] = 1'b1; // Column 0을 HIGH로 (키 '1' 눌림)
        end
        
        //다른 키들도 필요하면 추가 가능
        if (~gpio_out[5]) begin // Row 1이 LOW일 때
            gpio_in_reg[5] = 1'b1; // Column 1을 HIGH로 (키 '5' 눌림)
        end
    end
    wire  scl_a;                  // I2C clock line (for I2C_A)
    wire  sda_a;                  // I2C data line (for I2C_A)
    //--------------------------------------------------------------------------
    pullup u_pu(uart_rxd); // make default high, since 0 means start.
    pullup u_pu_scl(scl_a); // I2C SCL pull-up (required for open-drain bus)
    pullup u_pu_sda(sda_a); // I2C SDA pull-up (required for open-drain bus)
    //--------------------------------------------------------------------------
    riscv_cache_soc #(.BOOT_VECTOR           (BOOT_VECTOR           )
                     ,.CORE_ID               (CORE_ID               )
                     ,.SUPPORT_SUPER         (SUPPORT_SUPER         )
                     ,.SUPPORT_MMU           (SUPPORT_MMU           )
                     ,.SUPPORT_MULDIV        (SUPPORT_MULDIV        )
                     ,.SUPPORT_LOAD_BYPASS   (SUPPORT_LOAD_BYPASS   )
                     ,.SUPPORT_MUL_BYPASS    (SUPPORT_MUL_BYPASS    )
                     ,.SUPPORT_REGFILE_XILINX(SUPPORT_REGFILE_XILINX)
                     ,.EXTRA_DECODE_STAGE    (EXTRA_DECODE_STAGE    )
                     ,.MEM_CACHE_ADDR_MIN    (MEM_CACHE_ADDR_MIN    )
                     ,.MEM_CACHE_ADDR_MAX    (MEM_CACHE_ADDR_MAX    )
                     ,.MEM_ONCHIP_ADDR       (MEM_ONCHIP_ADDR       )
                     ,.MEM_ONCHIP_SIZE       (MEM_ONCHIP_SIZE       )
                     ,.ADDR_PERIPHERAL       (ADDR_PERIPHERAL       )
                     ,.SIZE_PERIPHERAL       (SIZE_PERIPHERAL       )
                     ,.BAUD_RATE             (BAUD_RATE             )
                     ,.ACLK_FREQ             (ACLK_FREQ             )
                     ,.ADDR_PIC              (ADDR_PIC              )
                     ,.ADDR_TIMER            (ADDR_TIMER            )
                     ,.ADDR_UART             (ADDR_UART             )
                     ,.SIZE_PIC              (SIZE_PIC              )
                     ,.SIZE_TIMER            (SIZE_TIMER            )
                     ,.SIZE_UART             (SIZE_UART             )
                     ,.NUM_IRQ               (NUM_IRQ               )
                     ,.IRQ_TIMER             (IRQ_TIMER             )
                     ,.IRQ_UART              (IRQ_UART              )
                     ,.IRQ_GPIO              (IRQ_GPIO              )
                     ,.IRQ_I2C               (IRQ_I2C               )
                     ,.IRQ_I2C_A             (IRQ_I2C_A             ))
    u_risc_cache_soc (
         .cpu_resetn  ( cpu_resetn  )
        ,.axi_aresetn ( axi_aresetn )
        ,.axi_aclk    ( axi_aclk    )
        ,.uart_txd    ( uart_txd    )
        ,.uart_rxd    ( uart_rxd    )
        ,.uart_cts_n  ( uart_cts_n  )
        ,.uart_rts_n  ( uart_rts_n  )
        ,.gpio_in     ( gpio_in     )
        ,.gpio_out    ( gpio_out    )
        ,.scl_a       ( scl_a       )
        ,.sda_a       ( sda_a       )
    );
    //--------------------------------------------------------------------------
    // load program and release reset
    tester #(.P_ADDR_ENTRY (`ADDR_ENTRY)
            ,.P_FILE_BIN   (`FILE_BIN  )
            ,.P_BOOT_VECTOR(BOOT_VECTOR))
    u_tester (
          .aclk       ( axi_aclk    )
        , .aresetn    ( axi_aresetn )
        , .cpu_resetn ( cpu_resetn  )
    );
    //--------------------------------------------------------------------------
    tty #(.BAUD  (BAUD_RATE)
         ,.PARITY(0)   // 0:none, 1:odd, 2:even
         ,.STOP  (1)   // 0:no, 1:1-bit, 2:2-bit
         ,.WIDTH (8))  // 8-bit data width
    u_tty (
       .uart_rx(uart_txd)
      ,.uart_tx(uart_rxd)
    );
    //--------------------------------------------------------------------------
    // I2C EEPROM slave model (address 0x57)
    i2c_slave #(.P_I2C_DEV_ADDR_LEN(7)      // 7-bit device address
               ,.P_I2C_DEV_ADDR    (7'h57)  // EEPROM address: 0x57
               ,.P_I2C_REG_ADDR_LEN(8)      // 8-bit register address
               ,.P_I2C_MEM_SIZE    (9'h100)) // 256 bytes memory
    eeprom (
        .SCL(scl_a)
       ,.SDA(sda_a)
    );
    //--------------------------------------------------------------------------
    integer code;
    string  str_val;
    initial begin
        if ($test$plusargs("VCD")) begin
            code = $value$plusargs("VCD=%s", str_val);
            if (code==0) begin
                $display("%m ERROR cannot get vcd.");
                $finish(2);
            end
            if (str_val.atoi()!=0) begin
                $dumpfile("wave.vcd"); //$dumplimit(1000000);
                $dumpvars(0);
            end
        end
    end
endmodule
