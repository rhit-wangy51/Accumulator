module accumulatorFull(
	input [15:0] IOIn,

	//Clock Inputs
	input [0:0] reset,
	input CLK,
	
	output [15:0] Output
	
);

//Control wires
	//PC
wire [1:0] PCWrite;
wire [1:0] Branch;
wire [1:0] bneOrbeq;
wire [1:0] PCSrc;
	//Wire
wire [2:0] ACCSrc;
wire [0:0] AccWrite;
wire [0:0] SpWrite;
	//ALU
wire [1:0] ALUSrcA;
wire [2:0] ALUSrcB;
wire [2:0] ALUOp;


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
	.IOIn(IOIn),
	//Wire Input
	.PC(pcvalue),
	.ACC(acco),
	.IR(sel),
	.ALUOut(aluOut),
	//Clock
	.CLK(CLK),
	.Reset(reset),
	
	//Control Outputs
		//PC
	.PCWrite(PCWrite),
	.Branch(Branch),
	.BneOrBeq(bneOrbeq),
	.PCSrc(PCSrc),
		//Wire
	.ACCSrc(ACCSrc),
	.ACCWrite(AccWrite),
	.SPWrite(SpWrite),
		//ALU
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	.ALUOp(ALUOp),
	
	//Wire Output
	.IRROut(IRo),
	.MemOut(MemO),
	.MDROut(memMDRO),
	
	//System Output
	.IOOut(Output)
);


wires_subsystem wiresub(
	//Input
	.IR(IRo),
	.MemData(MemO),
	.MDR(memMDRO),
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
	.SpOutput(spo),
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