module decoder (
	input wire clk,
	input wire [8:0] instruction,
	
	output reg [2:0] reg1_banked,
	output reg [2:0] reg2_banked,
	
	output reg [3:0] reg_full,
	output reg [7:0] immediate,
	output reg [7:0] branch_imm,
	output reg [2:0] reg_wr_banked
	);

always @ (*)
begin
	case (instruction[8:6])
	3'b000:	// ARO
		begin
			reg1_banked = instruction[5:3];
			reg_wr_banked = instruction[5:3];
			reg2_banked = instruction[2:0];
		end
	3'b001:	// MOV
		begin
			reg1_banked = instruction[5:3];
			reg_wr_banked = instruction[2:0];
			reg2_banked = instruction[2:0];
		end
	3'b010:	// Ld / St
		begin
			reg1_banked = instruction[5:3];
			reg_wr_banked = instruction[2:0];
			reg2_banked = instruction[2:0];
		end
	3'b011:	// SSB
		begin
			immediate[7:5] = 0;
			immediate[4:0] = instruction[4:0];
			reg_full = 4'b1000; // SSB reg
		end
	3'b100:	// Lo / Hi
		begin
			if (instruction[5])	// Lo
				begin
					immediate[4:0] = instruction[4:0];
					reg_full = 4'b0001; // Imm reg
				end
			else						// Hi
				begin
					immediate[7:5] = instruction[2:0];
					reg_full = 4'b0001; // Imm reg
				end
		end
	3'b101:	// Branch
		begin
		if (instruction[5]) // offset
			begin
				// Sign extension done badly
				branch_imm[7:0] = {
					instruction[3],instruction[3],
					instruction[3],instruction[3],
					instruction[3],instruction[2],
					instruction[1],instruction[0]};
			end
		else // direct
			begin
				reg_full = instruction[3:0];
			end
		end
	3'b110:	// Special
		begin
		case (instruction[5:3])
			3'b001:	// SPC
				begin
					reg1_banked = instruction[2:0];
					reg_wr_banked = instruction[2:0];
				end
			3'b100: // INC
				begin
					reg1_banked = instruction[2:0];
					reg_wr_banked = instruction[2:0];
				end
			3'b110:	// Tally
				begin
					reg1_banked = instruction[2:0];
				end
			3'b111: // Tally Count, [2:0] = 000 Halt
				begin
					reg2_banked = instruction[2:0];
					reg_wr_banked = instruction[2:0];
				end
		endcase
		end
	3'b111:	// TBA
	begin
	end
	endcase
end
endmodule