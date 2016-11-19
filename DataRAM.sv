module DataRAM(
	input clk,
	input address,
	input readMem,
	input writeMem,
	input [7:0] dataIn,
	output logic [7:0] dataOut
);
	
	logic [7:0] mem [0:255];
	
	always_ff @(posedge clk) begin
		if (readMem) begin
			dataOut = mem[address];
		end
		else begin
			dataOut = 8'bZ;
		end
		
		if (writeMem) begin
			mem[address] = dataIn;
		end
	end

endmodule
