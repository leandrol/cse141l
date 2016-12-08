module PC_tb;

	// inputs
	logic 		clock;
	logic [6:0] next;
	
	// output
	logic [6:0] current;
	
	// instantiate unit under test
	PC uut (
		clock,
		next,
		current
	);
	
	// clock
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
	// tests
	initial begin
		#100ns next = 0;
		#20ns  next = 1;
		#20ns  next = 2;
		#20ns  next = 3;
		#20ns  next = 10;
	end

endmodule
