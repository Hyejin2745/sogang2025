//----------------------------------------------------------------------------
// I2C AXI-Lite HW/SW co-simulation tester
//   - i2c_tb.v를 참고하여 작성
//   - I2C 슬레이브(EEPROM) 모델 + 상태 추적
//----------------------------------------------------------------------------
`timescale 1ns/1ps

module tester (
      input  wire axil_aresetn
    , input  wire axil_aclk
    , input  wire scl
    , inout  wire sda
);
    //--------------------------------------------------------------------------
    // SDA 드라이브 (open-drain)
    //--------------------------------------------------------------------------
    reg sda_slave_ack;   // ACK용 SDA 드라이브 (0 = drive low, 1 = release)
    reg sda_slave_data;  // READ 데이터용 SDA 드라이브 (0 = drive low, 1 = release)
    
    // I2C core drives: sda_out=0 -> sda=0, sda_out=1 -> sda=Z (from core internal: sda = sda_out ? 1'bz : 1'b0)
    // Slave drives: ACK 또는 READ 데이터
    // When both release, pull-up (tri1) makes it high
    assign sda = (sda_slave_ack == 1'b0 || sda_slave_data == 1'b0) ? 1'b0 : 1'bz;

    //--------------------------------------------------------------------------
    // READ 응답 payload (4바이트, 예: '1','2','3','4')
    //--------------------------------------------------------------------------
    localparam int NUM_READ_BYTES = 4;
    reg [7:0] read_payload [0:NUM_READ_BYTES-1];

    initial begin
        sda_slave_ack = 1'b1;
        sda_slave_data = 1'b1;
        // ASCII: '1','2','3','4' = 0x31, 0x32, 0x33, 0x34
        read_payload[0] = 8'h31;
        read_payload[1] = 8'h32;
        read_payload[2] = 8'h33;
        read_payload[3] = 8'h34;
    end

    //--------------------------------------------------------------------------
    // Slave ACK behavior - provide ACK during ACK phases
    //--------------------------------------------------------------------------
    always @(*) begin
        if (!axil_aresetn) begin
            sda_slave_ack = 1'b1;  // Release during reset
        end else begin
            // Provide ACK during ACK phases (when master expects ACK)
            if (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.w_d_addr_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.w_w_addr_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.w_data_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_d_addr_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_w_d_addr_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_w_w_addr_a ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_d_addr_a) begin
                sda_slave_ack = 1'b0;  // ACK (drive low)
            end else begin
                sda_slave_ack = 1'b1;  // Release
            end
        end
    end
    
    //--------------------------------------------------------------------------
    // READ 바이트 카운터
    //--------------------------------------------------------------------------
    reg [1:0] tb_byte_counter;
    reg [4:0] prev_state;
    reg [2:0] counter_data_q;  // counter_data를 axil_aclk에서 샘플링
    
    // counter_data 샘플링
    always @(posedge axil_aclk) begin
        if (!axil_aresetn) begin
            counter_data_q <= 7;
        end else begin
            if (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_data ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_data) begin
                counter_data_q <= top.u_i2c.u_i2c.counter_data;
            end
        end
    end
    
    // 바이트 카운터 관리
    always @(posedge axil_aclk) begin
        if (!axil_aresetn) begin
            tb_byte_counter <= 0;
            prev_state <= 0;
        end else begin
            // READ 트랜잭션 시작 시 리셋
            if ((top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_data   && prev_state == top.u_i2c.u_i2c.r_d_addr_a) ||
                (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_data && prev_state == top.u_i2c.u_i2c.rr_r_d_addr_a)) begin
                tb_byte_counter <= 0;
            end
            // r_data_a/rr_r_data_a → r_data/rr_r_data로 다시 돌아올 때 = 한 바이트 완료
            else if ((top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_data   && prev_state == top.u_i2c.u_i2c.r_data_a) ||
                     (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_data && prev_state == top.u_i2c.u_i2c.rr_r_data_a)) begin
                if (tb_byte_counter < NUM_READ_BYTES-1)
                    tb_byte_counter <= tb_byte_counter + 1;
            end
            
            prev_state <= top.u_i2c.u_i2c.state;
        end
    end
    
    //--------------------------------------------------------------------------
    // READ 데이터 비트 드라이브: SCL falling edge에서 다음 비트 준비
    // I2C 코어는 SCL high의 중간(counter_half)에서 SDA를 샘플링
    // counter_data는 SCL high의 끝에서 감소하므로, falling edge에서는 이미 감소한 값
    // 첫 번째 falling edge: counter_data=7 → 비트 7 준비 (다음 SCL high에서 샘플링될 비트)
    // 두 번째 falling edge: counter_data=6 → 비트 6 준비
    //--------------------------------------------------------------------------
    always @(negedge scl or negedge axil_aresetn) begin
        if (!axil_aresetn) begin
            sda_slave_data <= 1'b1;
        end else begin
            if (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_data ||
                top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_data) begin
                integer byte_idx = tb_byte_counter;
                // counter_data는 직접 사용 (falling edge 시점의 값)
                // 첫 번째 falling edge: counter_data=7 → 비트 7
                // 두 번째 falling edge: counter_data=6 → 비트 6
                integer bit_pos = top.u_i2c.u_i2c.counter_data;
                // read_payload 비트가 0이면 SDA low, 1이면 SDA high(Z)
                sda_slave_data <= (read_payload[byte_idx][bit_pos] == 1'b0) ? 1'b0 : 1'b1;
            end
            else if (top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.r_data_a ||
                     top.u_i2c.u_i2c.state == top.u_i2c.u_i2c.rr_r_data_a) begin
                // 마스터가 ACK/NACK 내도록 SDA 해제
                sda_slave_data <= 1'b1;
            end
            else begin
                sda_slave_data <= 1'b1;
            end
        end
    end

endmodule

//----------------------------------------------------------------------------
// Revision history
// 2025.11.xx: Created as tester module for i2c_axi_lite cosim.
//             Rewritten based on i2c_tb.v.
//----------------------------------------------------------------------------
