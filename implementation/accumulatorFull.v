module accumulatorFull(
	//Control Inputs
	input [15:0] PCWrite,
	input [15:0] Branch,
	input [15:0] bneOrbeq,
	input [15:0] PCSrc,
	//Memory control
	input [15:0] MemAddr,
	input [15:0] MemData,
	input [15:0] MemWrite,
	//Wire control
	input [15:0] AccWrite,
	input [15:0] SpWrite,
	//ALU Control
	input [15:0] ALUSrcA,
	input [15:0] ALUSrcB,
	input [15:0] ALUOp,



	//Clock Inputs
	input [15:0] reset,
	input [0:0] CLK,
);

//PC output
wire [15:0] pcvalue;
//Memory	outputs
wire [15:0] MemO;
//Wires outputs
wire [15:0] acco;
wire [15:0] apo;
wire [15:0] mdro;
wire [15:0] seo;
wire [15:0] sel;
wire [15:0] zeo;
//ALU	Outputs
wire [15:0] aluResult;
wire [15:0] aluOut;
wire [15:0] zero;
	


PC pcs(
	.PCWrite(PCWrite),
	.Zero(zero),
	.Branch(Branch),
	.bneOrbeq(bneOrbeq),
	.PCInA(aluResult),
	.ZE(zeo),
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
	.ACC(acco),
	.MemAddr(MemAddr),
	.MemData(MemData),
	.MemWrite(MemWrite),
	.CLK(CLK),
	.reset(reset),
	.Data(MemO)
);


wires_subsystem wiresub(
	.MemData(MemO),
	.ALU(aluResult),
	.reset(reset),
	.CLK(CLK),
	.AccWrite(AccWrite),
	.SpWrite(SpWrite),
	.AccOutput(acco),
	.SpOutPut(spo),
	.MDROutPut(mdro),
	.SE(seo),
	.SELeft(sel),
	.ZE(zeo)
);


alu_sub alus(
	.PC(pcvalue),
	.ACC(acco),
	.SP(spo),
	.MDR(mdro),
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