module prog2_ROM(
input wire clk,
input [7:0] pc,


output reg [8:0] instr_out
);


reg [8:0] instruction [1:17];


initial begin

instruction[1] = 9'b100100000; //set $i lo 0 
instruction[2] = 9'b100000001; // $i hi 32 
instruction[3] = 9'b011000000; //ssb ld,add,bank A, bank A
instruction[4] = 9'b001001010; //mov $I, $t0
instruction[5] = 9'b100100000; // $i lo 96
instruction[6] = 9'b100000011; // $i hi 96
instruction[7] = 9'b001001011; //mov $I, $t1
instruction[8] = 9'b001000111; //mov $0, $t5
instruction[9] = 9'b011011000;//ssb SCmpAA
instruction[10] = 9'b110001010; //SPC $t0
instruction[11] = 9'b110100010; //INC $t0
instruction[12] = 9'b000011010;//cmp $t1, $t0
instruction[13] = 9'b101111101;//obne -3
instruction[14] = 9'b100100101; // $I lo 5
instruction[15] = 9'b100000000; // $I hi 0
instruction[16] = 9'b010001111; //ldst $I, $t5
instruction[17] = 9'b110111000;//halt
end


always @ (*)
begin
	instr_out = instruction[pc[7:0]];
end
endmodule