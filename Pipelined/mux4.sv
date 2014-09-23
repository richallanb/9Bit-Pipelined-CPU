module mux4 (input wire[7:0] input1, input wire[7:0] input2, input wire[7:0] input3, input wire[7:0] input4, input wire [1:0]select, output reg [7:0] out);

always @ (*)
begin
		case (select)
		2'b00:	out = input1;
		2'b01:	out = input2;
		2'b10:	out = input3;
		2'b11:	out = input4;
		endcase
end
endmodule