`timescale 1ns/1ps

module Instruction_ROM_tb;

	parameter numInstr = 66;

	// input
	logic [6:0] address;
	
	// output
	wire [8:0] instruction;
	
	// instantiate UUT
	Instruction_ROM #(numInstr) uut (
		.address(address),
		.instruction(instruction)
	);
	
	bit clock;
	
	initial begin
		#100ns;
		
		for(address = 0; address < numInstr; address = address + 1 )
			#50ns;
		
	end
	
	always begin
		#50ns clock = ~clock;
	end
	
endmodule
