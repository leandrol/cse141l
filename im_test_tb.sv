module im_test_tb;

	// input
	logic [4:0] address;
	
	// output
	wire [8:0] instruction;
	
	// instantiate UUT
	im_test uut (
		.address,
		.instruction
	);
	
	bit clock;
	
	initial begin
		#100ns;
		#25ns address = 4;
		#25ns address = 17;
		#25ns address = 12;
		#25ns address = 28;
	end
	
	always begin
		#50ns clock = 1;
		#50ns clock =0;
	end
	
endmodule
