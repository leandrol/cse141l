module fetch_tb;
	
	// inputs
	bit 			start;
	logic [6:0] start_address;
	bit 			branch;
	bit 			taken;
	logic [4:0] offset;
	bit 			clock;
	
	// output
	wire [8:0] instruction;
	
	// instantiate unit under test
	fetch uut (
		start,
		start_address,
		branch,
		taken,
		offset,
		clock,
		instruction
	);
	
	initial begin
		#100ns;
		start = 1;
		start_address = 34;
		#10ns start = 0;
		#50ns branch = 1;
		taken = 1;
		offset = -5;
		#10ns branch = 0;
		#50ns branch = 1;
		taken = 0;
		#10ns branch = 0;
	end
	
	always begin
		#5ns clock = 1;
		#5ns clock = 0;
	end
	
endmodule
