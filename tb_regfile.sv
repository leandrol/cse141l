`timescale 1ns/1ps
module tb_regfile();

	bit clk;
	logic [2:0] r_addr1, r_addr2, w_addr;
	logic [7:0] w_data;
	bit r_or_w;
	
	wire [7:0] data1, data2;
	
	regfile uut (
		.clk(clk),
		.r_addr1(r_addr1),
		.r_addr2(r_addr2),
		.w_addr(w_addr),
		.w_data(w_data),
		.r_or_w(r_or_w),
		.data1(data1),
		.data2(data2)
		);
	
	initial begin
		clk = 0;
		#100;
		
		// Write 63 to address 2
		// Should result in register 2 being 8'b00111111
		w_addr = 2;
		w_data = 63;
		r_or_w = 1;
		
		#100;
		
		// Read address 1 and 2
		// Data 1 should be 63 and Data 2 should be 0
		r_addr1 = 2;
		r_addr2 = 1;
		r_or_w = 0;
		
		#100;
		
		// Write 31 to address 4
		// Should result in register 4 being 8'b00011111
		w_addr = 4;
		w_data = 31;
		r_or_w = 1;
		
		#100;
		
		// Read registers 4 and 2
		// Data 1 should be 31 and Data 2 should be 63
		r_addr1 = 4;
		r_addr2 = 2;
		r_or_w = 0;
		
		#100;
		// Done testing reading and writing to register file
		// Also tested being able to either read or write, not at the same time
		
		
	end
	
	always begin
		#50;
		clk = ~clk;
	end
endmodule
