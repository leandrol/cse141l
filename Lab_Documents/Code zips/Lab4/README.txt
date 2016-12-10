If there are any issues please contact any of us at these numbers, thank you:
Kevin Chen: 626-665-1622
Leandro Lubrico: 818-468-0647
Brandon Chin: 818-447-0550

1) Create a project that contains all of the verilog modules in the folder "Verilog Modules" that is contained in the zip. These files should be
	- ALU.sv
	- control.sv
	- data_memory.sv
	- fetch.sv
	- instruction_ROM.sv
	- PC.sv
	- reg_file.sv
	- top.sv
	- write_data_switch.sv

2) Compile the top verilog module which should be named
	- top.sv

3) Open modelsim to start the simulation and compile all the verilog modules in the "Verilog Modules" and all the program test benches in the folder "Program_TBs" in modelsim. The files to be compiled should be
	- ALU.sv
	- control.sv
	- data_memory.sv
	- fetch.sv
	- instruction_ROM.sv
	- PC.sv
	- reg_file.sv
	- top.sv
	- write_data_switch.sv
	- closest_pair.sv
	- product.sv
	- string_match.sv

4) Before starting any simulations, go to the created simulation folder which should be called "modelsim". This folder should either be in a folder called "simulation" or should be in the root directory under the name "modelsim"

5) Move the files in the "Simulation_Files" into the the "modelsim" folder. These files should be 
	- instructions.bin
	- closest_pair.rf
	- product.rf
	- string_match.rf
	- default.mem
P.S.: We have included our simulation folder in the folder "Simulation_Folder_JustInCase" in the zip to be referenced or used when you are running your simulation.

6) In modelsim, the test benches for each program will have the name "top_tb_*program name*". For example, the test bench for product will be named "top_tb_string_match"

7) Double click "top_tb_product" to run the product simulation. 
- Add the clock, done, and start signals from the "top_tb_product" module. 
- Then add mem[1] - mem[5] from the "data_mem" module. 
- You can also add the current signal from the "program_counter" module to see the state of PC. 

8) For the values initialized into data_mem, which are 53 17 and 42, the "Run length" should be set to 2400 ns. The correct high and low bits should appear in the mem[4] and mem[5].
The run length may need to be increased if the values being multiplied are increased.

9) Double click "top_tb_string_match" to run the string match simulation. 
- Add the clock, done, and start signals from the "top_tb_string_match" module. 
- Then add mem[6] and mem[7] from the "data_mem" module. 
- Add registers[0] - registers[7] from the "register_file" module. (Refer to the write up to see what each register represents)
- You can also add the current signal from the "program_counter" modules to see the state of PC

10) For the values initialized into data_mem and reg_file (refer to the write-up to see the values) the "Run length" should be set to 43,800 ns. The correct match count should be seen in mem[7]
The run length may need to be increased if the number of binary strings in the array are increased

11) Double click "top_tb_closest_pair" to run the closest pair simulation.
- Add the clock, done, and start signals from the "top_tb_closest_pair" module.
- Then add mem[127] - mem[147] from the "data_mem" module to see the values of our specific tests. (Refer to the write up to see what each register represents)
	- If different tests are run, then load mem[127] - mem[128 + number of values]  
- You can also add the current signal from the "program_counter" modules to see the state of PC

12) For the values initialized into data_mem (refer to the write-up to see the values) the "Run length' should be set to 29,350 ns. The correct least distance between pairs should be stored in mem[127].
The run length may need to be increased if the number of values in the array are increased.