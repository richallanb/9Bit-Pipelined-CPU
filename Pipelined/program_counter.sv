module program_counter
(
	input [7:0] newpc_i,
	input clock,
	input wenable_i,
	input reset_i,
	output [7:0] pc_o,
	output reg [15:0] dynamic_o
);

reg [7:0] pc=1, pcnext=1;
reg [15:0] dynamic_count = 1;

assign pc_o = pc;

always_comb
	begin
	if (reset_i) begin
		pcnext = 0;
	end else if (wenable_i)
		pcnext = newpc_i;
	else
		pcnext = pc;
	end
always @(posedge clock)
begin
	pc = pcnext;
	dynamic_count = dynamic_count + 1;
	dynamic_o <= dynamic_count;
end
endmodule