module connected_control_memory(
	input clk,
	input [9:0] PC,
	input [15:0] datain,
	
	output   ALUSrc,
   output   MemtoReg,
   output   RegDst,
   output   RegWrite,
   output   MemRead,
   output   MemWrite,
   output   Branch
);

reg reset;
wire [15:0] memout;

memory mem
(
	.data(datain) ,	// input [DATA_WIDTH-1:0] data_sig
	.addr(PC) ,	// input [ADDR_WIDTH-1:0] addr_sig
	.we(MemWrite) ,	// input  we_sig
	.clk(clk) ,	// input  clk_sig
	.q(memout) 	// output [DATA_WIDTH-1:0] q_sig
);

defparam mem.DATA_WIDTH = 16;
defparam mem.ADDR_WIDTH = 10;



MIPS_control_unit control
(
	.ALUSrc(ALUSrc) ,	// output  ALUSrc_sig
	.MemtoReg(MemtoReg) ,	// output  MemtoReg_sig
	.RegDst(RegDst) ,	// output  RegDst_sig
	.RegWrite(RegWrite) ,	// output  RegWrite_sig
	.MemRead(MemRead) ,	// output  MemRead_sig
	.MemWrite(MemWrite) ,	// output  MemWrite_sig
	.Branch(Branch) ,	// output  Branch_sig
	
	.Opcode(memout[15:10]) ,	// input [5:0] Opcode_sig
	.CLK(clk) ,	// input  CLK_sig
	.Reset(reset) 	// input  Reset_sig
);


initial begin
	reset = 0;
end


endmodule
