//------------------------------------------------------------------------------
// riscv_cache_soc_tb.v
// RISC-V SOC 테스트 벤치
// GPIO/키패드 기능 테스트용
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

module riscv_cache_soc_tb;

    //--------------------------------------------------------------------------
    // 클럭 및 리셋
    //--------------------------------------------------------------------------
    reg         clk_100mhz;
    reg         reset_n;
    
    //--------------------------------------------------------------------------
    // UART 인터페이스
    //--------------------------------------------------------------------------
    wire        uart_txd;
    reg         uart_rxd;
    wire        uart_rts_n;
    reg         uart_cts_n;
    
    //--------------------------------------------------------------------------
    // GPIO 인터페이스
    //--------------------------------------------------------------------------
    reg  [31:0] gpio_in;
    wire [31:0] gpio_out;
    wire [31:0] gpio_dir;
    
    //--------------------------------------------------------------------------
    // 키패드는 GPIO를 통해 처리
    //--------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------
    // AXI 메모리 인터페이스 (더미)
    //--------------------------------------------------------------------------
    wire [5:0]  m_axi_awid;
    wire [31:0] m_axi_awaddr;
    wire [7:0]  m_axi_awlen;
    wire [2:0]  m_axi_awsize;
    wire [1:0]  m_axi_awburst;
    wire        m_axi_awvalid;
    reg         m_axi_awready;
    wire [31:0] m_axi_wdata;
    wire [3:0]  m_axi_wstrb;
    wire        m_axi_wlast;
    wire        m_axi_wvalid;
    reg         m_axi_wready;
    reg  [5:0]  m_axi_bid;
    reg  [1:0]  m_axi_bresp;
    reg         m_axi_bvalid;
    wire        m_axi_bready;
    wire [5:0]  m_axi_arid;
    wire [31:0] m_axi_araddr;
    wire [7:0]  m_axi_arlen;
    wire [2:0]  m_axi_arsize;
    wire [1:0]  m_axi_arburst;
    wire        m_axi_arvalid;
    reg         m_axi_arready;
    reg  [5:0]  m_axi_rid;
    reg  [31:0] m_axi_rdata;
    reg  [1:0]  m_axi_rresp;
    reg         m_axi_rlast;
    reg         m_axi_rvalid;
    wire        m_axi_rready;

    //--------------------------------------------------------------------------
    // DUT 인스턴스
    //--------------------------------------------------------------------------
    riscv_cache_soc_top u_dut (
        .clk_100mhz(clk_100mhz),
        .reset_n(reset_n),
        .uart_txd(uart_txd),
        .uart_rxd(uart_rxd),
        .uart_rts_n(uart_rts_n),
        .uart_cts_n(uart_cts_n),
        .gpio_in(gpio_in),
        .gpio_out(gpio_out),
        .gpio_dir(gpio_dir),
        .m_axi_awid(m_axi_awid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awready(m_axi_awready),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wvalid(m_axi_wvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_bid(m_axi_bid),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_arid(m_axi_arid),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_arready(m_axi_arready),
        .m_axi_rid(m_axi_rid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_rready(m_axi_rready)
    );

    //--------------------------------------------------------------------------
    // 클럭 생성
    //--------------------------------------------------------------------------
    initial begin
        clk_100mhz = 0;
        forever #5 clk_100mhz = ~clk_100mhz; // 100MHz
    end

    //--------------------------------------------------------------------------
    // 리셋 시퀀스
    //--------------------------------------------------------------------------
    initial begin
        reset_n = 0;
        #100;
        reset_n = 1;
        #100;
    end

    //--------------------------------------------------------------------------
    // 초기화
    //--------------------------------------------------------------------------
    initial begin
        uart_rxd = 1;
        uart_cts_n = 0;
        gpio_in = 32'h0000_0000;
        keypad_col = 4'h0;
        m_axi_awready = 1;
        m_axi_wready = 1;
        m_axi_bid = 0;
        m_axi_bresp = 0;
        m_axi_bvalid = 0;
        m_axi_arready = 1;
        m_axi_rid = 0;
        m_axi_rdata = 0;
        m_axi_rresp = 0;
        m_axi_rlast = 1;
        m_axi_rvalid = 0;
    end

    //--------------------------------------------------------------------------
    // GPIO 기반 키패드 시뮬레이션
    //--------------------------------------------------------------------------
    // GPIO[3:0]  : 키패드 행 출력 (소프트웨어에서 제어)
    // GPIO[7:4]  : 키패드 열 입력 (하드웨어에서 읽기)
    // GPIO[8]    : 키패드 인터럽트 (선택사항)

    //--------------------------------------------------------------------------
    // 테스트 시퀀스
    //--------------------------------------------------------------------------
    initial begin
        $display("=== RISC-V SOC GPIO/Keypad Test ===");
        
        // 리셋 대기
        wait(reset_n);
        #1000;
        
        $display("GPIO Direction: 0x%08X", gpio_dir);
        $display("GPIO Output: 0x%08X", gpio_out);
        $display("GPIO Input: 0x%08X", gpio_in);
        
        // GPIO 기반 키패드 테스트
        #10000;
        $display("GPIO Test Complete");
        
        #10000;
        $display("=== Test Complete ===");
        $finish;
    end

    //--------------------------------------------------------------------------
    // 모니터링
    //--------------------------------------------------------------------------
    always @(posedge clk_100mhz) begin
        // GPIO 상태 모니터링
        if (gpio_out[3:0] != 4'hF) begin
            $display("[%t] Keypad Row: 0x%X, Col: 0x%X", 
                     $time, gpio_out[3:0], gpio_in[7:4]);
        end
    end

endmodule

//------------------------------------------------------------------------------
// Revision History
//
// 2025.01.20: Created for GPIO/Keypad testing
//------------------------------------------------------------------------------
