module ALU_tb;

	// inputs
	logic 		clock;
	logic [2:0] opcode;
	logic [2:0] funcA;
	logic 		funcB;
	logic [7:0] in1;
	logic [7:0] in2;
	
	// outputs
	logic [7:0] result;
	logic 		overflow;
	
	// instantiate unit under test
	ALU uut (
		clock,
		opcode,
		funcA,
		funcB,
		in1,
		in2,
		result,
		overflow
	);
	
	// clock
	always begin
		#10ns clock = 1;
		#10ns clock = 0;
	end
	
	// tests
	initial begin
		
		// wait 100 ns for global reset to finish
		#100ns;
		
		// Add			Expected ouput: result = 9 or 8'b00001001, overflow = 0
		#20ns;
		opcode = 3'b010;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = 4;
		in2 = 5;
		
		// Match			Expected output: overflow = 1
		#20ns;
		opcode = 3'b011;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = 8'b00001111;
		in2 = 8'b00001111;
		
		// Less than	Expected output: overflow = 0
		#20ns;
		opcode = 3'b100;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = 15;
		in2 = -12;
		
		// Distance		Expected output: result = 27
		#20ns;
		opcode = 3'b101;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = -12;
		in2 = 15;
		
		// LSL			Expected output: result = 8'b00000000 or 0, overflow = 1
		#20ns;
		opcode = 3'b110;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = 8'bz;
		in2 = 8'b10000000;
		
		// LSR			Expected output: result = 8'b00000001 or 1
		#20ns;
		opcode = 3'b110;
		funcA = 3'b001;
		funcB = 1'b0;
		in1 = 8'bz;
		in2 = 8'b00000010;
		
		// INCR			Expected output: result = -4
		#20ns;
		opcode = 3'b110;
		funcA = 3'b010;
		funcB = 1'b0;
		in1 = 8'bx;
		in2 = -5;
		
		// AND1			Expected output: overflow = 0
		#20ns;
		opcode = 3'b110;
		funcA = 3'b011;
		funcB = 1'b0;
		in1 = 8'bz;
		in2 = 8'b00000000;
		
		// EQZ:			Expected output: overflow = 1
		#20ns;
		opcode = 3'b110;
		funcA = 3'b100;
		funcB = 1'b1;
		in1 = 8'bx;
		in2 = 8'b00000000;
		
		// Zero:			Expected output: result = 0
		#20ns;
		opcode = 3'b110;
		funcA = 3'b101;
		funcB = 1'b1;
		in1 = 8'bx;
		in2 = 8'bx;
		
		// BNO:			Expected output: overflow = 0
		#20ns;
		opcode = 3'b111;
		funcA = 3'b000;
		funcB = 1'b0;
		in1 = 8'bz;
		in2 = 8'bz;
		
		// BOF:			Expected output: overflow = 0
		#20ns;
		opcode = 3'b111;
		funcA = 3'b100;
		funcB = 1'b1;
		in1 = 8'bz;
		in2 = 8'bz;

	end
	
endmodule
	