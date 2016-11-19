module Control(
	input [5:0] opcode,
	input overflow,
	output logic readMem,
	output logic writeMem,
	output logic readOrWriteReg,			// readReg = 0, writeReg = 1
	output logic branch,
	output logic taken
);
	assign op = opcode[5:3];
	// function code for A type instructions
	assign funcA = opcode[2:0];
	// function code for B type instructions
	assign funcB = opcode[2];
	
	// OP code aliases to improve readability
	parameter LOAD = 3'b000, STORE = 3'b001, ADD = 3'b010, MATCH = 3'b011, LT = 3'b100, DIST = 3'b101, HAS_FUNCA = 3'b110, HAS_FUNCB = 3'b111;
	
	// func code aliases for the 3'b110 op code to improve readability (A-type)
	parameter LSL = 3'b000, LSR = 3'b001, INCR = 3'b010, AND1 = 3'b011, EQZ = 3'b100, ZERO = 3'b101, TBD = 3'b110, HALT = 3'b111;
	
	// func codes aliases for the 3'b111 op code to improve readability (B-type)
	parameter BNO = 0, BOF = 1;
	
	always_comb begin
		case (op)
		LOAD: begin
			readMem = 1;
			writeMem = 0;
			readOrWriteReg = 1;
			branch = 0;
			taken = 0;
		end
		
		STORE: begin
			readMem = 0;
			writeMem = 1;
			readOrWriteReg = 0;
			branch = 0;
			taken = 0;
		end
		
		ADD: begin
			readMem = 0;
			writeMem = 0;
			readOrWriteReg = 0;
			branch = 0;
			taken = 0;
		end
		
		MATCH: begin
			readMem = 0;
			writeMem =0;
			readOrWriteReg = 0;
			branch = 0;
			taken = 0;
		end
		
		LT: begin
			readMem = 0;
			writeMem = 0;
			readOrWriteReg = 0;
			branch = 0;
			taken = 0;
		end
		
		DIST: begin
			readMem = 0;
			writeMem = 0;
			readOrWriteReg = 0;
			branch = 0;
			taken = 0;
		end
		
		//A-type function bit overloads
		HAS_FUNCA: begin
			case(funcA)
			LSL: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 0;
				branch = 0;
				taken = 0;
			end
			
			LSR: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 0;
				branch = 0;
				taken = 0;
			end
			
			INCR: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 0;
				branch = 0;
				taken = 0;
			end
			
			AND1: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 0;
				branch = 0;
				taken = 0;
			end
			
			EQZ: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 0;
				branch = 0;
				taken = 0;
			end
			
			ZERO: begin
				readMem = 0;
				writeMem = 0;
				readOrWriteReg = 1;
				branch = 0;
				taken = 0;
			end
			endcase
		end
		
		//B-type function bit overloads
		HAS_FUNCB: begin
			case(funcB)
			BNO: begin
				if (overflow == 0) begin
					readMem = 0;
					writeMem = 0;
					readOrWriteReg = 0;
					branch = 1;
					taken = 1;
				end
				else begin
					readMem = 0;
					writeMem = 0;
					readOrWriteReg = 0;
					branch = 0;
					taken = 0;
				end
			end
			
			BOF: begin
				if (overflow == 1) begin
					readMem = 0;
					writeMem = 0;
					readOrWriteReg = 0;
					branch = 1;
					taken = 1;
				end
				else begin
					readMem = 0;
					writeMem = 0;
					readOrWriteReg = 0;
					branch = 0;
					taken = 0;
				end
			end
			endcase
		end
		
		endcase
	end
	
endmodule
