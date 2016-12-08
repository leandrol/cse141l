////////////////////////////
//                        //
// First Uber Cool Design //
//        Product         //
//                        //
////////////////////////////

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
