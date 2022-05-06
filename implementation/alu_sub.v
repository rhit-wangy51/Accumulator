module alu_sub(
	input [15:0] PC,
	input [15:0] ACC,
	input [15:0] SP,
	input [15:0] SE,
	input [15:0] ZE,
	input [15:0] SL1,
	input [2:0] SrcA,
	input [3:0] SrcB,
	input [2:0] ALUOP,
	input [0:0] CLK,
	reg  [15:0] AOut ,
	reg  [15:0] BOut,
	output reg [15:0] Out,
	output reg [0:0] Zero
);

ALUSrcA mux2b16(
	.D(PC),
	.C(ACC),
	.B(SP),
	.OP(SrcA),
	.Out(AOut)
);

ALUSrcB mux3b16(
);

ALUC alu16(
	.A(AOut),
	.B(BOut),
	.OP(ALUOp),
	.CLK(CLK),
	.Zero(Zero),
	.Out(Out)
);


endmodule