////////////////////////////
//                        //
// First Uber Cool Design //
//    Program Counter     //
//                        //
////////////////////////////

module PC (
	input 		 clock,
	input  [6:0] next,
	output logic [6:0] current
);

	// update program counter every clock cycle
	always_ff @(posedge clock) begin
		current = next;
	end

endmodule
