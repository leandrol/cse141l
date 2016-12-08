module fetch_tb;

	// inputs
	logic start;
	logic [6:0] start_address;
	logic branch;
	logic taken;
	logic signed [4:0] offset;
	logic halt;
	logic [6:0] current;
	
	// output
	logic [6:0] next;
	
	// program counter
	logic clock;
	PC program_counter (
		clock,
		next,
		current
	);
	
	// instantiate unit under test
	fetch uut (
		start,
		start_address,
		branch,
		taken,
		offset,
		halt,
		current,
		next
	);
	
	// clock
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
	// tests
	initial begin
	
		#100ns;
		
		// initialize
		start = 1;
		start_address = 10;
		branch = 0;
		taken = 0;
		offset = 5'bz;
		halt = 0;
		#20ns start = 0;
		
		// increment
		#20ns;
		
		// branch
		#20ns
		branch = 1;
		taken = 1;
		offset = -5;
		#20ns;
		branch = 0;
		taken = 0;
		offset = 5'bz;
		
		// halt 
		#20ns halt = 1;
	
	end

endmodule
