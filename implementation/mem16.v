module mem16(
	input [15:0] Addr,
	input [15:0] In,
	input [0:0] W,
	input [0:0] R,
	input [0:0] CLK,
	output reg [15:0] Out
);

reg [15:0] mem [65535:0];

always @ (posedge CLK) begin
	if(W == 1'b1)
		mem[Addr] <= In;
end

always @ (negedge CLK) begin
	if(R == 1'b1)
		Out <= mem[Addr];
end

endmodule
