module accumulatorFull(
	input [15:0] memIn,

	//Clock Inputs
	input [0:0] reset,
	input CLK,
	
	output [15:0] Output
	
);

//Control wires
	//PC
wire [15:0] PCWrite;
wire [15:0] Branch;
wire [15:0] bneOrbeq;
wire [15:0] PCSrc;
	//Wire
wire [15:0] ACCSrc;
wire [15:0] AccWrite;
wire [15:0] SpWrite;
	//ALU
wire [15:0] ALUSrcA;
wire [15:0] ALUSrcB;
wire [15:0] ALUOp;


//PC output
wire [15:0] pcvalue;
//Memory	outputs
wire [15:0] IRo;
wire [15:0] MemO;
wire [15:0] memMDRO;
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
	//Input
	.Zero(zero),
	.PCInA(aluResult),
	.ZE(zeo),
	.PCInC(aluOut),
	//Control
	.PCWrite(PCWrite),
	.Branch(Branch),
	.bneOrbeq(bneOrbeq),
	.PCSrc(PCSrc),
	//Clock
	.CLK(CLK),
	.reset(reset),
	//Output
	.PCOut(pcvalue)
);

AccMemory memsub(
	//Sytem Input
	.IOIn(memIn)
	//Wire Input
	.PC(pcvalue),
	.ACC(acco),
	.IR(sel),
	.ALUOut(aluOut),
	//Clock
	.CLK(CLK),
	.reset(reset),
	
	//Control Outputs
		//PC
	.PCWrite(PCWrite),
	.Branch(Branch),
	.BneOrBeq(bneOrbeq),
	.PCSrc(PCSrc),
		//Wire
	.ACCSrc(AccSrc),
	.ACCWrite(AccWrite),
	.SPWrite(SpWrite),
		//ALU
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUArcB),
	.ALUOp(ALUOp),
	
	//Wire Output
	.IRROut(IRo),
	.Data(MemO),
	.MDROut(memMDRO),
	
	//System Output
	.IOOut(Output)
);


wires_subsystem wiresub(
	//Input
	.IR(IRo)
	.MemData(MemO),
	.MDR(memMDRO)
	.ALU(aluResult),
	//Clock
	.reset(reset),
	.CLK(CLK),
	//Control
	.AccSrc(ACCSrc),
	.AccWrite(AccWrite),
	.SpWrite(SpWrite),
	//Output
	.AccOutput(acco),
	.SpOutPut(spo),
	.MDROutPut(mdro),
	.SE(seo),
	.SELeft(sel),
	.ZE(zeo)
);


alu_sub alus(
	//Input
	.PC(pcvalue),
	.ACC(acco),
	.SP(spo),
	.MDR(mdro),
	.SE(seo),
	.ZE(zeo),
	.SL1(sel),
	//Control
	.SrcA(ALUSrcA),
	.SrcB(ALUSrcB),
	.ALUOP(ALUOp),
	//Clock
	.CLK(CLK),
	//Output
	.Out(aluResult),
	.aluOut(aluOut),
	.Zero(zero)
);


endmodule