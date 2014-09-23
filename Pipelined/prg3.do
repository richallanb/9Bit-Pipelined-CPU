onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_prog/halt
add wave -noupdate /testbench_prog/dyn
add wave -noupdate /testbench_prog/pc
add wave -noupdate /testbench_prog/instr_out
add wave -noupdate /testbench_prog/branch
add wave -noupdate /testbench_prog/taken
add wave -noupdate /testbench_prog/target_pc
add wave -noupdate /testbench_prog/reg_aro
add wave -noupdate /testbench_prog/alu_NZCV
add wave -noupdate /testbench_prog/alu_result
add wave -noupdate /testbench_prog/alu_reg1
add wave -noupdate /testbench_prog/alu_reg2
add wave -noupdate /testbench_prog/con_spec_op
add wave -noupdate /testbench_prog/special_func
add wave -noupdate /testbench_prog/con_write_reg
add wave -noupdate /testbench_prog/con_read_reg
add wave -noupdate /testbench_prog/reg_in_src
add wave -noupdate /testbench_prog/dec_full
add wave -noupdate /testbench_prog/reg_in
add wave -noupdate /testbench_prog/reg_out1
add wave -noupdate /testbench_prog/reg_out2
add wave -noupdate /testbench_prog/reg_ldst
add wave -noupdate /testbench_prog/mem_addr
add wave -noupdate /testbench_prog/mem_datain
add wave -noupdate /testbench_prog/mem_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2698 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
configure wave -valuecolwidth 251
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2604 ps} {2695 ps}
