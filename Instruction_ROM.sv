// This Instruction ROM contains temporary values and does not actually contain our programs.
module Instruction_ROM #(parameter numInstr = 128) (
	input        [6:0] address,
	output 		 [8:0] instruction
);

	reg [8:0] internal_memory [0: numInstr-1];
	
	initial begin
		$readmemb("instructions.bin", internal_memory);
	end
	
	assign instruction = address < numInstr ? internal_memory[address] : 9'b0;
	
	/*
	always_comb begin
		case (address)
			0:       instruction = 1;
			1:       instruction = 2;
			2:       instruction = 3;
			3:       instruction = 4;
			4:       instruction = 5;
			5:       instruction = 6;
			6:       instruction = 7;
			7:       instruction = 8;
			8:       instruction = 9;
			9:       instruction = 10;
			10:      instruction = 11;
			11:      instruction = 12;
			12:      instruction = 13;
			13:      instruction = 14;
			14:      instruction = 15;
			15:      instruction = 16;
			16:      instruction = 17;
			17:      instruction = 18;
			18:      instruction = 19;
			19:      instruction = 20;
			20:      instruction = 21;
			21:      instruction = 22;
			22:      instruction = 23;
			23:      instruction = 24;
			24:      instruction = 25;
			25:      instruction = 26;
			26:      instruction = 27;
			27:      instruction = 28;
			28:      instruction = 29;
			29:      instruction = 30;
			30:      instruction = 31;
			31:      instruction = 32;
			32:      instruction = 33;
			33:      instruction = 34;
			34:      instruction = 35;
			35:      instruction = 36;
			36:      instruction = 37;
			37:      instruction = 38;
			38:      instruction = 39;
			39:      instruction = 40;
			40:      instruction = 41;
			41:      instruction = 42;
			42:      instruction = 43;
			43:      instruction = 44;
			44:      instruction = 45;
			45:      instruction = 46;
			46:      instruction = 47;
			47:      instruction = 48;
			48:      instruction = 49;
			49:      instruction = 50;
			50:      instruction = 51;
			51:      instruction = 52;
			52:      instruction = 53;
			53:      instruction = 54;
			54:      instruction = 55;
			55:      instruction = 56;
			56:      instruction = 57;
			57:      instruction = 58;
			58:      instruction = 59;
			59:      instruction = 60;
			60:      instruction = 61;
			61:      instruction = 62;
			62:      instruction = 63;
			63:      instruction = 64;
			64:      instruction = 65;
			65:      instruction = 66;
			66:      instruction = 67;
			67:      instruction = 68;
			68:      instruction = 69;
			69:      instruction = 70;
			70:      instruction = 71;
			71:      instruction = 72;
			72:      instruction = 73;
			73:      instruction = 74;
			74:      instruction = 75;
			75:      instruction = 76;
			76:      instruction = 77;
			77:      instruction = 78;
			78:      instruction = 79;
			79:      instruction = 80;
			80:      instruction = 81;
			81:      instruction = 82;
			82:      instruction = 83;
			83:      instruction = 84;
			84:      instruction = 85;
			85:      instruction = 86;
			86:      instruction = 87;
			87:      instruction = 88;
			88:      instruction = 89;
			89:      instruction = 90;
			90:      instruction = 91;
			91:      instruction = 92;
			92:      instruction = 93;
			93:      instruction = 94;
			94:      instruction = 95;
			95:      instruction = 96;
			96:      instruction = 97;
			97:      instruction = 98;
			98:      instruction = 99;
			99:      instruction = 100;
			100:     instruction = 101;
			101:     instruction = 102;
			102:     instruction = 103;
			103:     instruction = 104;
			104:     instruction = 105;
			105:     instruction = 106;
			106:     instruction = 107;
			107:     instruction = 108;
			108:     instruction = 109;
			109:     instruction = 110;
			110:     instruction = 111;
			111:     instruction = 112;
			112:     instruction = 113;
			113:     instruction = 114;
			114:     instruction = 115;
			115:     instruction = 116;
			116:     instruction = 117;
			117:     instruction = 118;
			118:     instruction = 119;
			119:     instruction = 120;
			120:     instruction = 121;
			121:     instruction = 122;
			122:     instruction = 123;
			123:     instruction = 124;
			124:     instruction = 125;
			125:     instruction = 126;
			126:     instruction = 127;
			127:     instruction = 128;
			default: instruction = 0;
		endcase
	end
	*/
	
endmodule
