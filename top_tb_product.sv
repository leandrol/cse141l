////////////////////////////
//                        //
// First Uber Cool Design //
//        Product         //
//                        //
////////////////////////////

module top_tb_product;
	
	// inputs
	bit 			start;
	logic [6:0] start_address;
	bit 			clock;
	
	// output
	wire done;
	
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
		#10ns start = 0;
	end
	
	always begin
		#5ns clock = 1;
		#5ns clock = 0;
	end
	
endmodule
