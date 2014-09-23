module muxq (input reg[7:0] input1, input reg[7:0] input2, input wire select, output reg[7:0] out);

always @ (*)
begin
		if (select)
			out <= input2;
		else
			out <= input1;
end
endmodule
