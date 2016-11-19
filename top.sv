module top(
	input start,
	input CLK,
	output halt
	);
	
	// Inputs and outputs for fetch module
	wire [7:0] startAddress = 8'b0;
	wire [6:0] PC;
	wire Branch;
	wire Taken;
	
	// Instruction bits
	wire [8:0] Instruction;
	
	// Inputs and outputs for data module
	wire ReadMem;
	wire WriteMem;
	wire [7:0] memAddress;
	
	// Input and Outputs for register file
	wire RorW;
	wire [7:0] Data1;				// Data from first register operand
	wire [7:0] Data2;				// Data from second register operand
	wire [7:0] writeData;		// Data written to register. Used by ALU for result and
										// by DataRam as dataOut
	
	// Inputs and outputs for ALU
	wire Overflow;
	
	fetch fetch_module (
		.start (start),
		.start_address (startAddress),
		.branch (Branch),
		.taken (Taken),
		.offset (Instruction[4:0]),
		.clock (CLK),
		.instruction (PC)
	);
	
	Instruction_ROM inst_module(
		.address (PC),
		.instruction (Instruction)
	);
	
	Control control_module(
		.opcode (Instruction[8:3]),
		.overflow (Overflow),
		.readMem (ReadMem),
		.writeMem (WriteMem),
		.readOrWriteReg (RorW),
		.branch (Branch),
		.taken (Taken)
	);
	
	DataRAM memory_module(
		.clk (CLK),
		.address (Data2),
		.readMem (ReadMem),
		.writeMem (WriteMem),
		.dataIn (Data1),
		.dataOut (writeData)
	);
	
	regfile register_module(
		.clk (CLK),
		.r_addr1 (Instruction[5:3]),
		.r_addr2 (Instruction[2:0]),
		.w_addr (Instruction[5:3]),
		.w_data (writeData),
		.r_or_w (RorW),
		.data1 (Data1),
		.data2 (Data2)
	);
	
	ALU alu_module(
		.clk (CLK),
		.IN1 (Data1),
		.IN2 (Data2),
		.OPCODE (Instruction[8:3]),
		.result (writeData),
		.overflow (Overflow)
	);
	
endmodule
