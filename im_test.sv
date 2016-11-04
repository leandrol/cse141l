module im_test(
	input [4:0] address,
	output [8:0] instruction
	);
	
	always_comb begin
		case (address)
			0: instruction = 1;
			1: instruction = 2;
			2: instruction = 3;
			3: instruction = 4;
			4: instruction = 5;
			5: instruction = 6;
			6: instruction = 7;
			7: instruction = 8;
			8: instruction = 9;
			9: instruction = 10;
			10: instruction = 11;
			11: instruction = 12;
			12: instruction = 13;
			13: instruction = 14;
			14: instruction = 15;
			15: instruction = 16;
			16: instruction = 17;
			17: instruction = 18;
			18: instruction = 19;
			19: instruction = 20;
			20: instruction = 21;
			21: instruction = 22;
			22: instruction = 23;
			23: instruction = 24;
			24: instruction = 25;
			25: instruction = 26;
			26: instruction = 27;
			27: instruction = 28;
			28: instruction = 29;
			29: instruction = 30;
			30: instruction = 31;
			31: instruction = 32;
			default: instruction = 0;
		endcase
	end
	
endmodule