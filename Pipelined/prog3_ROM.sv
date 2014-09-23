module prog3_ROM(
input wire clk,
input [7:0] pc,


output reg [8:0] instr_out
);


reg [8:0] instruction [1:18];


initial begin

instruction[1] = 9'b011001000;//ssb LCmpAA
instruction[2] = 9'b100100000;//lo 128
instruction[3] = 9'b100000100;//hi 128
instruction[4] = 9'b001001010;//mov $I, $t0
instruction[5] = 9'b100000110;//hi 192
instruction[6] = 9'b001001100;//mov $I, $t2 keeps track of end of array
instruction[7] = 9'b110110010;//tally $t0
instruction[8] = 9'b110100010;//inc $t0
instruction[9] = 9'b000010100;//aro $t0, $t2
instruction[10] = 9'b101111101;//obne -3
instruction[11] = 9'b110111101;//count $t3 count is stored internally
instruction[12] = 9'b011010000;//ssb SAddAA
instruction[13] = 9'b100111110;//lo 126
instruction[14] = 9'b100000011;//hi 126
instruction[15] = 9'b010001011;//ldst $I, $t1
instruction[16] = 9'b100111111;//lo 127
instruction[17] = 9'b010001101;//ldst  $I, $t3
instruction[18] = 9'b110111000;//halt
end


always @ (*)
begin
	instr_out = instruction[pc[7:0]];
end
endmodule