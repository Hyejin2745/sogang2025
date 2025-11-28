//------------------------------------------------------------------------------
// riscv_cache_soc_top.v
// RISC-V SOC 상위 모듈 (테스트용)
// GPIO/키패드 포트를 포함한 완전한 인터페이스
//------------------------------------------------------------------------------

module riscv_cache_soc_top
(
    // 클럭 및 리셋
    input  wire        clk_100mhz,
    input  wire        reset_n,
    
    // UART 인터페이스
    output wire        uart_txd,
    input  wire        uart_rxd,
    output wire        uart_rts_n,
    input  wire        uart_cts_n,
    
    // GPIO 인터페이스
    input  wire [7:0] gpio_in,
    output wire [7:0] gpio_out,
    
    // I2C 인터페이스
    (* mark_debug = "true" *) inout  wire       sda,   // I2C data line (for u_i2c)
    (* mark_debug = "true" *) output wire       scl,   // I2C clock line (for u_i2c)
    (* mark_debug = "true" *) inout  wire       sda_a, // I2C data line (for u_i2c_a - new I2C)
    (* mark_debug = "true" *) inout  wire       scl_a,  // I2C clock line (for u_i2c_a - new I2C)
    
    // 키패드는 GPIO를 통해 처리
    
    // AXI 인터페이스 (외부 메모리용)
    output wire [5:0]  m_axi_awid,
    output wire [31:0] m_axi_awaddr,
    output wire [7:0]  m_axi_awlen,
    output wire [2:0]  m_axi_awsize,
    output wire [1:0]  m_axi_awburst,
    output wire        m_axi_awvalid,
    input  wire        m_axi_awready,
    output wire [31:0] m_axi_wdata,
    output wire [3:0]  m_axi_wstrb,
    output wire        m_axi_wlast,
    output wire        m_axi_wvalid,
    input  wire        m_axi_wready,
    input  wire [5:0]  m_axi_bid,
    input  wire [1:0]  m_axi_bresp,
    input  wire        m_axi_bvalid,
    output wire        m_axi_bready,
    output wire [5:0]  m_axi_arid,
    output wire [31:0] m_axi_araddr,
    output wire [7:0]  m_axi_arlen,
    output wire [2:0]  m_axi_arsize,
    output wire [1:0]  m_axi_arburst,
    output wire        m_axi_arvalid,
    input  wire        m_axi_arready,
    input  wire [5:0]  m_axi_rid,
    input  wire [31:0] m_axi_rdata,
    input  wire [1:0]  m_axi_rresp,
    input  wire        m_axi_rlast,
    input  wire        m_axi_rvalid,
    output wire        m_axi_rready
);

    //--------------------------------------------------------------------------
    // 내부 신호
    //--------------------------------------------------------------------------
    wire        axi_aclk = clk_100mhz;
    wire        axi_aresetn = reset_n;
    wire        cpu_resetn = reset_n;
    
    // AXI ConfMC 인터페이스 (내부에서 사용하지 않음)
    wire [3:0]  s_axi_confmc_awid = 4'h0;
    wire [31:0] s_axi_confmc_awaddr = 32'h0;
    wire [7:0]  s_axi_confmc_awlen = 8'h0;
    wire [2:0]  s_axi_confmc_awsize = 3'h0;
    wire [1:0]  s_axi_confmc_awburst = 2'h0;
    wire        s_axi_confmc_awvalid = 1'b0;
    wire        s_axi_confmc_awready;
    wire [31:0] s_axi_confmc_wdata = 32'h0;
    wire [3:0]  s_axi_confmc_wstrb = 4'h0;
    wire        s_axi_confmc_wlast = 1'b0;
    wire        s_axi_confmc_wvalid = 1'b0;
    wire        s_axi_confmc_wready;
    wire [3:0]  s_axi_confmc_bid;
    wire [1:0]  s_axi_confmc_bresp;
    wire        s_axi_confmc_bvalid;
    wire        s_axi_confmc_bready = 1'b0;
    wire [3:0]  s_axi_confmc_arid = 4'h0;
    wire [31:0] s_axi_confmc_araddr = 32'h0;
    wire [7:0]  s_axi_confmc_arlen = 8'h0;
    wire [2:0]  s_axi_confmc_awsize = 3'h0;
    wire [1:0]  s_axi_confmc_arburst = 2'h0;
    wire        s_axi_confmc_arvalid = 1'b0;
    wire        s_axi_confmc_arready;
    wire [3:0]  s_axi_confmc_rid;
    wire [31:0] s_axi_confmc_rdata;
    wire [1:0]  s_axi_confmc_rresp;
    wire        s_axi_confmc_rlast;
    wire        s_axi_confmc_rvalid;
    wire        s_axi_confmc_rready = 1'b0;

    //--------------------------------------------------------------------------
    // RISC-V SOC 인스턴스
    //--------------------------------------------------------------------------
    riscv_cache_soc #(
        .BOOT_VECTOR(32'h0000_0000),
        .CORE_ID(0),
        .SUPPORT_SUPER(0),
        .SUPPORT_MMU(0),
        .SUPPORT_MULDIV(1),
        .SUPPORT_LOAD_BYPASS(1),
        .SUPPORT_MUL_BYPASS(1),
        .SUPPORT_REGFILE_XILINX(0),
        .EXTRA_DECODE_STAGE(0),
        .MEM_CACHE_ADDR_MIN(32'h0000_0000),
        .MEM_CACHE_ADDR_MAX(32'h0FFF_FFFF),
        .MEM_ONCHIP_ADDR(32'h0000_0000),
        .MEM_ONCHIP_SIZE(128*1024),
        .ADDR_PERIPHERAL(32'h9000_0000),
        .SIZE_PERIPHERAL(32'h1000_0000),
        .BAUD_RATE(115200),
        .ACLK_FREQ(100_000_000),
        .ADDR_PIC(32'h9000_0000),
        .ADDR_TIMER(32'h9001_0000),
        .ADDR_UART(32'h9002_0000),
        .ADDR_GPIO(32'h9003_0000),
        .ADDR_I2C(32'h9004_0000),
        .SIZE_PIC(32'h0000_1000),
        .SIZE_TIMER(32'h0000_1000),
        .SIZE_UART(32'h0000_1000),
        .SIZE_GPIO(32'h0000_1000),
        .SIZE_I2C(32'h0000_1000),
        .NUM_IRQ(4),
        .IRQ_TIMER(0),
        .IRQ_UART(1),
        .IRQ_GPIO(2),
        .IRQ_I2C(3),
        .AXI_WIDTH_CID(2),
        .AXI_WIDTH_ID(4),
        .AXI_WIDTH_SID(6),
        .AXI_WIDTH_ADDR(32),
        .AXI_WIDTH_DATA(32),
        .AXI_WIDTH_STRB(4)
    ) u_riscv_cache_soc (
        // UART 인터페이스
        .uart_txd(uart_txd),
        .uart_rxd(uart_rxd),
        .uart_rts_n(uart_rts_n),
        .uart_cts_n(uart_cts_n),
        
        // GPIO 인터페이스
        .gpio_in(gpio_in),
        .gpio_out(gpio_out),
        
        // I2C 인터페이스
        .sda(sda),
        .scl(scl),
        .sda_a(sda_a),
        .scl_a(scl_a),
        
        // 클럭 및 리셋
        .cpu_resetn(cpu_resetn),
        .axi_aresetn(axi_aresetn),
        .axi_aclk(axi_aclk),
        
        // AXI ConfMC 인터페이스
        .s_axi_confmc_awid(s_axi_confmc_awid),
        .s_axi_confmc_awaddr(s_axi_confmc_awaddr),
        .s_axi_confmc_awlen(s_axi_confmc_awlen),
        .s_axi_confmc_awsize(s_axi_confmc_awsize),
        .s_axi_confmc_awburst(s_axi_confmc_awburst),
        .s_axi_confmc_awvalid(s_axi_confmc_awvalid),
        .s_axi_confmc_awready(s_axi_confmc_awready),
        .s_axi_confmc_wdata(s_axi_confmc_wdata),
        .s_axi_confmc_wstrb(s_axi_confmc_wstrb),
        .s_axi_confmc_wlast(s_axi_confmc_wlast),
        .s_axi_confmc_wvalid(s_axi_confmc_wvalid),
        .s_axi_confmc_wready(s_axi_confmc_wready),
        .s_axi_confmc_bid(s_axi_confmc_bid),
        .s_axi_confmc_bresp(s_axi_confmc_bresp),
        .s_axi_confmc_bvalid(s_axi_confmc_bvalid),
        .s_axi_confmc_bready(s_axi_confmc_bready),
        .s_axi_confmc_arid(s_axi_confmc_arid),
        .s_axi_confmc_araddr(s_axi_confmc_araddr),
        .s_axi_confmc_arlen(s_axi_confmc_arlen),
        .s_axi_confmc_arsize(s_axi_confmc_arsize),
        .s_axi_confmc_arburst(s_axi_confmc_arburst),
        .s_axi_confmc_arvalid(s_axi_confmc_arvalid),
        .s_axi_confmc_arready(s_axi_confmc_arready),
        .s_axi_confmc_rid(s_axi_confmc_rid),
        .s_axi_confmc_rdata(s_axi_confmc_rdata),
        .s_axi_confmc_rresp(s_axi_confmc_rresp),
        .s_axi_confmc_rlast(s_axi_confmc_rlast),
        .s_axi_confmc_rvalid(s_axi_confmc_rvalid),
        .s_axi_confmc_rready(s_axi_confmc_rready),
        
        // AXI 메모리 인터페이스
        .m_axi_mem_awid(m_axi_awid),
        .m_axi_mem_awaddr(m_axi_awaddr),
        .m_axi_mem_awlen(m_axi_awlen),
        .m_axi_mem_awsize(m_axi_awsize),
        .m_axi_mem_awburst(m_axi_awburst),
        .m_axi_mem_awvalid(m_axi_awvalid),
        .m_axi_mem_awready(m_axi_awready),
        .m_axi_mem_wdata(m_axi_wdata),
        .m_axi_mem_wstrb(m_axi_wstrb),
        .m_axi_mem_wlast(m_axi_wlast),
        .m_axi_mem_wvalid(m_axi_wvalid),
        .m_axi_mem_wready(m_axi_wready),
        .m_axi_mem_bid(m_axi_bid),
        .m_axi_mem_bresp(m_axi_bresp),
        .m_axi_mem_bvalid(m_axi_bvalid),
        .m_axi_mem_bready(m_axi_bready),
        .m_axi_mem_arid(m_axi_arid),
        .m_axi_mem_araddr(m_axi_araddr),
        .m_axi_mem_arlen(m_axi_arlen),
        .m_axi_mem_arsize(m_axi_arsize),
        .m_axi_mem_arburst(m_axi_arburst),
        .m_axi_mem_arvalid(m_axi_arvalid),
        .m_axi_mem_arready(m_axi_arready),
        .m_axi_mem_rid(m_axi_rid),
        .m_axi_mem_rdata(m_axi_rdata),
        .m_axi_mem_rresp(m_axi_rresp),
        .m_axi_mem_rlast(m_axi_rlast),
        .m_axi_mem_rvalid(m_axi_rvalid),
        .m_axi_mem_rready(m_axi_rready)
    );

endmodule

//------------------------------------------------------------------------------
// Revision History
//
// 2025.01.20: Created for GPIO/Keypad testing
//------------------------------------------------------------------------------
