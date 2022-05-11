module alu_sub(
	input [15:0] PC,
	input [15:0] ACC,
	input [15:0] SP,
	input [15:0] MDR,
	input [15:0] SE,
	input [15:0] ZE,
	input [15:0] SL1,
	input [2:0] SrcA,
	input [3:0] SrcB,
	input [2:0] ALUOP,
	input [0:0] CLK,
	output reg [15:0] Out,
	output reg [0:0] Zero
);

ALUSrcA mux2b16(
	.A(PC),
	.B(ACC),
	.C(SP),
	.OP(SrcA),
	.Out(AOut)
);

ALUSrcB CSSE_Project_3_Bit_Mux(
	.a(2'b10),
	.b(SE),
	.c(MDR),
	.d(ZE),
	.e(SL1),
	.sel(SrcB),
	.out(BOut)
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