//////////////////////////////////////////////////////////////////////////////////
// Engineer: Nainika Saha
// Design Name: iic_controller_tb
// Module Name: iic_controller_tb
// Description: Tests I2C
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module iic_controller_tb;
    reg clk;
    reg n_rst;
    reg [31:0] data0;
    reg [31:0] data1;
    wire [31:0] data2;  // Changed to wire (output from I2C module)
    wire scl;
    wire busy;
    wire done;
    
    reg sda_slave_ack;   // ACK용 SDA 드라이브 (0 = drive low, 1 = release)
    reg sda_slave_data;  // READ 데이터용 SDA 드라이브 (0 = drive low, 1 = release)
    
    tri1 sda;  // inout with pull-up - I2C core and slave both drive this
    
    // I2C core drives: sda_out=0 -> sda=0, sda_out=1 -> sda=Z (from core internal: sda = sda_out ? 1'bz : 1'b0)
    // Slave drives: ACK 또는 READ 데이터
    // When both release, pull-up (tri1) makes it high
    assign sda = (sda_slave_ack == 1'b0 || sda_slave_data == 1'b0) ? 1'b0 : 1'bz;
    
    // READ 응답 payload (4바이트)
    localparam int NUM_READ_BYTES = 4;
    reg [7:0] read_payload [0:NUM_READ_BYTES-1];
    
    initial begin
        // ASCII: '1','2','3','4' = 0x31, 0x32, 0x33, 0x34
        read_payload[0] = 8'h31;
        read_payload[1] = 8'h32;
        read_payload[2] = 8'h33;
        read_payload[3] = 8'h34;
    end

    // Instantiate the IIC controller
    I2C UI2C_0 (

		.clk		(clk)			,
		.n_rst		(n_rst)			,
		
		.data0	    (data0) 		,
		.data1	    (data1)		    ,
		.data2	    (data2)		    ,
		
		.sda		(sda)	 	,  // inout - I2C core reads and writes to this
		.scl		(scl)			,
		.busy		(busy)			,
		.done		(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

	/*
    // Slave behavior for acknowledgment
    initial begin
        sda_slave = 1'bz; // Default to released
        wait(uut.state == uut.ACK_WAIT); // Wait for ACK phase
        @(negedge scl); // Wait for SCL low
        sda_slave = 1'b0; // Pull SDA low (ACK)
        @(posedge scl); // Release SDA after SCL high
        sda_slave = 1'bz;
    end
	*/
	
	
	/*

/		/		/		/ 		/	[2] read    mem <- eeprom
/		/		/		/ 		/	[1] write   mem -> eeprom
/		/		/		/ 		/	[0] 0: device address  1: word address  2: mem[0][16] == 1 random, mem[0][17] == 1 page O  3: [31] == 1 -> sda == 0
   [3]     [2]     [1]     [0]

*/
	
	
    // Slave ACK behavior - provide ACK during ACK phases
    always @(*) begin
        if (!n_rst) begin
            sda_slave_ack = 1'b1;  // Release during reset
        end else begin
            // Provide ACK during ACK phases (when master expects ACK)
            if (UI2C_0.state == UI2C_0.w_d_addr_a ||
                UI2C_0.state == UI2C_0.w_w_addr_a ||
                UI2C_0.state == UI2C_0.w_data_a ||
                UI2C_0.state == UI2C_0.r_d_addr_a ||
                UI2C_0.state == UI2C_0.rr_w_d_addr_a ||
                UI2C_0.state == UI2C_0.rr_w_w_addr_a ||
                UI2C_0.state == UI2C_0.rr_r_d_addr_a) begin
                sda_slave_ack = 1'b0;  // ACK (drive low)
            end else begin
                sda_slave_ack = 1'b1;  // Release
            end
        end
    end
    
    // READ 바이트 카운터
    reg [1:0] tb_byte_counter;
    reg [4:0] prev_state;
    reg [2:0] counter_data_q;  // counter_data를 clk에서 샘플링
    
    // counter_data 샘플링
    always @(posedge clk) begin
        if (!n_rst) begin
            counter_data_q <= 7;
        end else begin
            if (UI2C_0.state == UI2C_0.r_data ||
                UI2C_0.state == UI2C_0.rr_r_data) begin
                counter_data_q <= UI2C_0.counter_data;
            end
        end
    end
    
    // 바이트 카운터 관리
    always @(posedge clk) begin
        if (!n_rst) begin
            tb_byte_counter <= 0;
            prev_state <= 0;
        end else begin
            // READ 트랜잭션 시작 시 리셋
            if ((UI2C_0.state == UI2C_0.r_data   && prev_state == UI2C_0.r_d_addr_a) ||
                (UI2C_0.state == UI2C_0.rr_r_data && prev_state == UI2C_0.rr_r_d_addr_a)) begin
                tb_byte_counter <= 0;
            end
            // r_data_a/rr_r_data_a → r_data/rr_r_data로 다시 돌아올 때 = 한 바이트 완료
            else if ((UI2C_0.state == UI2C_0.r_data   && prev_state == UI2C_0.r_data_a) ||
                     (UI2C_0.state == UI2C_0.rr_r_data && prev_state == UI2C_0.rr_r_data_a)) begin
                if (tb_byte_counter < NUM_READ_BYTES-1)
                    tb_byte_counter <= tb_byte_counter + 1;
            end
            
            prev_state <= UI2C_0.state;
        end
    end
    
    // READ 데이터 비트 드라이브: SCL falling edge에서 다음 비트 준비
    // I2C 코어는 SCL high의 중간(counter_half)에서 SDA를 샘플링
    // counter_data는 SCL high의 끝에서 감소하므로, falling edge에서는 이미 감소한 값
    // 첫 번째 falling edge: counter_data=7 → 비트 7 준비 (다음 SCL high에서 샘플링될 비트)
    // 두 번째 falling edge: counter_data=6 → 비트 6 준비
    always @(negedge scl or negedge n_rst) begin
        if (!n_rst) begin
            sda_slave_data <= 1'b1;
        end else begin
            if (UI2C_0.state == UI2C_0.r_data ||
                UI2C_0.state == UI2C_0.rr_r_data) begin
                integer byte_idx = tb_byte_counter;
                // counter_data_q는 이미 감소한 값이므로 그대로 사용
                // 첫 번째 falling edge: counter_data_q=7 → 비트 7
                // 두 번째 falling edge: counter_data_q=6 → 비트 6
                integer bit_pos = UI2C_0.counter_data;  // 직접 사용
                // read_payload 비트가 0이면 SDA low, 1이면 SDA high(Z)
                sda_slave_data <= (read_payload[byte_idx][bit_pos] == 1'b0) ? 1'b0 : 1'b1;
            end
            else if (UI2C_0.state == UI2C_0.r_data_a ||
                     UI2C_0.state == UI2C_0.rr_r_data_a) begin
                // 마스터가 ACK/NACK 내도록 SDA 해제
                sda_slave_data <= 1'b1;
            end
            else begin
                sda_slave_data <= 1'b1;
            end
        end
    end

    // Test sequence
    initial begin
        // Initialize
        sda_slave_ack = 1'b1;
        sda_slave_data = 1'b1;
        data0 = 32'h0000_0000;
        data1 = 32'h0000_0000;
        n_rst = 1'b0;
        
        // Release reset after some time
        #100;
        n_rst = 1'b1;
        
        // Wait for reset to settle
        #50;
        
        // Set data1
        data1 = 32'h34_33_32_31; // ASCII: 1234
        
        // Wait a bit
        #50;
        
        // Write transaction: device=0x57 (0xAE>>1), word=0x72, page=1
        // data0 format: [31]=start, [17]=page, [16]=random, [15:8]=word_addr, [7:0]=dev_addr
        // 0xAE = 1010_1110 (LSB=0 for write)
        data0 = 32'h80_02_72_AE; // start=1, page=1, random=0, word=0x72, dev=0x57(write)
        
        // Wait for write transaction to complete (with timeout)
        fork
            wait(done == 1'b1);
            #100000;  // Timeout after 100us
        join_any
        disable fork;
        
        #100;
        
        // Clear start bit
        data0 = 32'h0000_0000;
        #500;
        
        // Read transaction: device=0x57 (0xAF>>1), word=0x72, page=1
        // 0xAF = 1010_1111 (LSB=1 for read)
        data0 = 32'h80_02_72_AF; // start=1, page=1, random=0, word=0x72, dev=0x57(read)
        
        // Wait for read transaction to complete (with timeout)
        fork
            wait(done == 1'b1);
            #100000;  // Timeout after 100us
        join_any
        disable fork;
        
        #100;
        
        // Clear start bit
        data0 = 32'h0000_0000;
        
        // Wait and finish
        #1000;
        $finish;
    end
endmodule
