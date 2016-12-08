////////////////////////////
//                        //
// First Uber Cool Design //
//        Control         //
//                        //
////////////////////////////

module Control(
	input 		 [2:0] opcode,
	input 		 [2:0] funcA,
	input 				 funcB,
	input 				 overflow,
	output logic 		 branch,
	output logic 		 taken,
	output logic		 halt,
	output logic 		 regWrite,
	output logic		 regDest,
	output logic 		 memRead,
	output logic 		 memWrite,
	output logic 		 memToReg
);

	// START ALIASES
	
	// opcode
	parameter
		LOAD = 3'b000,
		STORE = 3'b001,
		ADD = 3'b010,
		MATCH = 3'b011,
		LT = 3'b100,
		DIST = 3'b101,
		HAS_FUNCA = 3'b110,
		HAS_FUNCB = 3'b111;
	
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
	
	always_comb begin
		case (opcode)
			LOAD: begin
				branch = 0;
				taken = 0;
				halt = 0;
				regWrite = 1;
				regDest = 0;
				memRead = 1;
				memWrite = 0;
				memToReg = 1;
			end
			STORE: begin
				branch = 0;
				taken = 0;
				halt = 0;
				regWrite = 0;
				regDest = 0;
				memRead = 0;
				memWrite = 1;
				memToReg = 0;
			end
			ADD: begin
				branch = 0;
				taken = 0;
				halt = 0;
				regWrite = 1;
				regDest = 0;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
			end
			DIST: begin
				branch = 0;
				taken = 0;
				halt = 0;
				regWrite = 1;
				regDest = 0;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
			end
			HAS_FUNCA: begin
				case (funcA)
					LSL: begin
						branch = 0;
						taken = 0;
						halt = 0;
						regWrite = 1;
						regDest = 1;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
					LSR: begin
						branch = 0;
						taken = 0;
						halt = 0;
						regWrite = 1;
						regDest = 1;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
					INCR: begin
						branch = 0;
						taken = 0;
						halt = 0;
						regWrite = 1;
						regDest = 1;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
					ZERO: begin
						branch = 0;
						taken = 0;
						halt = 0;
						regWrite = 1;
						regDest = 1;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
					HALT: begin
						branch = 0;
						taken = 0;
						halt = 1;
						regWrite = 0;
						regDest = 0;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
					default: begin
						branch = 0;
						taken = 0;
						halt = 0;
						regWrite = 0;
						regDest = 0;
						memRead = 0;
						memWrite = 0;
						memToReg = 0;
					end
				endcase
			end
			HAS_FUNCB: begin
				branch = 1;
				if ((funcB && overflow) || !(funcB || overflow)) begin
					taken = 1;
				end
				else begin
					taken = 0;
				end
				halt = 0;
				regWrite = 0;
				regDest = 0;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
			end
			default: begin
				branch = 0;
				taken = 0;
				halt = 0;
				regWrite = 0;
				regDest = 0;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
			end
		endcase
	end
				
endmodule
