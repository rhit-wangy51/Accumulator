module alu_sub(
	input [15:0] PC,
	input [15:0] ACC,
	input [15:0] SP,
	input [15:0] MDR,
	input [15:0] SE,
	input [15:0] ZE,
	input [2:0] IR,
	input [1:0] SrcA,
	input [2:0] SrcB,
	input [2:0] ALUOP,
	input [0:0] Reset,
	input [0:0] CLK,
	output [15:0] Out,
	output [15:0] aluOut,
	output [0:0] Zero
	
);

	wire [15:0] AOut;
	wire [15:0] BOut;
	wire [15:0] SL1;
	wire [15:0] SEIR;
	
se13 se13_inst
(
	.In(IR) ,
	.Out(SEIR)
);

shift_left zel(
	.in(SEIR),
	.out(SL1)
);


mux2b16 ALUSrcA(
	.A(PC),
	.B(ACC),
	.C(SP),
	.OP(SrcA),
	.Out(AOut)
);

mux3b16 ALUSrcB(
	.a(16'h0002),
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
	.E(1'b1),
	.reset(Reset),
	.CLK(CLK),
	.Out(aluOut)
);


endmodule