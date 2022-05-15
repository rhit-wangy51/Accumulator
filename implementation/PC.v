module PC(
	input [0:0] PCWrite,
	input [0:0] Zero,
	input [0:0] Branch,
	input [0:0] bneOrbeq,
	input [15:0] PCInA,
	input [15:0] ZE,
	input [15:0] PCInC,
	input	[1:0]	PCSrc,
	input [0:0] CLK,
	input [0:0] reset,
	output [15:0] PCOut
);

wire [15:0] mux16_out;
wire [0:0] mux1_out;
wire [15:0] PCInB

shift_left(
	.in(ZE),
	.out(PCInB)
);

mux2b16 src_mux(
	.A(PCInA),
	.B(PCInB),
	.C(PCInC),
	.D(16'h0000),
	.OP(PCSrc),
	.Out(mux16_out)
);

mux1b1 bnebeq_mux(
	.A(~Zero),
	.B(Zero),
	.OP(bneOrbeq),
	.Out(mux1_out)
);

reg16 pc_reg (
	.In(mux16_out),
	.E((mux1_out & Branch) | PCWrite),
	.reset(reset),
	.CLK(CLK),
	.Out(PCOut)
);


endmodule
