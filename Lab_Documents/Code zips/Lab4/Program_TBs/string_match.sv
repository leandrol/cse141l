////////////////////////////
//                        //
// First Uber Cool Design //
//      String Match      //
//                        //
////////////////////////////

// default.mem
// expected output: 19
// ** these are decimal representations

module top_tb_string_match;
	
	// inputs
	logic 		start;
	logic [6:0] start_address;
	logic 		clock;
	
	// output
	logic done;
	
	// instantiate unit under test
	top uut (
		start,
		start_address,
		clock,
		done
	);
	
	initial begin
		#100ns;
		start = 1;
		start_address = 7'b0100010;
		#15ns start = 0;
	end
	
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
endmodule
