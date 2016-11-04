module tb_regfile;

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
		
		w_addr = 2;
		w_data = 63;
		r_or_w = 1;
		
		#100;
		
		r_addr1 = 2;
		r_addr2 = 1;
		r_or_w = 0;
		
		#100;
		
		w_addr = 4;
		w_data = 31;
		r_or_w = 1;
		
		#100;
		
		r_addr1 = 4;
		r_addr2 = 2;
		r_or_w = 0;
		
		#100;
		
		
	end
	
	always begin
		#50;
		clk = ~clk;
	end
endmodule
