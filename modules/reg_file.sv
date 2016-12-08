////////////////////////////
//                        //
// First Uber Cool Design //
//     Register File      //
//                        //
////////////////////////////

module reg_file (
	input 				 start,
	input 		 [6:0] start_address,
	input 				 clock,
	input 				 write,
	input					 dest,
	input 		 [2:0] src1,
	input 		 [2:0] src2,
	input 		 [7:0] writeData,
	output logic [7:0] readData1,
	output logic [7:0] readData2
	);

	logic [7:0] registers [0:7];
	
	// read
	always_comb begin
		readData1 = registers[src1];
		readData2 = registers[src2];
	end
	
	always_ff @(negedge clock) begin
	
		// initialize
		if (start) begin
			case (start_address)
				
				// product
				7'b0 : begin
					$readmemb("product.rf", registers);
				end
				
				default: begin
					registers = '{8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
				end
				
			endcase
		end
		
		// write
		if (write == 1) begin
			case (dest)
				0: begin
					registers[src1] = writeData;
				end
				default: begin
					registers[src2] = writeData;
				end
			endcase
		end
	
	end

endmodule
