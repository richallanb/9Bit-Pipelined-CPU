module mux_weird (input reg[7:0] input0, input reg[7:0] input1, input reg[7:0] input2, input reg[7:0] input3, input wire select_hi, input wire select_lo, output reg[7:0] out);

always @ (*)
begin
		case ({select_hi,select_lo})
		2'b00:	out <= input0;
		2'b01:	out <= input1;
		2'b10:	out <= input2;
		2'b11:	out <= input3;
		endcase
end
endmodule