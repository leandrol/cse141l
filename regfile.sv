
module regfile (
	input clk,
	input [2:0] r_addr1, r_addr2, w_addr,
	input [7:0] w_data,
	input r_or_w,
	output reg [7:0] data1, data2
	);
	
	logic [7:0] registers [0:7] = {8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0, 8'b0};
	
	always_ff @(posedge clk) begin
		if(r_or_w == 0) begin
			// Read data
			data1 <= registers[r_addr1];
			data2 <= registers[r_addr2];
		end
		else begin
			// Write data
			registers[w_addr] <= w_data;
		end
	end
		
endmodule
