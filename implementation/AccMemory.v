module connected_control_memory(
	input CLK,
	input [15:0] PC,
	input [15:0] ACC,
	input [15:0] IR,
	input [15:0] ALUOut,
	
	Input [0:0] Reset,
	input [15:0] IOIn,
	
	
	output [1:0] PCSrc,
	output [0:0] SPWrite,
	output [2:0] ACCSrc,
	output [0:0] ACCWrite,
	output [1:0] ALUSrcA,
	output [2:0] ALUSrcB,
	output [1:0] Zero,
	output [1:0] ALUOp,
	output [1:0] BneOrBeq,
	output [1:0] PCWrite,
	output [1:0] Branch
	
	output [15:0] IRROut,
	output [15:0] MDROut,
	output [15:0] IOOut
);


wire [15:0] memout;
wire [1:0] MemAddr,
wire [0:0] MemData,
wire [0:0] MemWrite,
wire [0:0] IRWrite,


parameter RA = 16'h07fe;


control control_inst
(
	.Opcode(Opcode_sig) ,	// input [5:0] Opcode_sig
	.CLK(CLK_sig) ,	// input  CLK_sig
	.Reset(Reset_sig) ,	// input  Reset_sig
	.PCSrc(PCSrc_sig) ,	// output [1:0] PCSrc_sig
	.MemAddr(MemAddr_sig) ,	// output [1:0] MemAddr_sig
	.MemData(MemData_sig) ,	// output [0:0] MemData_sig
	.MemWrite(MemWrite_sig) ,	// output [0:0] MemWrite_sig
	.SPWrite(SPWrite_sig) ,	// output [0:0] SPWrite_sig
	.ACCSrc(ACCSrc_sig) ,	// output [2:0] ACCSrc_sig
	.ACCWrite(ACCWrite_sig) ,	// output [0:0] ACCWrite_sig
	.ALUSrcA(ALUSrcA_sig) ,	// output [1:0] ALUSrcA_sig
	.ALUSrcB(ALUSrcB_sig) ,	// output [2:0] ALUSrcB_sig
	.Zero(Zero_sig) ,	// output [1:0] Zero_sig
	.ALUOp(ALUOp_sig) ,	// output [1:0] ALUOp_sig
	.BneOrBeq(BneOrBeq_sig) ,	// output [1:0] BneOrBeq_sig
	.PCWrite(PCWrite_sig) ,	// output [1:0] PCWrite_sig
	.Branch(Branch_sig) 	// output [1:0] Branch_sig
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

memory memory_inst
(
	.data(data_sig) ,	// input [DATA_WIDTH-1:0] data_sig
	.addr(addr_sig) ,	// input [ADDR_WIDTH-1:0] addr_sig
	.we(we_sig) ,	// input  we_sig
	.clk(clk_sig) ,	// input  clk_sig
	.q(q_sig) 	// output [DATA_WIDTH-1:0] q_sig
);

defparam memory_inst.DATA_WIDTH = 16;
defparam memory_inst.ADDR_WIDTH = 10;

always begin

end

endmodule
