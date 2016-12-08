////////////////////////////
//                        //
// First Uber Cool Design //
//   Write Data Switch    //
//                        //
////////////////////////////

module WriteDataSwitch (
	input 				 memToReg,
	input 		 [7:0] aluData,
	input 		 [7:0] memData,
	output logic [7:0] writeData
);

always_comb begin
	if (memToReg) begin
		writeData = memData;
	end
	else begin
		writeData = aluData;
	end
end

endmodule
