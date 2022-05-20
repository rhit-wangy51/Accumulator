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
	output [15:0] Out,
	output [15:0] aluOut,
	output [0:0] Zero
	
);

	wire [15:0] AOut;
	wire [15:0] BOut;

mux2b16 ALUSrcA(
	.A(PC),
	.B(ACC),
	.C(SP),
	.OP(SrcA),
	.Out(AOut)
);

mux3b16 ALUSrcB(
	.a('b10),
	.b(SE),
	.c(MDR),
	.d(ZE),
	.e(SL1),
	.sel(SrcB),
	.out(BOut)
);

alu16 ALUC(
	.A(AOut),
	.B(BOut),
	.OP(ALUOP),
	.Zero(Zero),
	.Out(Out)
);

reg16 ALUOut(
	.In(Out),
	.E(1'b0),
	.reset(1'b0),
	.CLK(CLK),
	.Out(aluOut)
);


endmodule