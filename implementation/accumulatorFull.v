module accumulatorFull
	//Control Inputs
	input [0:0] CLK
);

PC pcs(
	.PCWrite(),
	.Zero(zero),
	.Branch(),
	.bneOrbeq(),
	.PCInA(aluResult),
	.PCInB(),
	.PCInC(aluOut),
	.PCSrc(),
	.CLK(CLK),
	.reset(),
	.PCOut(pcvalue)
);

//MemorySubsystem


wires_subsystem wiresub(
	.IR(),
	.MemData(),
	.ALU(aluResult),
	.reset(),
	.CLK(CLK),
	.MDR(),
	.AccWrite(),
	.SpWrite(),
	.AccOutput(acco),
	.SpOutPut(spo),
	.SE(seo),
	.SELeft(sel),
	.ZE(zeo)
);


alu_sub alus(
	.PC(pcvalue),
	.ACC(acco),
	.SP(spo),
	.MDR(),
	.SE(seo),
	.ZE(zeo),
	.SL1(sel),
	.SrcA(),
	.SrcB(),
	.ALUOP(),
	.CLK(CLK),
	.Out(aluResult),
	.aluOut(aluOut),
	.Zero(zero)
);


endmodule