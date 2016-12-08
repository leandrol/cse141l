////////////////////////////
//                        //
// First Uber Cool Design //
//      Data Memory       //
//                        //
////////////////////////////

module data_memory(
	input start,
	input clock,
	input read,
	input write,
	input [7:0] address,
	input [7:0] dataIn,
	output logic [7:0] dataOut
);
	
	logic [7:0] mem [0:255];
	
	always_comb begin
		if (read) begin
			dataOut = mem[address];
		end
		else begin
			dataOut = 8'bz;
		end
	end
	
	always_ff @(negedge clock) begin
		if (start) begin
			$readmemb("default.mem", mem);
		end
		if (write) begin
			mem[address] = dataIn;
		end
	end

endmodule
