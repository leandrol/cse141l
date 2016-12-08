////////////////////////////
//                        //
// First Uber Cool Design //
//          ALU           //
//                        //
////////////////////////////

module ALU (
	input					 clock,
	input 		 [2:0] opcode,
	input 		 [2:0] funcA,
	input 				 funcB,
	input 		 [7:0] in1,
	input 		 [7:0] in2,
	output logic [7:0] result,
	output logic 		 overflow
	);
	
	logic [8:0] temp;
	logic overflow_reg;
	
	// START ALIASES
	
	// opcode
	parameter
		ADD = 3'b010,
		MATCH = 3'b011,
		LT = 3'b100,
		DIST = 3'b101,
		FUNCA = 3'b110,
		FUNCB = 3'b111;
	
	// funcA
	parameter
		LSL = 3'b000,
		LSR = 3'b001,
		INCR = 3'b010,
		AND1 = 3'b011,
		EQZ = 3'b100,
		ZERO = 3'b101,
		TBD = 3'b110,
		HALT = 3'b111;
	
	// funcB
	parameter
		BNO = 0,
		BOF = 1;
	
	// END ALIASES
	
	always @ (*) begin
		overflow = overflow_reg;
		
		// add
		if (opcode == ADD) begin
			temp = in1 + in2;
			result = temp[7:0];
		end
		
		// match
		else if (opcode == MATCH) begin
			result = 8'bz;
			temp[8] = (in1[3:0] == in2[3:0]);
		end
		
		// less than
		else if (opcode == LT) begin
			result = 8'bz;
			temp[8] = in1 < in2;
		end
		
		// distance
		else if (opcode == DIST) begin
			temp = ($signed(in1) - $signed(in2));
			result = temp[8] ? -temp : temp;
		end
		
		else if (opcode == FUNCA) begin
		
			if (funcA == LSL) begin
				temp = in2;
				temp = temp << 1;
				result = temp[7:0];
			end
			
			else if (funcA == LSR) begin
				temp = in2;
				temp = temp >> 1;
				result = temp[7:0];
			end
			
			else if (funcA == INCR) begin
				temp = in2;
				temp = temp + 1;
				result = temp[7:0];
			end
			
			else if (funcA == AND1) begin
				temp[8] = in2[0] & 1'b1;
				result = 8'bz;
			end
			
			else if (funcA == EQZ) begin
				temp[8] = (in2 == 0);
				result = 8'bz;
			end
			
			else if (funcA == ZERO) begin
				temp = 0;
				result = temp[7:0];
			end
			
			else begin
				temp[8] = 1'bz;
				result = 8'bz;
			end
			
		end
		
		else if (FUNCB) begin
			temp[8] = overflow_reg;
			result = 8'bz;
		end
			
		else begin
			temp[8] = 1'bz;
			result = 8'bz;
		end
		
	end
	
	// write to overflow register
	always_ff @(negedge clock) begin
		if (temp[8] == 1) begin
			overflow_reg = 1;
		end
		else begin
			overflow_reg = 0;
		end
	end
	
endmodule
