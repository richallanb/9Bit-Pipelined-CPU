module instruction_rom (input clk, input [7:0] pc_line, output reg [8:0] instr_out);
reg [8:0] garbage [0:19];
initial begin
garbage[0] = 9'b000000000;
garbage[1] = 9'b000000001;
garbage[2] = 9'b000000010;
garbage[3] = 9'b000000011;
garbage[4] = 9'b000000100;
garbage[5] = 9'b000000101;
garbage[6] = 9'b000000110;
garbage[7] = 9'b000000111;
garbage[8] = 9'b000001000;
garbage[9] = 9'b000001001;
garbage[10] = 9'b000001010;
garbage[11] = 9'b000001011;
garbage[12] = 9'b000001100;
garbage[13] = 9'b000001101;
garbage[14] = 9'b000001110;
garbage[15] = 9'b000001111;
garbage[16] = 9'b000010000;
end

always @ (posedge clk)
begin
	instr_out <= garbage[pc_line[3:0]];
end
endmodule