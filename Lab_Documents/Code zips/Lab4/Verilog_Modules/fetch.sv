////////////////////////////
//                        //
// First Uber Cool Design //
//       Fetch Unit       //
//                        //
////////////////////////////

module fetch (
	input              start,
	input        [6:0] start_address,
	input              branch,
	input              taken,
	input			 [4:0] offset,				// target
	input					 halt,
	input			 [6:0] current,
	output logic [6:0] next
);
	
	logic signed [7:0] signed_address;		// for branch calculations
	logic signed [4:0] signed_offset;
	
	always_comb begin
	
		signed_address = current;
		signed_offset = offset;
		
		// START NEXT INTRUCTION LOGIC
		
		// initialize
		if (start == 1) begin
			next = start_address;
		end
		
		// branch
		else if ((branch == 1) && (taken == 1)) begin
			next = signed_address + signed_offset;
		end
		
		// halt
		else if (halt == 1) begin
			next = current;
		end
		
		// increment
		else begin
			next = current + 1;
		end
		
		// END NEXT INSTRUCTION LOGIC
		
	end
	
endmodule
