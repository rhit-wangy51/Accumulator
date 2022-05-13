module wires_subsystem(
	input [7:0] IR,
	input [15:0] MemData,
	input [15:0] ALU,
	input	[0:0] reset,
	input [0:0] CLK,
	input	[15:0] MDR,
	input [2:0] AccSrc,
	input [0:0] AccWrite,
	input [0:0] SpWrite,
	output [15:0] AccOutput,
	output [15:0] SpOutput,
	output [15:0] SE,
	output [15:0] SELeft,
	output [15:0] ZE);
	
	wire [15:0] MuxOut;
	wire [15:0] EightShift;
	
	se16 SignExtend (.In(IR), .Out(SE));
	
	shift_left SingleShift(.in(SE), .out(SELeft));
	
	ze16 ZeroExtend (.In(IR), .Out(ZE));
	
	CSSE232_Project_3_Bit_Mux AccSource(.a(EightShift), .b(MDR), .c(MemData), .d(SE), .e(ALU), .sel(AccSrc), .out(MuxOut));
	
	reg16 Acc (.In(MuxOut), .E(AccWrite), .reset(reset), .CLK(CLK), .Out(AccOutput));
	
	reg16 Sp (.In(ALU), .E(SpWrite), .reset(reset), .CLK(CLK), .Out(SpOutput));
	
	assign EightShift = IR << 8;
	
endmodule
	
	