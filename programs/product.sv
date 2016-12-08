////////////////////////////
//                        //
// First Uber Cool Design //
//        Product         //
//                        //
////////////////////////////

// default.mem
// inputs: 53, 17, 42
// expected output: 37842 (147, 210)
// ** these are decimal representations

module top_tb_product;
	
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
		start_address = 9'b000000000;
		#15ns start = 0;
	end
	
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
endmodule
