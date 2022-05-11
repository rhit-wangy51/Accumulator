module mem16(
	input [15:0] Addr,
	input [15:0] In,
	input [0:0] W,
	input [0:0] CLK,
	output reg [15:0] Out
);

reg [15:0] ram [65535:0];

initial begin
    $readmemh("memory.txt", ram);
end

always @ (posedge CLK) begin
	if(W == 1'b1)
		ram[Addr] <= In;
	Out <= ram[Addr];
end

endmodule
