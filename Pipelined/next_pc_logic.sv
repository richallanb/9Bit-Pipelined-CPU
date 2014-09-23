module next_pc_logic(
input clk,
input start,
input [7:0]currentpc,
input [7:0]target,
input taken,
input branch,
output reg [7:0]pc_o
);

reg [7:0] pcnext;
always@(*)
begin
	if (start)
	begin
		if(branch && taken)
			pcnext = target;
		else
			pcnext = currentpc + 1;
	end
	pc_o = pcnext;
end
endmodule