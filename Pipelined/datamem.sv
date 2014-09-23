// Quartus II Verilog Template
// Single port RAM with single read/write address and initial contents 
// specified with an initial block

module single_port_ram_with_init
#(parameter ADDR_WIDTH=8)
(
	input [7:0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input writemem, readmem, clk,
	output [7:0] q
);

	// Declare the RAM variable
	reg [7:0] ram[2**ADDR_WIDTH-1:0];

	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

	initial 
	begin
		ram[1] = 8'd93;
		ram[2] = 8'd157;
		ram[32] = 8'h12;
		ram[33] = 8'h56;
		ram[34] = 8'h9a;
		ram[35] = 8'hde;
		ram[36] = 8'hff;
		ram[37] = 8'hf0;
		ram[38] = 8'h13;	
		ram[39] = 8'h24;	
		ram[40] = 8'h78;	
		ram[41] = 8'h23;	
		ram[42] = 8'hbe;	
		ram[43] = 8'hde;	
		ram[44] = 8'hef;	
		ram[45] = 8'hfe;	
		ram[46] = 8'h0f;	
		ram[47] = 8'hf0;
		ram[48] = 8'hb0;
		ram[49] = 8'h34;
		ram[50] = 8'h78;
		ram[51] = 8'hbc;
		ram[52] = 8'h03;
		ram[53] = 8'hcf;
		ram[54] = 8'h8b;	
		ram[55] = 8'h47;	
		ram[56] = 8'h05;	
		ram[57] = 8'h16;	
		ram[58] = 8'h27;	
		ram[59] = 8'h38;	
		ram[60] = 8'h34;	
		ram[61] = 8'h36;	
		ram[62] = 8'h38;	
		ram[63] = 8'haa;
		ram[64] = 8'h56;
		ram[65] = 8'h9a;
		ram[66] = 8'hde;
		ram[67] = 8'hff;
		ram[68] = 8'hf0;
		ram[69] = 8'h13;	
		ram[70] = 8'h24;	
		ram[71] = 8'h78;	
		ram[72] = 8'h23;	
		ram[73] = 8'hbe;	
		ram[74] = 8'hde;	
		ram[75] = 8'hbe;	
		ram[76] = 8'hfe;	
		ram[77] = 8'hfa;	
		ram[78] = 8'hf0;
		ram[79] = 8'hb0;
		ram[80] = 8'h34;
		ram[81] = 8'h78;
		ram[82] = 8'hbc;
		ram[83] = 8'h03;
		ram[84] = 8'hcf;
		ram[85] = 8'h8b;	
		ram[86] = 8'h47;	
		ram[87] = 8'h05;	
		ram[88] = 8'h16;	
		ram[89] = 8'h27;	
		ram[90] = 8'h38;	
		ram[91] = 8'h34;	
		ram[92] = 8'h36;	
		ram[93] = 8'h38;	
		ram[94] = 8'haa;
		ram[95] = 8'h47;
		ram[128] = 8'd2;
		ram[129] = 8'd0;
		ram[130] = 8'd33;
		ram[131] = 8'd63;
		ram[132] = 8'd18;
		ram[133] = 8'd23;		
		ram[134] = 8'd52;
		ram[135] = 8'd28;
		ram[136] = 8'd9;
		ram[137] = 8'd8;
		ram[138] = 8'd6;
		ram[139] = 8'd5;
		ram[140] = 8'd4;
		ram[141] = 8'd3;
		ram[142] = 8'd2;
		ram[143] = 8'd1;		
		ram[144] = 8'd0;
		ram[145] = 8'd42;
		ram[146] = 8'd45;
		ram[147] = 8'd47;
		ram[148] = 8'd62;
		ram[149] = 8'd63;
		ram[150] = 8'd5;
		ram[151] = 8'd5;
		ram[152] = 8'd5;
		ram[153] = 8'd6;		
		ram[154] = 8'd6;
		ram[155] = 8'd42;
		ram[156] = 8'd22;
		ram[157] = 8'd33;
		ram[158] = 8'd11;
		ram[159] = 8'd55;
		ram[160] = 8'd44;
		ram[161] = 8'd19;
		ram[162] = 8'd20;
		ram[163] = 8'd21;		
		ram[164] = 8'd43;
		ram[165] = 8'd41;
		ram[166] = 8'd42;
		ram[167] = 8'd0;
		ram[168] = 8'd23;
		ram[169] = 8'd46;
		ram[170] = 8'd5;
		ram[171] = 8'd28;
		ram[172] = 8'd51;
		ram[173] = 8'd10;		
		ram[174] = 8'd33;
		ram[175] = 8'd56;
		ram[176] = 8'd15;
		ram[177] = 8'd38;
		ram[178] = 8'd61;
		ram[179] = 8'd20;
		ram[180] = 8'd63;
		ram[181] = 8'd62;
		ram[182] = 8'd61;
		ram[183] = 8'd60;		
		ram[184] = 8'd11;
		ram[185] = 8'd23;
		ram[186] = 8'd7;
		ram[187] = 8'd13;
		ram[188] = 8'd21;
		ram[189] = 8'd5;
		ram[190] = 8'd44;
		ram[191] = 8'd33;
	
	
	end 

	always @ (posedge clk)
	begin
		// Write
		if (writemem)
			ram[addr] <= data;
	end

	  
	
	

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = (readmem)? ram[addr] : 8'bxxxxxxxx;

endmodule

