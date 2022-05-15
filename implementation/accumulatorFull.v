module accumulatorFull
	//Control Inputs
	input [15:0] PCWrite,
	input [15:0] Branch,
	input [15:0] bneOrbeq,
	input [15:0] PCSrc,
	
	input [15:0] MemAddr,
	input [15:0] MemData,
	input [15:0] MemWrite,
	
	input [15:0] AccWrite,
	input [15:0] SpWrite,
	
	input [15:0] ALUSrcA,
	input [15:0] ALUSrcB,
	input [15:0] ALUOp,



	//Clock Inputs
	input [15:0] reset,
	input [0:0] CLK,
	
	
	wire [15:0] pcvalue,
	
	wire [15:0] MemO,
	
	wire [15:0] acco,
	wire [15:0] apo,
	wire [15:0] seo,
	wire [15:0] sel,
	wire [15:0] zeo,
	
	wire [15:0] aluResult,
	wire [15:0] aluOut,
	wire [15:0] zero,
);

PC pcs(
	.PCWrite(PCWrite),
	.Zero(zero),
	.Branch(Branch),
	.bneOrbeq(bneOrbeq),
	.PCInA(aluResult),
	.PCInB(),
	.PCInC(aluOut),
	.PCSrc(PCSrc),
	.CLK(CLK),
	.reset(reset),
	.PCOut(pcvalue)
);

Memory memsub(
	.PC(pcvalue),
	.SELeft(sel),
	.ALUOut(aluOut),
	.MemAddr(MemAddr),
	.MemWrite(MemWrite),
	.CLK(CLK),
	.reset(reset),
	.Data(MemO)
);


wires_subsystem wiresub(
	.IR(IRO),
	.MemData(MemO),
	.ALU(aluResult),
	.reset(reset),
	.CLK(CLK),
	.MDR(),
	.AccWrite(AccWrite),
	.SpWrite(SpWrite),
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
	.SrcA(ALUSrcA),
	.SrcB(ALUSrcB),
	.ALUOP(ALUOp),
	.CLK(CLK),
	.Out(aluResult),
	.aluOut(aluOut),
	.Zero(zero)
);


endmodule