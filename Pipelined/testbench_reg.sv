module testbench_reg();
reg clk;
reg [7:0] data_out;
reg [2:0] r1_addr;
reg [2:0] r2_addr;
reg write;
reg spec_op;
reg [2:0] spec_fun;
reg full_addr;
reg [3:0] full_reg_src;
wire [7:0] d1;
wire [7:0] d2;
wire [7:0] d3;
wire [7:0] d4;
wire [1:0] aro;
wire ldst;

initial begin
clk=1;
spec_op=0;
spec_fun=0;
full_addr=0;
#10 write=1; r1_addr=3'b001; data_out=2; // Setting register on bank a to 2
#10 write=0; r1_addr =3'b000; r2_addr=3'b001; // Seeing if $0 gives 0 and that 2 was saved.
#10 write= 1; full_addr=1; full_reg_src=4'b1000; data_out=8'b10000010; // setting ssb reg
#10 write=0; r1_addr =3'b000; r2_addr=3'b001; // we shouldn't see 2.
#10 full_addr=0; write=1; r1_addr=3'b001; data_out=25; // testing register bank file.
#10 write=0; r1_addr =3'b001; r2_addr=3'b000; // we should get the 25 & ssb
#10 write= 1; full_addr=1; full_reg_src=4'b1000; data_out=8'b10011000; // setting ssb reg (notice change in ldst and aro)
#10 write=0; r1_addr =3'b001; r2_addr=3'b000; // we should get the ssb from a full_addr read
#10 full_addr=0; write=0; r1_addr =3'b001; r2_addr=3'b000; // we should get the 2 & 0
#10 write=0; full_addr=1; full_reg_src=4'b1001; // we should get 25 from a full address read
#10 write= 1; full_addr=1; full_reg_src=4'b0111; data_out=1; // $t5
#10 write= 1; full_addr=1; full_reg_src=4'b0110; data_out=2; // $t4
#10 write= 1; full_addr=1; full_reg_src=4'b1111; data_out=3; // $s6
#10 write= 1; full_addr=1; full_reg_src=4'b1110; data_out=4; // $s5
#10 write= 1; full_addr=1; full_reg_src=4'b1101; data_out=5; // $s4
#10 write=0; full_addr=0; spec_op =1; spec_fun=3'b000; // d1 = 4, d2= 1, d3 = 2, d4=3 MFL
#10 write=0; full_addr=0; spec_op =1; spec_fun=3'b001; // d1=1 SPC
#10 write=0; full_addr=0; spec_op =1; spec_fun=3'b010; // d1 = 5, d2 = 1, d3 = 2, d4 = 3 MFH
#10 write=0; full_addr=0; spec_op =1; spec_fun=3'b011; // d1 = 3, d2 = 1 ISC
#10 write=0; full_addr=0; spec_op =1; spec_fun=3'b101; // d1 = 1 SM
#10 write=1; full_addr=0; spec_op =1; spec_fun=3'b000; data_out=12;
#10 write=0; full_addr=1; spec_op =0; full_reg_src=4'b1110; // we should get 12 from a full address read
#10 write=1; full_addr=0; spec_op =1; spec_fun=3'b001; data_out=22;
#10 write=0; full_addr=1; spec_op =0; full_reg_src=4'b0111; // we should get 22 from a full address read
#10 write=1; full_addr=0; spec_op =1; spec_fun=3'b010; data_out=9;
#10 write=0; full_addr=1; spec_op =0; full_reg_src=4'b1101; // we should get 9 from a full address read
#10 write=1; full_addr=0; spec_op =1; spec_fun=3'b011; data_out=64;
#10 write=0; full_addr=1; spec_op =0; full_reg_src=4'b1111; // we should get 64 from a full address read
#10 write=1; full_addr=0; spec_op =1; spec_fun=3'b101; data_out=8;
#10 write=0; full_addr=1; spec_op =0; full_reg_src=4'b0111; // we should get 8 from a full address read


end

always begin
#5 clk = ~clk; // Toggle clock every 5 ticks
// this makes the clock cycle 10 ticks
end

register_file reg_inst(.CLK(clk),
.write_reg(write),
.reg_src1(r1_addr),
.reg_src2(r2_addr),
.data_in(data_out),
.special_op(spec_op),
.special_func(spec_fun),
.full_addr(full_addr),
.full_reg_src(full_reg_src),
.data1(d1),
.data2(d2),
.data3(d3),
.data4(d4),
.aro(aro),
.ldst(ldst));
endmodule