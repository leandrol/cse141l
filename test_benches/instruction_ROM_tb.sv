module instruction_ROM_tb;

	// input
	parameter numInstr = 66;
	logic [6:0] address;
	
	// output
	wire [8:0] instruction;
	
	// instantiate UUT
	instruction_ROM #(numInstr) uut (
		address,
		instruction
	);
	
	// clock
	logic clock;
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
	// tests
	initial begin
		#100ns;
		for(address = 0; address < numInstr; address = address + 1 )
			#20ns;
	end

endmodule
