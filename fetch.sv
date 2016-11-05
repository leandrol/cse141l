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
	output logic  [8:0] instruction
);
	
	logic        [6:0] pc_to_im;			// program counter to instruction memory
	logic signed [7:0] signed_address;	// for branch calculations
	logic        [6:0] next;				// next instruction address
	
	logic [6:0] program_counter;
	im_test instruction_memory (
		pc_to_im,
		instruction
	);
	
	assign pc_to_im = program_counter;
	assign signed_address = program_counter;
	
	// next instruction logic
	always_comb begin
		if (start == 1) begin
			next = start_address;
		end
		else if ((branch == 1) && (taken == 1)) begin
			next = signed_address + offset;
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
