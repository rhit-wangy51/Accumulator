module PC(
	input [0:0] PCWrite,
	input [0:0] Zero,
	input [0:0] Branch,
	input [0:0] bneOrbeq,
	input [15:0] PCInA,
	input [10:0] IRIn,
	input [15:0] PCInC,
	input [15:0] PCInD,
	input	[1:0]	PCSrc,
	input [0:0] CLK,
	input [0:0] reset,
	output [15:0] PCOut
);

wire [15:0] mux16_out;
wire [0:0] mux1_out;
wire [15:0] PCInB;
wire [15:0] ZE;


ze5 ze5_inst
(
	.In(IRIn) ,	// input [10:0] In_sig
	.Out(ZE) 	// output [15:0] Out_sig
);

shift_left zel(
	.in(ZE),
	.out(PCInB)
);


mux2b16 src_mux(
	.A(PCInA),
	.B(PCInB),
	.C(PCInC),
	.D(PCInD),
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
	.Out(PCOut),
	.Preset(0)
);


endmodule
