////////////////////////////
//                        //
// First Uber Cool Design //
//       Fetch Unit       //
//                        //
////////////////////////////

module fetch (
	input               start,
	input         [6:0] start_address,
	input               branch,
	input               taken,
	input  signed [4:0] offset,			// target
	input               clock,
	input					  halt,
	output logic  [6:0] instruction
);
	
	logic        [6:0] pc_to_im;			// program counter to instruction memory
	logic signed [7:0] signed_address;	// for branch calculations
	logic        [6:0] next;				// next instruction address
	
	logic [6:0] program_counter;
	
	assign instruction = program_counter;
	assign signed_address = program_counter;
	
	// next instruction logic
	always_comb begin
		if (start == 1) begin
			next = start_address;
		end
		else if ((branch == 1) && (taken == 1)) begin
			next = signed_address + offset;
		end
		else if (halt == 1) begin
			next = program_counter;
		end
		else begin
			next = program_counter + 1;
		end
	end
	
	// update program counter every clock cycle
	always_ff @(posedge clock) begin
		program_counter = next;
	end
	
endmodule
