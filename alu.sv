
module ALU (
	input clk,
	input [7:0] IN1, IN2,
	input [5:0] OPCODE,
	output reg [7:0] result,
	output overflow
	);
	
	// tempResult registers are used as an intermediate place holder
	// tempResult_OF used to hold the overflow bit in tempResult_OF[8], like for add
	reg [8:0] tempResult_OF;
	// If overflow is not needed, then hold it in this reg so you don't need to splice the reg, like for subtract
	reg [7:0] tempResult;
	
	// Op and func codes to split the input OPCODE
	wire [2:0] op;
	wire [2:0] func;
	
	// Op and func code assignments
	op = OPCODE[5:3];
	func = OPCODE[2:0];
	
	// OP code aliases to improve readability
	parameter ADD = 3'b010, MATCH = 3'b011, LT = 3'b100, DIST = 3'b101, HAS_FUNCA = 3'b110; HAS_FUNCB = 3'b111
	
	// func code aliases for the 3'b110 op code to improve readability (A-type)
	parameter LSL = 3'b000, LSR = 3'b001, INCR = 3'b010, AND1 = 3'b011, EQZ = 3'b100, ZERO = 3'b101, TBD = 3'b110, HALT = 3'b111;
	
	// func codes aliases for the 3'b111 op code to improve readability (B-type)
	parameter BNO = 3'b000, BOF = 3'b001;
	
	// Always block since ALU needs to be sync'ed with clock
	always @(posedge clk) begin
		case (op)
		ADD: begin
			tempResult_OF <= IN1 + IN2;
			
			// tempResult_OF is 9 bits wide, so overflow is the 9th bit while result is the other 8 bits
			// TODO: Might need to add $signed because part-select in verilog turns number to unsigned
			result <= tempResult_OF[7:0];
			overflow <= tempResult_OF[8];
		end
		
		MATCH: begin
			overflow <= (IN1 == IN2);
		end
		
		// LT = Less Than and this operation is signed
		LT: begin
			// Signed casting because verilog compares unsigned by default
			overflow <= ($signed(IN1) < $signed(IN2));
		end
		
		// Find distance between two numbers using signed subtraction and absolute value
		DIST: begin
			tempResult <= &signed(IN1) - &signed(IN2);
			
			// Take absolute value (if sign bit is 1, we negate it to make it positive)
			//	Conversion not neccessary cause verilog use's 2's compliment natively
			result <= tempResult[7] ? -tempResult : tempResult;
		end
		
		//A-type function bit overloads
		HAS_FUNCA: begin
			case(func)
			LSL: begin
				overflow <= IN2[7];
				result <= IN2 << 1;
			end
			
			LSR: begin
				// TODO: I think we epect the LSB of the shifted number to be shifted to the overflow bit
				result <= IN2 >> 1;
			end
			
			INCR: begin
				// TODO: If we need to grab the overflow, it's a simple task
				result <= IN2 + 1;
			end
			
			AND1: begin
				// If the LSB of the input is 1, then overflow is set
				overflow <= IN2[0] & 1'b1;
			end
			
			EQZ: begin
				// If input is 0, then overflow is set
				overflow <= (IN2 == 0);
			end
			
			ZERO: begin
				// Set result to 0, assuming that the result is what the next value of the register is going to be.
				result <= 0;
			end
		end
		
		// TODO: Does the branch arithmetic go here? Based on the write-up, the Instruction ROM (ie. part of the fetch unit)
		// seems to handle the branch arithmetic
		
		//B-type function bit overloads
		HAS_FUNCB: begin
		end
	end
	
endmodule
