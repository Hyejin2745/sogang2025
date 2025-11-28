`timescale 1ns/1ps
//------------------------------------------------------------------------------
//  Copyright (c) 2024 by Ando Ki.
//  All right reserved.
//------------------------------------------------------------------------------
// i2c_csr.v
//------------------------------------------------------------------------------
module i2c_csr
     #(parameter CLK_FREQ =100_000_000
               , VERSION  =32'h2024_0810
               , NAME     ="I2C")
(
      input  wire         reset_n
    , input  wire         clk
    , input  wire  [ 7:0] addr
    , input  wire         wren
    , input  wire         rden
    , input  wire  [31:0] wdata
    , output reg   [31:0] rdata
    , output wire         irq
    , output wire  [31:0] data0
    , output wire  [31:0] data1
    , input  wire  [31:0] data2
    , input  wire         status_busy
    , input  wire         status_done
    , input  wire  [4:0]  status_state_debug  // 디버깅용: 현재 state 값
);
    //--------------------------------------------------------------------------
    localparam CSRA_VERSION = 8'h00
             , CSRA_NAME    = 8'h04
             , CSRA_DATA0   = 8'h08
             , CSRA_DATA1   = 8'h0C
             , CSRA_STATUS  = 8'h10
             , CSRA_DATA2   = 8'h14; // read-only: read buffer
    //---------------------------------------------------
    reg [31:0] csr_data0;
    reg [31:0] csr_data1;
    reg [7:0]  csr_status;
    reg [4:0]  csr_state;  // 디버깅용: state 값 저장
    //---------------------------------------------------
    // csr read
    always @ (posedge clk or negedge reset_n) begin
    if (reset_n==1'b0) begin
        csr_status <= 8'h0;
        csr_state <= 5'h0;
        rdata   <= 32'h0;
    end else begin
        // 상태 비트는 하드웨어(I2C 코어)에서 갱신
        csr_status[0] <= status_busy;
        csr_status[1] <= status_done;
        csr_status[7:2] <= 6'b0;
        csr_state <= status_state_debug;  // 디버깅용: state 값 저장

        if (rden==1'b1) begin
            case (addr)
            CSRA_VERSION: rdata <= VERSION;
            CSRA_NAME   : rdata <= NAME;
            CSRA_DATA0  : rdata <= csr_data0;
            CSRA_DATA1  : rdata <= csr_data1;
            // STATUS: bit[0]=busy, bit[1]=done, bit[7:2]=0, bit[12:8]=state (5비트)
            CSRA_STATUS : rdata <= {19'h0, csr_state, csr_status};
            CSRA_DATA2  : rdata <= data2;
            default      : rdata <= 32'h0;
            endcase
        end
    end
    end
    //---------------------------------------------------
    // csr write
    always @ (posedge clk or negedge reset_n) begin
    if (reset_n==1'b0) begin
        csr_data0 <= 32'h0;
        csr_data1 <= 32'h0;
    end else begin
        if (wren==1'b1) begin
            case (addr)
            CSRA_DATA0: csr_data0 <= wdata;
            CSRA_DATA1: csr_data1 <= wdata;
            default: ;
            endcase
        end
    end
    end
    //---------------------------------------------------
    assign irq = 1'b0;
    assign data0 = csr_data0;
    assign data1 = csr_data1;
    //---------------------------------------------------
endmodule                
//------------------------------------------------------------------------------
// Revision history
//
// 2024.08.10: Started by Ando Ki (andoki@gmail.com)
//------------------------------------------------------------------------------
