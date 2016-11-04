`timescale 1ns / 1ps

module ALUTest;

	// Inputs
	reg clk;
	reg [7:0] IN1, IN2;
	reg [5:0] OPCODE;
	
	// Outputs
	wire [7:0] result;
	wire overflow;
	
	ALU uut (
		.clk(clk),
		.IN1(IN1),
		.IN2(IN2),
		.OPCODE(OPCODE),
		.result(result),
		.overflow(overflow)
	);
	
	initial begin
		// Initialize Inputs
		IN1 = 0;
		IN2 = 0;
		OPCODE = 0;
		clk = 0;
		
		// Wait 100 ns for global reset to finish
		#100ns;
		
		// Add stimulus here
		
		// Add			Expected ouput: result = 9 or 8'b00001001
		#10ns
		IN1 = 4;
		IN2 = 5;
		OPCODE = 6'b010000;
		
		// Match			Expected output: overflow = 1
		#10ns
		IN1 = 8'b00001111;
		IN2 = 8'b00001111;
		OPCODE = 6'b011000;
		
		// Less than	Expected output: overflow = 0
		#10ns
		IN1 = 15;
		IN2 = -12;
		OPCODE = 6'b100000;
		
		// Distance		Expected output: result = 27
		#10ns
		IN1 = -12;
		IN2 = 15;
		OPCODE = 6'b101000;
		
		// LSL			Expected output: result = 8'b00000000 or 0, overflow = 1
		#10ns
		IN1 = 8'bx;
		IN2 = 8'b10000000;
		OPCODE = 6'b110000;
		
		// LSR			Expected output: result = 8'b00000001 or 1
		#10ns
		IN1 = 8'bx;
		IN2 = 8'b00000010;
		OPCODE = 6'b110001;
		
		// INCR			Expected output: result = -4
		#10ns
		IN1 = 8'bx;
		IN2 = -5;
		OPCODE = 6'b110010;
		
		// AND1			Expected output: overflow = 0
		#10ns
		IN1 = 8'bx;
		IN2 = 8'b00000000;
		OPCODE = 6'b110011;
		
		// EQZ:			Expected output: overflow = 1
		#10ns
		IN1 = 8'bx;
		IN2 = 8'b00000000;
		OPCODE = 6'b110100;
		
		// Zero:			Expected output: result = 0
		#10ns
		IN1 = 8'bx;
		IN2 = 8'bx;
		OPCODE = 6'b110101;
		
		// BNO:			Expected output: overflow = 0
		#10ns
		IN1 = 8'bx;
		IN2 = 8'bx;
		OPCODE = 6'b111000;
		
		// BOF:			Expected output: overflow = 1
		#10ns
		IN1 = 8'bx;
		IN2 = 8'bx;
		OPCODE = 6'b111001;

	end
	
	always begin
     #5ns  clk = 1;
     #5ns  clk = 0; // Toggle clock every 5 ticks
  end
	
endmodule
	