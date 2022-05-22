module AccMemory(
	input CLK,
	input [15:0] PC,
	input [15:0] ACC,
	input [15:0] IR,
	input [15:0] ALUOut,
	
	input [0:0] Reset,
	input [15:0] IOIn,
	
	
	output [1:0] PCSrc,
	output [0:0] SPWrite,
	output [2:0] ACCSrc,
	output [0:0] ACCWrite,
	output [1:0] ALUSrcA,
	output [2:0] ALUSrcB,
	output [2:0] ALUOp,
	output [1:0] BneOrBeq,
	output [1:0] PCWrite,
	output [1:0] Branch,
	
	output [15:0] IROut,//used to be IRROut, crashes when we link it
	output [15:0] MDROut,
	output [15:0] IOOut,
	output [15:0] MemOut
);


wire [15:0] memin;
wire [15:0] MDR;
wire [15:0] addr;
wire [1:0] MemAddr;
wire [0:0] MemData;
wire [0:0] MemWrite;
wire [0:0] IRWrite;
wire [0:0] IsIO;


parameter RA = 16'h07fe;


control control_inst
(
	.Opcode(IROut[15:11]) ,	// input [4:0] Opcode_sig
	.CLK(CLK) ,	// input  CLK_sig
	.Reset(Reset) ,	// input  Reset_sig
	.PCSrc(PCSrc) ,	// output [1:0] PCSrc_sig
	.MemAddr(MemAddr) ,	// output [1:0] MemAddr_sig
	.MemData(MemData) ,	// output [0:0] MemData_sig
	.MemWrite(MemWrite) ,	// output [0:0] MemWrite_sig
	.SPWrite(SPWrite) ,	// output [0:0] SPWrite_sig
	.ACCSrc(ACCSrc) ,	// output [2:0] ACCSrc_sig
	.ACCWrite(ACCWrite) ,	// output [0:0] ACCWrite_sig
	.ALUSrcA(ALUSrcA) ,	// output [1:0] ALUSrcA_sig
	.ALUSrcB(ALUSrcB) ,	// output [2:0] ALUSrcB_sig
	.ALUOp(ALUOp) ,	// output [2:0] ALUOp_sig
	.BneOrBeq(BneOrBeq) ,	// output [1:0] BneOrBeq_sig
	.PCWrite(PCWrite) ,	// output [1:0] PCWrite_sig
	.Branch(Branch) ,	// output [1:0] Branch_sig
	.IRWrite(IRWrite) 	// output [0:0] IRWrite_sig
);

defparam control_inst.Fetch = 0;
defparam control_inst.Decode = 1;
defparam control_inst.Load = 2;
defparam control_inst.Addi = 3;
defparam control_inst.Save = 4;
defparam control_inst.Loadi = 5;
defparam control_inst.Jal = 6;
defparam control_inst.Ori = 7;
defparam control_inst.And = 8;
defparam control_inst.Slt = 9;
defparam control_inst.SwOrLw = 10;
defparam control_inst.Lw = 11;
defparam control_inst.Sw = 12;
defparam control_inst.Or = 13;
defparam control_inst.Beq = 14;
defparam control_inst.Sub = 15;
defparam control_inst.Bne = 16;
defparam control_inst.Jump = 17;
defparam control_inst.Ms = 18;
defparam control_inst.Add = 19;
defparam control_inst.Slti = 20;
defparam control_inst.Loadui = 21;

mux2b16 mux2b16_inst
(
	.A(PC) ,	// input [15:0] A_sig
	.B(IR) ,	// input [15:0] B_sig
	.C(16'hfffe) ,	// input [15:0] C_sig
	.D(ALUOut) ,	// input [15:0] D_sig
	.OP(MemAddr) ,	// input [1:0] OP_sig
	.Out(addr) 	// output [15:0] Out_sig
);

mux1b16 mux1b16_inst
(
	.A(ACC) ,	// input [0:0] A_sig
	.B(PC) ,	// input [0:0] B_sig
	.OP(MemData) ,	// input [0:0] OP_sig
	.Out(memin) 	// output [0:0] Out_sig
);

memory memory_inst
(
	.data(memin) ,	// input [DATA_WIDTH-1:0] data_sig
	.addr(addr) ,	// input [ADDR_WIDTH-1:0] addr_sig
	.we(MemWrite) ,	// input  we_sig
	.CLK(CLK) ,	// input  clk_sig
	.q(MemOut) ,	// output [DATA_WIDTH-1:0] q_sig
	.IsIO(IsIO)
);

reg16 IR_inst
(
	.In(MemOut) ,	// input [15:0] In_sig
	.E(IRWrite) ,	// input [0:0] E_sig
	.reset(Reset) ,	// input [0:0] reset_sig
	.CLK(CLK) ,	// input [0:0] CLK_sig
	.Out(IROut) , 	// output [15:0] Out_sig
	.Preset(0)
);

reg16 MDR_inst
(
	.In(MemOut) ,	// input [15:0] In_sig
	.E(1) ,	// input [0:0] E_sig
	.reset(Reset) ,	// input [0:0] reset_sig
	.CLK(CLK) ,	// input [0:0] CLK_sig
	.Out(MDR) , // output [15:0] Out_sig
	.Preset(0)
);

reg16 IO_inst
(
	.In(memin) ,	// input [15:0] In_sig
	.E(MemWrite & IsIO) ,	// input [0:0] E_sig
	.reset(Reset) ,	// input [0:0] reset_sig
	.CLK(CLK) ,	// input [0:0] CLK_sig
	.Out(IOOut) , 	// output [15:0] Out_sig
	.Preset(0)
);

mux1b16 mux1b16_MDROut
(
	.A(MDR) ,	// input [15:0] A_sig
	.B(IOIn) ,	// input [15:0] B_sig
	.OP(IsIO) ,	// input [0:0] OP_sig
	.Out(MDROut) 	// output [15:0] Out_sig
);


defparam memory_inst.DATA_WIDTH = 16;
defparam memory_inst.ADDR_WIDTH = 10;

endmodule
