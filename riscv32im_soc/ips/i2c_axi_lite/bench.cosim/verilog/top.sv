//----------------------------------------------------------------------------
// I2C AXI-Lite HW/SW co-simulation top
//   참고: uart_axi_lite/bench.cosim/verilog/top.sv 와 유사한 구조
//   SW <-> AXI-Lite BFM(cosim_bfm_axi_lite) <-> i2c_axi_lite
//----------------------------------------------------------------------------
`timescale 1ns/1ps

`ifndef __ICARUS__
`define DELAY_LINE #(0.1)
`else
`define DELAY_LINE
`endif

//----------------------------------------------------------------------------
module top;
    //--------------------------------------------------------------------------
    // Oscillators
    localparam real CLOCK_FREQ =10_000_000.0;
    localparam real CLOCK_HALF =(1_000_000_000.0/CLOCK_FREQ/2.0);
    //--------------------------------------------------------------------------
    reg  axil_aclk    = 1'b0; always #(CLOCK_HALF) axil_aclk <= ~axil_aclk;
    reg  axil_aresetn = 1'b0; initial begin #111; axil_aresetn = 1'b1; end
    //------------------------------------------------------------------------
    wire [31:0] axi_lite_awaddr ;
    wire        axi_lite_awvalid;
    wire        axi_lite_awready;
    wire [31:0] axi_lite_wdata  ;
    wire        axi_lite_wvalid ;
    wire        axi_lite_wready ;
    wire [ 1:0] axi_lite_bresp  ;
    wire        axi_lite_bvalid ;
    wire        axi_lite_bready ;
    wire [31:0] axi_lite_araddr ;
    wire        axi_lite_arvalid;
    wire        axi_lite_arready;
    wire [31:0] axi_lite_rdata  ;
    wire [ 1:0] axi_lite_rresp  ;
    wire        axi_lite_rvalid ;
    wire        axi_lite_rready ;
    //--------------------------------------------------------------------------
    cosim_bfm_axi_lite
    u_bfm_axi_lite (
          .aresetn            ( axil_aresetn     )
        , .aclk               ( axil_aclk        )
        , .m_axi_lite_awaddr  ( axi_lite_awaddr  )
        , .m_axi_lite_awvalid ( axi_lite_awvalid )
        , .m_axi_lite_awready ( axi_lite_awready )
        , .m_axi_lite_wdata   ( axi_lite_wdata   )
        , .m_axi_lite_wvalid  ( axi_lite_wvalid  )
        , .m_axi_lite_wready  ( axi_lite_wready  )
        , .m_axi_lite_bresp   ( axi_lite_bresp   )
        , .m_axi_lite_bvalid  ( axi_lite_bvalid  )
        , .m_axi_lite_bready  ( axi_lite_bready  )
        , .m_axi_lite_araddr  ( axi_lite_araddr  )
        , .m_axi_lite_arvalid ( axi_lite_arvalid )
        , .m_axi_lite_arready ( axi_lite_arready )
        , .m_axi_lite_rdata   ( axi_lite_rdata   )
        , .m_axi_lite_rresp   ( axi_lite_rresp   )
        , .m_axi_lite_rvalid  ( axi_lite_rvalid  )
        , .m_axi_lite_rready  ( axi_lite_rready  )
    );
    //--------------------------------------------------------------------------
    // I2C bus lines (open-drain SDA + pull-up, push-pull SCL)
    tri1 sda;
    wire `DELAY_LINE scl;

    // I2C AXI-Lite peripheral
    // Hz_counter = 10 (하드코딩)에 맞춤: scl = aclk / (2 * 10) = 10MHz / 20 = 500kHz
    i2c_axi_lite #(
          .CLK_FREQ(10_000_000)      // 실제 시스템 클록 주파수 (10MHz)
        , .I2C_CLK_FREQ(500_000)    // I2C 클록 주파수 (500kHz, Hz_counter=10에 맞춤)
    )
    u_i2c (
          .aresetn       ( axil_aresetn     )
        , .aclk          ( axil_aclk        )
        , .s_axi_awaddr  ( axi_lite_awaddr  )
        , .s_axi_awvalid ( axi_lite_awvalid )
        , .s_axi_awready ( axi_lite_awready )
        , .s_axi_wdata   ( axi_lite_wdata   )
        , .s_axi_wvalid  ( axi_lite_wvalid  )
        , .s_axi_wready  ( axi_lite_wready  )
        , .s_axi_bresp   ( axi_lite_bresp   )
        , .s_axi_bvalid  ( axi_lite_bvalid  )
        , .s_axi_bready  ( axi_lite_bready  )
        , .s_axi_araddr  ( axi_lite_araddr  )
        , .s_axi_arvalid ( axi_lite_arvalid )
        , .s_axi_arready ( axi_lite_arready )
        , .s_axi_rdata   ( axi_lite_rdata   )
        , .s_axi_rresp   ( axi_lite_rresp   )
        , .s_axi_rvalid  ( axi_lite_rvalid  )
        , .s_axi_rready  ( axi_lite_rready  )
        , .scl           ( scl              )
        , .sda           ( sda              )
    );

    //--------------------------------------------------------------------------
    // Simple I2C slave model (open-drain) 참고: sim/i2c_tb.v
    //--------------------------------------------------------------------------
    tester u_tester (
          .axil_aresetn ( axil_aresetn )
        , .axil_aclk    ( axil_aclk    )
        , .scl          ( scl          )
        , .sda          ( sda          )
    );

    //--------------------------------------------------------------------------
    initial begin
       $display("I2C cosim VCD dump enable.");
       $dumpfile("wave.vcd");
       $dumpvars(0);
    end
    //------------------------------------------------------------------------
endmodule

//----------------------------------------------------------------------------
// Revision history
// 2025.11.xx: Created for i2c_axi_lite cosim.
//----------------------------------------------------------------------------


