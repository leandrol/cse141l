////////////////////////////
//                        //
// First Uber Cool Design //
//    Instruction ROM     //
//                        //
////////////////////////////

module instruction_ROM #(parameter numInstr = 128) (
	input  [6:0] address,
	output [8:0] instruction
);

	logic [8:0] internal_memory [0: numInstr-1];
	
	initial begin
		$readmemb("instructions.bin", internal_memory);
	end
	
	assign instruction = address < numInstr ? internal_memory[address] : 9'b0;
	
endmodule
