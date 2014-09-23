module prog1_ROM(
input wire clk,
input [7:0] pc,


output reg [8:0] instr_out
);


reg [8:0] instruction [1:30];


initial begin
instruction[1] = 9'b011000000; //ssb LAddAA
instruction[2] = 9'b100000000; //hi 0
instruction[3] = 9'b100100001;//lo 1
instruction[4] = 9'b010001111;//ld $i (mem[1]) to reg $t5
instruction[5] = 9'b100100010;//lo 2
instruction[6] = 9'b010001110;//ld $i (mem[2]) to reg $t4

instruction[7] = 9'b011000001; //ssb LAddAB
instruction[8] = 9'b001000101; //mov $0 $s4
instruction[9] = 9'b001000110; //mov $0, $s5
instruction[10] = 9'b001000111;//mov $0, $s6
// If one of the numbers is smaller, we swap them in hopes
// of a faster termination to our loop
instruction[11] = 9'b011001100;//ssb LSltAA
instruction[12] = 9'b001111011;//mov $t5 $t1
instruction[13] = 9'b000011110;//slt $t1 $t4
instruction[14] = 9'b011001000;//ssb LCmpAA
instruction[15] = 9'b000011000;//cmp $t1, $0
instruction[16] = 9'b101100100;//obe 4 

instruction[17] = 9'b001110101;//mov $t4 $t3 
instruction[18] = 9'b001111110;//mov $t5 $t4
instruction[19] = 9'b001101111;//mov $t3 $t5 

instruction[20] = 9'b110000000;//mfl
instruction[21] = 9'b110010000;//mfh 
instruction[22] = 9'b110011000;//isc 
instruction[23] = 9'b101111101;//obne -3
instruction[24] = 9'b011010001; //ssb SAddAB
instruction[25] = 9'b100100011;//lo 3
instruction[26] = 9'b010001101;//st $I, $s4
instruction[27] = 9'b100100100;//lo 4
instruction[28] = 9'b010001110;//st $I, $s5
instruction[29] = 9'b110111000; //halt
end


always @ (*)
begin
	instr_out = instruction[pc[7:0]];
end
endmodule