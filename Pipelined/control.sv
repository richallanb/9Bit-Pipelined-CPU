module control(
input wire [8:0]instruction,
input wire [1:0]aro,
input wire ldst,
input wire [3:0] NZCV,

output reg ALUon,
output reg fulladdr,
output reg special_op,
output reg [2:0]special_func,
output reg write_reg, read_reg,
output reg write_mem, read_mem,
output reg branch,
output reg direct_flag,
output reg [1:0]reg_input_src, // 00 = register file, 01 = memory, 10 = alu, 11 = instruction
output reg mem_alu_src,
output reg halt,
output reg takeit,
input clk,
output reg [2:0] pipe_state_o
);

parameter 	_if = 3'b000,
				_if_reg = 3'b001,
				_mem = 3'b010,
				_ex = 3'b011,
				_wb = 3'b100;
				
reg [2:0] pipe_state = 0;
reg [2:0] _new_state=0;
always @ (posedge clk)
begin
			pipe_state <= _new_state;
end

initial begin
halt =0;
end
always @(*)
begin
	if (pipe_state == _if)
	begin
		_new_state = _if_reg
	end
	else if (pipe_state = _if_reg)
	begin
	case(instruction[8:6])
		3'b000: //aro
		begin
			if (pipe_state = _if_reg)
			begin
				special_func = 0;
				special_op = 0;
				halt =0;
				read_reg = 1;
				fulladdr = 0;
				mem_alu_src = 0;
			end
			read_mem = 0;
			write_mem = 0;
			branch = 0;
			ALUon = 1;
			takeit = 0;
			reg_input_src[1:0] = 2'b10; // ALU source
			case(aro[1:0])
				2'b00: //add
					begin
						write_reg = 1;
					end
				2'b01: //sub
					begin
						write_reg = 1;
					end
				2'b10: write_reg =0; // CMP
				2'b11: //slt
					begin
						write_reg = 1;
					end
			endcase
		end
		3'b001: //mov
		begin
			takeit = 0;
			special_func = 0;
			halt =0;
			mem_alu_src = 0;
			fulladdr = 0;
			write_reg = 1;
			read_reg = 1;
			special_op = 0;
			read_mem = 0;
			write_mem = 0;
			branch = 0;
			ALUon = 0;
			reg_input_src[1:0] = 2'b00; // Reg source
		end
		3'b010: //ldst
		begin
			takeit = 0;
			special_func = 0;
			halt =0;
			mem_alu_src = 0;
			write_mem = ldst;
			read_mem = ~ldst;	
			reg_input_src[1:0] = 2'b01; // Mem source
			fulladdr = 0;
			write_reg = ~ldst;
			read_reg = 1;
			special_op = 0;
			branch = 0;
			ALUon = 0;
		end
		3'b011: //ssb
		begin
			takeit = 0;
			special_func = 0;
			halt =0;
			mem_alu_src = 0;
			reg_input_src[1:0] = 2'b11; // Instr source
			fulladdr = 1;
			write_reg = 1;
			read_reg = 0;
			special_op = 0;
			read_mem = 0;
			write_mem = 0;
			branch = 0;
			ALUon = 0;
		end
		3'b100: //hi-lo
		begin
			takeit = 0;
			special_func = 0;
			halt =0;
			mem_alu_src = 0;
			reg_input_src[1:0] = 2'b11; // Instr source
			fulladdr = 1;
			write_reg = 1;
			read_reg = 0;
			special_op = 0;
			read_mem = 0;
			write_mem = 0;
			branch = 0;
			ALUon = 0;
		end
		3'b110: //special
		begin
			takeit = 0;
			special_op = 1;
			fulladdr = 0;
			special_func = instruction[5:3];
			branch = 0;
		  case(instruction[5:3])
		    3'b000:  //MFL
			 begin
				halt =0;
				mem_alu_src = 0;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 0;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b001: //SPC
			 begin
				halt =0;
				mem_alu_src = 1;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 1;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b010:  //MFH
			 begin
				halt =0;
				mem_alu_src = 0;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 0;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b011: //ISC
			 begin
				halt =0;
				mem_alu_src = 0;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 0;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b100: //INC
			 begin
				halt =0;
				mem_alu_src = 0;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 0;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b101: //SM
			 begin
				halt =0;
				mem_alu_src = 0;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 0;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b110: //Tally
			 begin
				halt =0;
				mem_alu_src = 1;
				reg_input_src[1:0] = 2'b10; // ALU source
				write_reg = 1;
				read_reg = 1;
				read_mem = 1;
				write_mem = 0;
				ALUon = 1;
			 end
			 3'b111:
			 begin
				if (instruction[2:0] == 3'b000) //halt
				begin
					mem_alu_src = 0;
					write_reg = 0;
					read_reg = 0;
					read_mem = 0;
					write_mem = 0;
					ALUon = 0;
					halt = 1;
				end
				else	// Tally Count
				begin
					halt = 0;
					mem_alu_src = 0;
					reg_input_src[1:0] = 2'b00; // Reg source
					write_reg = 1;
					read_reg = 1;
					read_mem = 0;
					write_mem = 0;
					ALUon = 0;
				end	
			end
			endcase
		end
		3'b101: //branching -
		begin
			special_func = 0;
			halt =0;
			branch = 1;
			// When Branch Equals, we branch when Zero bit is 1
			// When Branch Not Equals, we branch when Zero bit is NOT 1
			takeit =(~instruction[4]&NZCV[2])|(instruction[4]&~NZCV[2]);
			
			if (instruction[5]) // offset
				begin
					special_op = 0;
					fulladdr = 0;
					write_reg = 0;
					read_reg = 0;
					read_mem = 0;
					write_mem = 0;
					ALUon = 1;
					reg_input_src = 2'b01; // ALU Src PC
					direct_flag = 0;
				end
			else // direct
				begin
					special_op = 0;
					fulladdr = 1;
					write_reg = 0;
					read_reg = 1;
					read_mem = 0;
					write_mem = 0;
					ALUon = 0;
					direct_flag = 1;
				end
		end
		3'b111: //tba
		begin
			takeit = 0;
			special_func = 0;
			halt =0;
			branch = 0;
			special_op = 0;
			fulladdr = 0;
			write_reg = 0;
			read_reg = 0;
			read_mem = 0;
			write_mem = 0;
			ALUon = 0;
			reg_input_src = 2'b00; // ALU source
		end
	endcase
	end
	pipe_state_o <= pipe_state;
end

endmodule
