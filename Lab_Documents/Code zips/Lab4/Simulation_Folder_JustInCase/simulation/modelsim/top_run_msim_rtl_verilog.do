transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/top.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/PC.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/fetch.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/ALU.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/write_data_switch.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/control.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/instruction_ROM.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/reg_file.sv}
vlog -sv -work work +incdir+C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules {C:/Users/chaos_000/Dropbox/CSE141L/cse141l/modules/data_memory.sv}

