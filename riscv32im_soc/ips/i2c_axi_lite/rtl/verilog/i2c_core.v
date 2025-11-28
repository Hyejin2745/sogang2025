`timescale 1ns/1ps
// 세환님 가장 최근 코드
// Hz_counter 기본값=100은 100MHz 시스템 클럭을 가정 (100MHz/200=500kHz)
// 실제 사용 시 i2c_axi_lite.v를 통해 계산된 값이 전달됨 (다른 클럭 주파수 사용 시 자동 계산)
module I2C #(		parameter 	Hz_counter= 10 // 기본값: 100MHz 시스템용 (500kHz I2C), 실제로는 i2c_axi_lite.v에서 계산된 값 사용

			 ) 

(
	input									clk				,
	input									n_rst			,
	
	input       wire	[31:0]		        data0	        , // for simulation mem[0]
	// input	     	[7:0]				addr			,
	
	input       wire	[31:0]		        data1	        , // for simulation mem[1]
	// input       wire	[31:0]		        input       wire	[31:0]	        , 
	
	output      reg	[31:0]		            data2	        , // for simulation mem[2]
	// input       wire	[31:0]				rdata			,
				
	inout		wire						sda		     	,
	output		wire					    scl			    ,

    // I2C 진행 상태를 외부로 노출 (CSR의 STATUS 비트에서 사용)
    output      wire                        busy           ,
    output      wire                        done           ,
    output      wire    [4:0]               state_debug    // 디버깅용: 현재 state 값

);

/*

/		/		/		/ 		/	[2] read    mem <- eeprom
/		/		/		/ 		/	[1] write   mem -> eeprom
/		/		/		/ 		/	[0] 0: device address  1: word address  2: mem[0][16] == 1 random, mem[0][17] == 1 page O  3: [31] == 1 -> sda == 0
   [3]     [2]     [1]     [0]

*/

	localparam		idle 			= 0	,
					start			= 1 ,
					
											// byte write & page write
					
					w_d_addr 		= 2	,
					w_d_addr_a		= 3 ,
						
					w_w_addr		= 4 ,
					w_w_addr_a		= 5 ,
					w_data			= 6 ,
					w_data_a		= 7 ,
					
											// current address read & sequential read
					
					r_d_addr		= 8 ,
					r_d_addr_a		= 9 ,
						
					r_data			= 10 ,
					r_data_a		= 11 ,
					
											// random read
					
					rr_w_d_addr		= 12 ,
					rr_w_d_addr_a 	= 13 ,
					
					rr_w_w_addr		= 14 ,
					rr_w_w_addr_a	= 15 ,

					rr_start		= 16 ,
					rr_r_d_addr		= 17 ,
					rr_r_d_addr_a	= 18 ,
					
					rr_r_data		= 19 ,
					rr_r_data_a		= 20 ,
					stop			= 21 ;
					
	
	// 이걸 카운터 돌려서 반복할까 state 넣어서 할까 state 넣으면 너무 복잡해지는데
	reg		[31:0]		mem		[2:0]	; // 0: addr & function / 1: write / 2: read 이 부분은 내부 메모리로 바꾸고 axi4 lite에 연결
	
	reg		[4:0]		state			;
	reg		[4:0]		nxt				;
	
	(* mark_debug = "true" *) reg		[6:0]		counter			;	

	(* mark_debug = "true" *) reg   clk_k     		;  // 초기값: 1 (high)
	(* mark_debug = "true" *) wire	counter_clr = (counter == Hz_counter);
	(* mark_debug = "true" *) wire	counter_half = (counter == (Hz_counter/2));
	
	//wire	f_edge_det;
	
	/*
	// 8bit serial read data save -> rdata_8bit
	reg		rdata_0		;
	reg		rdata_1		;
	reg		rdata_2		;
	reg		rdata_3		;
	reg		rdata_4		;
	reg		rdata_5		;
	reg		rdata_6		;
	reg		rdata_7		;
	
	// 32bit read sdata save -> mem[2]
	reg		[7:0]	rdata_8bit_0	;
	reg		[7:0]	rdata_8bit_1	;
	reg		[7:0]	rdata_8bit_2	;
	reg		[7:0]	rdata_8bit_3	;
	*/
	
    reg sda_out;         
    assign sda = sda_out ? 1'bz : 1'b0;
	
    (* mark_debug = "true" *) reg  				    ack_flag		;	
	(* mark_debug = "true" *) reg					page_flag		;
	(* mark_debug = "true" *) reg		[2:0]		counter_page	;

	(* mark_debug = "true" *) reg		[2:0]		counter_data	;
	(* mark_debug = "true" *) reg					data_flag		;
	(* mark_debug = "true" *) reg					state_flag		;

	//ssign scl = ((state == idle) || (state == stop)) ? 1'bz : clk_k;
	assign scl = clk_k; // scl 키자마자 clk처럼 분주함, 펌웨어랑 상관 x
	//assign scl = 1; // 그냥 1로 나옴
	
	always @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            counter <= 0;
            clk_k <= 1;
        end
        else if (state == idle) begin
            counter <= 0;
            clk_k <= 1;
        end// 1이면 SDA를 구동, 0이면 해제
        else if (state == stop) begin
            // clk_k는 1 유지 (SCL high 유지)
            clk_k <= 1;
            counter <= counter + 1;  // stop 상태에서도 counter는 증가시킴
        end
        else if (counter_clr) begin
            clk_k <= ~clk_k;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end
	
	
	always @(posedge clk, negedge n_rst) begin // adress & data 8bit counter
					
		if(!n_rst) begin
			counter_data <= 7;
		end
		else if (state == idle) begin
			counter_data <= 7;
		end
		else begin
			case (scl)
				0: begin
					if (state_flag) begin
						counter_data <= 7;
					end
					else begin
						counter_data <= counter_data;
					end
				end
				
				1: begin
					if ((data_flag) && (counter_clr == 1)) begin
						counter_data <= counter_data - 1 ; 
					end
					else begin
						counter_data <= counter_data;
					end
				end
				
				default: counter_data <= 7;
			endcase
		end
		
	end

	
	
	always @(posedge clk, negedge n_rst) begin // page counter
		
		if (!n_rst) begin
			counter_page <= 0;
		end
		
		else if (state == idle) begin
			counter_page <= 0;
		end
		
		else begin
			case (mem[0][17])
				
				0: begin
					counter_page <= 0;
				end
				
				1: begin
					if (((state == w_data_a || state == r_data_a || state == rr_r_data_a)) && (ack_flag == 1)) begin
						if (scl == 0) begin
							if (counter_half == 1) begin
								counter_page <= counter_page + 1;
							end
						end
					end
				end
				
				default : counter_page <= 0;
				
			endcase
		end
		
	end
	
	
	always @(posedge clk, negedge n_rst) begin // output, state reset
	
		if(!n_rst) begin
			state <= idle;
		end
		else begin
			state <= nxt;
		end
			
	end
	
	
	
	always @(*) begin
		
		if ((state != idle) && (data0 == 0)) begin
			nxt = idle;
			sda_out = 1;  // SDA 해제
		end

		else begin
			case (state) 
			
			idle : begin    
				 
		        data_flag = 0;
				state_flag = 0;
			    ack_flag = 0;
			    page_flag = 0;
		        
		        mem[0] = data0 ;
				//mem[0] = 32'h80000000; // 오실로스코프에 sda만 0으로 내려감, scl은 펄스 뛰지 않음
			    data2 = mem[2];
		        
				if (mem[0][31] == 1) begin
					sda_out = 0;  // START 조건: SDA를 LOW로
					nxt = start;  // START 비트가 설정되면 바로 start 상태로 전환
				end
				else begin
					sda_out = 1;  // SDA 해제 (high-Z)
					nxt = idle;   // START 비트가 없으면 idle 유지
				end
				
				
			end
			
			
			start: begin

				mem[2] = 32'h00000000;
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [7]
						data_flag = 1;
					end		
					if (counter_clr) begin
						if (mem[0][0] == 0) begin	
							nxt = w_d_addr;
						end
						else if (mem[0][0] == 1) begin
							if (mem[0][16] == 0) begin
								nxt = r_d_addr;
							end
							else begin
								nxt = rr_w_d_addr;
							end
						end
					end		
				end
				
			end
		
		
			w_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
					
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = w_d_addr_a;
					end		
				end
			
			end
		
		
			w_d_addr_a: begin
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[0][counter_data + 8]; //word address [7]
							end		
							if (counter_clr) begin
							    data_flag = 1;
								ack_flag = 0;
								nxt = w_w_addr;
							end
						end	
					end
				
			end
		
		
			w_w_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = w_w_addr_a;
					end		
				end
			end
		
		
			w_w_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
				
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [7]
							end		
							if (counter_clr) begin
								nxt = w_data;
							    data_flag = 1;
								ack_flag = 0;
							end
						end	
					end
			end
		
		
			w_data: begin
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
	
					if (counter_half) begin
						sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [6]~[0]
					end
	
					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1; // 이거 누가 ack 주느냐에 따라서 바꿔야 할수도 있다.
						nxt = w_data_a;
					end
	
				end
				
			end
		
		
			w_data_a: begin
				
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
					if (scl == 0) begin
					
					   if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						else begin
							// page 모드가 아닐 때 (mem[0][17] == 0): 첫 바이트 후 stop으로
							if (mem[0][17] == 0) begin
								// 단일 바이트 write: ACK 후 stop으로
								if (counter_clr) begin
									sda_out = 0;
									ack_flag = 0;
									nxt = stop;
								end
							end
							// page 모드일 때 (mem[0][17] == 1)
							else begin
								if (counter_page < 3 ) begin
									if (counter_half) begin
										sda_out = mem[1][counter_data + (counter_page * 8)]; //write data [7 + 8*counterpage]
									end		
									if (counter_clr) begin
										nxt = w_data;
										data_flag = 1;
										ack_flag = 0;
									end
								end
							
								else begin
									if (counter_clr) begin
										nxt = w_data;
										page_flag = 1;
										data_flag = 1;
										ack_flag = 0;
									end			
								end
							end
						end
					end
				end
			
			end
			
		
		
			r_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
		
				if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = r_d_addr_a;
					end			
				end
				
			end
		

			r_d_addr_a: begin
				
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = r_data;
							sda_out = 1;
						    data_flag = 1;
							ack_flag = 0;
					end	
				end
				
			end
		
		
			r_data: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] = sda; //read data [7]~[0]
					end
				end
				
		
				if ((scl == 0) && (state_flag == 1)) begin
					if (counter_half) begin
						
						if (page_flag == 1) begin
							sda_out = 1; // no ack
						end
						else begin
							sda_out = 0; // ack
						end
						
					end
					else if (counter_clr) begin
						state_flag = 0;
						ack_flag = 1;
						nxt = r_data_a;
					end	
				end
				
				
			end
		
		
			r_data_a: begin
				
			
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out = 1;
								end		
								if (counter_clr) begin
									nxt = r_data;
									data_flag = 1;
									ack_flag = 0;
								end
							end
							else begin
								if (counter_clr) begin
									nxt = r_data;
									page_flag = 1;
									data_flag = 1;
									ack_flag = 0;
								end			
							end
						end
						
					end
				end
			end
		
			/////////////////////////////////randomread////////////////////////////////////////////
		
			rr_w_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						if (counter_data == 0) begin
							sda_out = ~mem[0][counter_data]; //device address ~[0]
						end
						else begin
							sda_out = mem[0][counter_data]; //device address [6]~[1]
						end
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_w_d_addr_a;
					end		
				end
				
			end
		
		
			rr_w_d_addr_a: begin
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = mem[0][counter_data + 8]; //word address [7]
							end		
							if (counter_clr) begin
								nxt = rr_w_w_addr;
							    data_flag = 1;
								ack_flag = 0;
							end
						end	
				end
			end
		
		
			rr_w_w_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data + 8]; //word address [6]~[0]
					end

					if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_w_w_addr_a;
					end		
				end
			end
		
		
			rr_w_w_addr_a: begin
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if (ack_flag == 1) begin
						if (scl == 0) begin
							if (counter_half) begin
								sda_out = 1; //start
							end		
							if (counter_clr) begin
								nxt = rr_start;
								ack_flag = 0;
							end
						end	
					end
			end
		
		
			rr_start: begin
				if ((scl == 1) &&(counter_half == 1)) begin
					sda_out = 0;
				end
				
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [7]
						data_flag = 1;
					end	
					if (counter_clr) begin;
						nxt = rr_r_d_addr;
					end
				end
					
			end
		
		
			rr_r_d_addr: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 0) begin
					if (counter_half) begin
						sda_out = mem[0][counter_data]; //device address [6]~[0]
					end
		
				if ((counter_clr == 1) && (state_flag == 1)) begin
						state_flag = 0;
						sda_out = 1;
						nxt = rr_r_d_addr_a;
					end			
				end
			end
		
		
			rr_r_d_addr_a: begin
			
				if (mem[0][17] == 0) begin
					page_flag = 1;
				end
			
				if ((scl == 1) && (sda == 0)) begin
					ack_flag = 1;
				end
				
				if ((ack_flag == 1) && (scl == 0)) begin
					if (counter_clr) begin
							nxt = rr_r_data;
							sda_out = 1;
						    data_flag = 1;
							ack_flag = 0;
					end	
				end
			end
		
		
			rr_r_data: begin
			
				if ((scl == 1) && (data_flag == 1)) begin
					if (counter_clr == 1) begin
						if (counter_data == 0) begin
							data_flag = 0;
							state_flag = 1;
						end
					end
				end
			
				if (scl == 1) begin
					if (counter_half) begin
						mem[2][counter_data + (counter_page * 8)] = sda; //read data [7]~[0]
					end
				end
				
		
				if ((scl == 0) && (state_flag == 1)) begin
					if (counter_half) begin
						
						if (page_flag == 1) begin
							sda_out = 1; // no ack
						end
						else begin
							sda_out = 0; // ack
						end
						
					end
					else if (counter_clr) begin
						state_flag = 0;
						ack_flag = 1;
						nxt = rr_r_data_a;
					end	
				end
			end
		
		
			rr_r_data_a: begin
				if (ack_flag == 1) begin
					if (scl == 0) begin
						
						if (page_flag == 1) begin
					           sda_out = 0;
							if (counter_clr) begin
								ack_flag = 0;
								nxt = stop;
							end
						end
						
						else begin
							if (counter_page < 3 ) begin
								if (counter_half) begin
									sda_out = 1;
								end		
								if (counter_clr) begin
									nxt = rr_r_data;
									data_flag = 1;
									ack_flag = 0;
								end
							end
								
							else begin
								if (counter_clr) begin
									nxt = rr_r_data;
									page_flag = 1;
									data_flag = 1;
									ack_flag = 0;
								end			
							end
						end
						
					end
				end
			end
			
			
		stop: begin
			data2 = mem[2];  // stop에서도 data2 출력
			if ((scl == 1) && (counter_clr == 1)) begin
				nxt = idle;
				sda_out = 1;
				page_flag = 0;
				ack_flag = 0;
				data_flag = 0;
				
			end
			else begin
				nxt = stop;
			end
		end
			
			default : nxt = idle;
			
			endcase
		end  // else (data0 != 0 or state == idle)
		
	end
	
    //--------------------------------------------------------------------------
    // 상태 플래그: idle이 아니면 busy, stop 상태이면 done
    //--------------------------------------------------------------------------
    assign busy = (state != idle);
    assign done = (state == stop);
    assign state_debug = state;  // 디버깅용: 현재 state 값 노출
	
	
endmodule
