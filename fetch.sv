////////////////////////////
//                        //
// First Uber Cool Design //
//       Fetch Unit       //
//                        //
////////////////////////////

module fetch (
	input clock, overflow, bno,
	input logic [31:0] instruction_memory [8:0],
	output [8:0] instruction
	);
	
	logic [7:0] program_counter = 8'b0;
	wire [7:0] wire_1, wire_2, wire_3;
	
	always_ff @(posedge clock) begin
	
		// read instruction from memory
		instruction = instruction_memory[program_counter];
		
		// choose between next instruction or branch offset		
		case (bno)
			1: wire_1 = ~overflow;
			default: wire_1 = overflow;
		endcase
		
		case(wire_1)
			1: wire_2 = instruction[4:0];
			default: wire_2 = 8'b1;
		endcase
		
		wire_3 = program_counter + wire_2;
		program_counter = wire_3;
				
	end
	
endmodule