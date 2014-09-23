module alu(
input  [1:0] aro,
input  special_op,
input  [2:0] special_func,
input [7:0] reg1 ,
input [7:0] reg2 ,
input [7:0] reg3 ,
input [7:0] reg4 ,
input  ALUon,
input 	branch,

output reg [7:0] result,
output reg [3:0] NZCV);
reg [8:0] temp = 0;
reg [7:0] temp2=0;
initial begin
	NZCV <= 0;
end



always @ (*)
begin
if (ALUon)
begin
	if (~special_op&~branch)
		begin
		case(aro[1:0])
			2'b00: begin // add
						result <= reg1 + reg2;
					 end
			2'b01: begin // sub
						result <= reg1 - reg2;
					 end
			2'b10: begin // cmp
						/* Tell register file not to save. */
						temp <=  reg1[7:0]-reg2[7:0];
						
						NZCV[3] <= temp[8];
						if (temp == 0)
							NZCV[2] <= 1'b1;
						else
							NZCV[2] <= 1'b0;
					 end
			2'b11: begin // slt
						temp <= reg1[7:0]-reg2[7:0];
						result[7:1]= 7'd0;
						result[0] <= temp[8];
					 end
		endcase
	end
	else if(special_op&~branch)
	begin
		result <= 0;
		case (special_func)
			3'b000:	begin
							// MFL
							temp2[7:0] <= (reg3[7:0] >> reg4[7:0]);
							temp[8:0] <= reg1[7:0] + ((reg2[7:0] << reg4[7:0]) & {8{temp2[0]}});
							
							NZCV[0] <= temp[8];
							NZCV[1] <= temp[8];
							result <= temp[7:0];
						end
			3'b001:		// SPC
						begin
							result <= reg2 + (reg1[0]&reg1[1]&reg1[2]&reg1[3] | 
													reg1[1]&reg1[2]&reg1[3]&reg1[4] | 
													reg1[2]&reg1[3]&reg1[4]&reg1[5] | 
													reg1[3]&reg1[4]&reg1[5]&reg1[6] | 
													reg1[4]&reg1[5]&reg1[6]&reg1[7]);
						end
			3'b010:	begin
							// MFH
							temp2 <= (reg3[7:0] >> reg4[7:0]);
							result[7:0] <= reg1 + (reg2[7:0] >> (8'd8- reg4[7:0]) & {8{temp2[0]}}) + NZCV[0];
						end
			3'b011: 	begin 
							// ISC
							result <= reg1 + 8'd1;
							
							NZCV[2] <= ((reg2 >> reg1) == 0);
						end
			3'b100:	begin // INC
							result <= reg1 + 8'd1;
						end
			3'b101:	begin // SM
							result <= reg1 << 1;
						end
			3'b110:	begin // Tally -- Moved to register file
							result <= reg1;
							
						end
				
		endcase
	end
	else if(~special_op&branch) // If we have a branch ALU request
	begin
		result <= reg1 + reg2; // We always add. The offset will be signed.
	end
end
end


endmodule