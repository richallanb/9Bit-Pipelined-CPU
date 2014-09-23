transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/pc_schematic_v.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/alu.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/program_counter.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/register_file.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/next_pc_logic.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/control.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/datamem.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/muxq.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/mux4.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/decoder.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/mux_weird.sv}
vlog -sv -work work +incdir+C:/Users/rbull/Desktop/Lab2 {C:/Users/rbull/Desktop/Lab2/prog3_ROM.sv}

