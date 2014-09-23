// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Sat Nov 30 19:54:31 2013"

module pc_schematic(
	clk,
	taken,
	halt,
	con_spec_op,
	con_write_reg,
	con_read_reg,
	reg_ldst,
	branch,
	alu_NZCV,
	alu_reg1,
	alu_reg2,
	alu_result,
	dec_full,
	dec_imm,
	dec_imm_br,
	dec_r1,
	dec_r2,
	dec_rw,
	dyn,
	instr_out,
	mem_addr,
	mem_datain,
	mem_out,
	new_pc,
	pc,
	pipe_state,
	reg_aro,
	reg_in,
	reg_in_src,
	reg_out1,
	reg_out2,
	special_func,
	target_pc
);


input wire	clk;
output wire	taken;
output wire	halt;
output wire	con_spec_op;
output wire	con_write_reg;
output wire	con_read_reg;
output wire	reg_ldst;
output wire	branch;
output wire	[3:0] alu_NZCV;
output wire	[7:0] alu_reg1;
output wire	[7:0] alu_reg2;
output wire	[7:0] alu_result;
output wire	[3:0] dec_full;
output wire	[7:0] dec_imm;
output wire	[7:0] dec_imm_br;
output wire	[2:0] dec_r1;
output wire	[2:0] dec_r2;
output wire	[2:0] dec_rw;
output wire	[15:0] dyn;
output wire	[8:0] instr_out;
output wire	[7:0] mem_addr;
output wire	[7:0] mem_datain;
output wire	[7:0] mem_out;
output wire	[7:0] new_pc;
output wire	[7:0] pc;
output wire	[2:0] pipe_state;
output wire	[1:0] reg_aro;
output wire	[7:0] reg_in;
output wire	[1:0] reg_in_src;
output wire	[7:0] reg_out1;
output wire	[7:0] reg_out2;
output wire	[2:0] special_func;
output wire	[7:0] target_pc;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_58;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_59;
wire	[7:0] SYNTHESIZED_WIRE_60;
wire	[7:0] SYNTHESIZED_WIRE_61;
wire	[7:0] SYNTHESIZED_WIRE_62;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[1:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_64;
wire	[1:0] SYNTHESIZED_WIRE_65;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[7:0] SYNTHESIZED_WIRE_17;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[2:0] SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[3:0] SYNTHESIZED_WIRE_67;
wire	[2:0] SYNTHESIZED_WIRE_27;
wire	[2:0] SYNTHESIZED_WIRE_28;
wire	[2:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	[8:0] SYNTHESIZED_WIRE_68;
wire	[3:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[7:0] SYNTHESIZED_WIRE_69;
wire	[7:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[7:0] SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_52;

assign	taken = SYNTHESIZED_WIRE_46;
assign	halt = SYNTHESIZED_WIRE_58;
assign	con_spec_op = SYNTHESIZED_WIRE_63;
assign	con_write_reg = SYNTHESIZED_WIRE_21;
assign	con_read_reg = SYNTHESIZED_WIRE_22;
assign	reg_ldst = SYNTHESIZED_WIRE_32;
assign	branch = SYNTHESIZED_WIRE_64;
assign	alu_NZCV = SYNTHESIZED_WIRE_35;
assign	alu_reg1 = SYNTHESIZED_WIRE_16;
assign	alu_reg2 = SYNTHESIZED_WIRE_17;
assign	alu_result = SYNTHESIZED_WIRE_62;
assign	dec_full = SYNTHESIZED_WIRE_67;
assign	dec_imm = SYNTHESIZED_WIRE_10;
assign	dec_imm_br = SYNTHESIZED_WIRE_43;
assign	dec_r1 = SYNTHESIZED_WIRE_27;
assign	dec_r2 = SYNTHESIZED_WIRE_28;
assign	dec_rw = SYNTHESIZED_WIRE_31;
assign	instr_out = SYNTHESIZED_WIRE_68;
assign	mem_addr = SYNTHESIZED_WIRE_59;
assign	mem_datain = SYNTHESIZED_WIRE_60;
assign	mem_out = SYNTHESIZED_WIRE_61;
assign	new_pc = SYNTHESIZED_WIRE_2;
assign	pc = SYNTHESIZED_WIRE_69;
assign	reg_aro = SYNTHESIZED_WIRE_65;
assign	reg_in = SYNTHESIZED_WIRE_25;
assign	reg_in_src = SYNTHESIZED_WIRE_11;
assign	reg_out1 = SYNTHESIZED_WIRE_59;
assign	reg_out2 = SYNTHESIZED_WIRE_60;
assign	special_func = SYNTHESIZED_WIRE_66;
assign	target_pc = SYNTHESIZED_WIRE_49;




program_counter	b2v_inst(
	.clock(clk),
	.wenable_i(SYNTHESIZED_WIRE_0),
	.reset_i(SYNTHESIZED_WIRE_58),
	.newpc_i(SYNTHESIZED_WIRE_2),
	.dynamic_o(dyn),
	.pc_o(SYNTHESIZED_WIRE_69));


single_port_ram_with_init	b2v_inst1(
	.writemem(SYNTHESIZED_WIRE_3),
	.readmem(SYNTHESIZED_WIRE_4),
	.clk(clk),
	.addr(SYNTHESIZED_WIRE_59),
	.data(SYNTHESIZED_WIRE_60),
	.q(SYNTHESIZED_WIRE_61));
	defparam	b2v_inst1.ADDR_WIDTH = 8;


mux4	b2v_inst10(
	.input1(SYNTHESIZED_WIRE_59),
	.input2(SYNTHESIZED_WIRE_61),
	.input3(SYNTHESIZED_WIRE_62),
	.input4(SYNTHESIZED_WIRE_10),
	.select(SYNTHESIZED_WIRE_11),
	.out(SYNTHESIZED_WIRE_25));


alu	b2v_inst11(
	.special_op(SYNTHESIZED_WIRE_63),
	.ALUon(SYNTHESIZED_WIRE_13),
	.branch(SYNTHESIZED_WIRE_64),
	.aro(SYNTHESIZED_WIRE_65),
	.reg1(SYNTHESIZED_WIRE_16),
	.reg2(SYNTHESIZED_WIRE_17),
	.reg3(SYNTHESIZED_WIRE_18),
	.reg4(SYNTHESIZED_WIRE_19),
	.special_func(SYNTHESIZED_WIRE_66),
	.NZCV(SYNTHESIZED_WIRE_35),
	.result(SYNTHESIZED_WIRE_62));


register_file	b2v_inst13(
	.CLK(clk),
	.write_reg(SYNTHESIZED_WIRE_21),
	.read_reg(SYNTHESIZED_WIRE_22),
	.special_op(SYNTHESIZED_WIRE_63),
	.full_addr(SYNTHESIZED_WIRE_24),
	.data_in(SYNTHESIZED_WIRE_25),
	.full_reg_src(SYNTHESIZED_WIRE_67),
	.reg_src1(SYNTHESIZED_WIRE_27),
	.reg_src2(SYNTHESIZED_WIRE_28),
	.special_func(SYNTHESIZED_WIRE_66),
	.write_reg_full(SYNTHESIZED_WIRE_67),
	.write_reg_src(SYNTHESIZED_WIRE_31),
	.ldst(SYNTHESIZED_WIRE_32),
	.aro(SYNTHESIZED_WIRE_65),
	.data1(SYNTHESIZED_WIRE_59),
	.data2(SYNTHESIZED_WIRE_60),
	.data3(SYNTHESIZED_WIRE_18),
	.data4(SYNTHESIZED_WIRE_19));


control	b2v_inst2(
	.ldst(SYNTHESIZED_WIRE_32),
	.clk(clk),
	.aro(SYNTHESIZED_WIRE_65),
	.instruction(SYNTHESIZED_WIRE_68),
	.NZCV(SYNTHESIZED_WIRE_35),
	.ALUon(SYNTHESIZED_WIRE_13),
	.fulladdr(SYNTHESIZED_WIRE_24),
	.special_op(SYNTHESIZED_WIRE_63),
	.write_reg(SYNTHESIZED_WIRE_21),
	.read_reg(SYNTHESIZED_WIRE_22),
	.write_mem(SYNTHESIZED_WIRE_3),
	.read_mem(SYNTHESIZED_WIRE_4),
	.branch(SYNTHESIZED_WIRE_64),
	.direct_flag(SYNTHESIZED_WIRE_52),
	.mem_alu_src(SYNTHESIZED_WIRE_36),
	.halt(SYNTHESIZED_WIRE_58),
	.takeit(SYNTHESIZED_WIRE_46),
	.pipe_state_o(pipe_state),
	.reg_input_src(SYNTHESIZED_WIRE_11),
	.special_func(SYNTHESIZED_WIRE_66));


mux_weird	b2v_inst22(
	.select_hi(SYNTHESIZED_WIRE_36),
	.select_lo(SYNTHESIZED_WIRE_64),
	.input0(SYNTHESIZED_WIRE_59),
	.input1(SYNTHESIZED_WIRE_69),
	.input2(SYNTHESIZED_WIRE_61),
	
	.out(SYNTHESIZED_WIRE_16));


muxq	b2v_inst23(
	.select(SYNTHESIZED_WIRE_64),
	.input1(SYNTHESIZED_WIRE_60),
	.input2(SYNTHESIZED_WIRE_43),
	.out(SYNTHESIZED_WIRE_17));

assign	SYNTHESIZED_WIRE_45 =  ~SYNTHESIZED_WIRE_58;


next_pc_logic	b2v_inst4(
	.clk(clk),
	.start(SYNTHESIZED_WIRE_45),
	.taken(SYNTHESIZED_WIRE_46),
	.branch(SYNTHESIZED_WIRE_64),
	.currentpc(SYNTHESIZED_WIRE_69),
	.target(SYNTHESIZED_WIRE_49),
	.pc_o(SYNTHESIZED_WIRE_2));


decoder	b2v_inst5(
	.clk(clk),
	.instruction(SYNTHESIZED_WIRE_68),
	.branch_imm(SYNTHESIZED_WIRE_43),
	.immediate(SYNTHESIZED_WIRE_10),
	.reg1_banked(SYNTHESIZED_WIRE_27),
	.reg2_banked(SYNTHESIZED_WIRE_28),
	.reg_full(SYNTHESIZED_WIRE_67),
	.reg_wr_banked(SYNTHESIZED_WIRE_31));

assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_58;


muxq	b2v_inst8(
	.select(SYNTHESIZED_WIRE_52),
	.input1(SYNTHESIZED_WIRE_62),
	.input2(SYNTHESIZED_WIRE_59),
	.out(SYNTHESIZED_WIRE_49));


prog2_ROM	b2v_inst9(
	.clk(clk),
	.pc(SYNTHESIZED_WIRE_69),
	.instr_out(SYNTHESIZED_WIRE_68));


endmodule
