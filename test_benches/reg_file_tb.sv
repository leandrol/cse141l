module reg_file_tb;
	
	// inputs
	logic start;
	logic [6:0] start_address;
	logic clock;
	logic write;
	logic [2:0] src1;
	logic [2:0] src2;
	logic [7:0] writeData;
	
	// outputs
	logic [7:0] readData1;
	logic [7:0] readData2;
	
	// instantiate unit under test
	reg_file uut (
		start,
		start_address,
		clock,
		write,
		src1,
		src2,
		writeData,
		readData1,
		readData2
	);
	
	// clock
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
	// tests
	initial begin
		
		start = 1'bz;
		start_address = 7'bz;
		write = 1'bz;
		src1 = 3'bz;
		src2 = 3'bz;
		writeData = 8'bz;
		#100ns;
		
		// load product's initial register file
		start = 1;
		start_address = 0;
		#30ns;
		start = 0;
		start_address = 7'bz;
		#10ns;
		
		#100ns
		
		// Write 63 to address 2
		// Should result in register 2 being 8'b00111111
		src1 = 2;
		writeData = 63;
		write = 1;
		#20ns;
		src1 = 3'bz;
		writeData = 8'bz;
		write = 1'bz;
		
		#100ns;
		
		// Read address 1 and 2
		// Data 1 should be 63 and Data 2 should be 0
		src1 = 2;
		src2 = 1;
		write = 0;
		#20ns;
		src1 = 3'bz;
		src2 = 3'bz;
		write = 1'bz;
		
		#100ns;
		
		// Write 31 to address 4
		// Should result in register 4 being 8'b00011111
		src1 = 4;
		writeData = 31;
		write = 1;
		#20ns;
		src1 = 3'bz;
		writeData = 8'bz;
		write = 1'bz;
		
		#100ns;
		
		// Read registers 4 and 2
		// Data 1 should be 31 and Data 2 should be 63
		src1 = 4;
		src2 = 2;
		write = 0;
		#20ns
		src1 = 3'bz;
		src2 = 3'bz;
		write = 1'bz;
		
		#100ns;
		
		// initialize empty register file
		
		start = 1;
		start_address = 10;
		#30ns
		start = 0;
		#10ns
		
		#100ns;
		// Done testing reading and writing to register file
		// Also tested being able to either read or write, not at the same time
		
	end
	
endmodule
