////////////////////////////
//                        //
// First Uber Cool Design //
//       Processor        //
//                        //
////////////////////////////

module top (
	input start,
	input [6:0] start_address,
	input clock,
	output logic done
	);
	
	// START WIRES
	
	logic [6:0] next;
	logic [6:0] current;
	logic [8:0] instruction;
	logic [7:0] regData1;
	logic [7:0] regData2;
	logic [7:0] aluData;
	logic			overflow;
	logic [7:0] memData;
	logic [7:0] writeData;
	logic 		branch;
	logic 		taken;
	logic 		halt;
	logic 		regWrite;
	logic			regDest;
	logic 		memRead;
	logic 		memWrite;
	logic 		memToReg;
	
	// END WIRES
	
	// START MODULES
	
	PC program_counter (
		clock,
		next,
		current
	);
	
	fetch fetch_unit (
		start,
		start_address,
		branch,
		taken,
		instruction[4:0],
		halt,
		current,
		next
	);
	
	instruction_ROM instr_mem (
		current,
		instruction
	);
	
	reg_file register_file (
		start,
		start_address,
		clock,
		regWrite,
		regDest,
		instruction[5:3],
		instruction[2:0],
		writeData,
		regData1,
		regData2
	);
	
	ALU alu (
		clock,
		instruction[8:6],
		instruction[5:3],
		instruction[5],
		regData1,
		regData2,
		aluData,
		overflow
	);
	
	data_memory data_mem (
		start,
		clock,
		memRead,
		memWrite,
		regData2,
		regData1,
		memData
	);
	
	WriteDataSwitch data_switch (
		memToReg,
		aluData,
		memData,
		writeData
	);
	
	Control control (
		instruction[8:6],
		instruction[5:3],
		instruction[5],
		overflow,
		branch,
		taken,
		halt,
		regWrite,
		regDest,
		memRead,
		memWrite,
		memToReg
	);
	
	// END MODULES
	
	always_comb begin
		done = halt;
	end
	
endmodule
