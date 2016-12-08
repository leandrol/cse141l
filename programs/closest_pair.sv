////////////////////////////
//                        //
// First Uber Cool Design //
//      Closest Pair      //
//                        //
////////////////////////////

// default.mem
// expected output: 2
// ** these are decimal representations

module top_tb_closest_pair;
	
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
		start_address = 7'b0110010;
		#15ns start = 0;
	end
	
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
endmodule
