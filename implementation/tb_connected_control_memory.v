module tb_connected_control_memory();

//Inputs
reg clk;
reg [9:0] PC;
reg [15:0] data;

//Outputs
wire ALUSrc;
wire MemtoReg;
wire RegDst;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire Branch;
	
wire MemOut;

connected_control_memory UUT
(
	.clk(clk) ,	// input  clk_sig
	.PC(PC) ,	// input [10:0] PC_sig
	.datain(data) ,	// input [15:0] datain_sig
	
	.ALUSrc(ALUSrc) ,	// output  ALUSrc_sig
	.MemtoReg(MemtoReg) ,	// output  MemtoReg_sig
	.RegDst(RegDst) ,	// output  RegDst_sig
	.RegWrite(RegWrite) ,	// output  RegWrite_sig
	.MemRead(MemRead) ,	// output  MemRead_sig
	.MemWrite(MemWrite) ,	// output  MemWrite_sig
	.Branch(Branch) 	// output  Branch_sig
);

parameter HALF_PERIOD=50;
parameter PERIOD = HALF_PERIOD * 2;

integer cycle_counter = 0;
integer counter = 0;
integer failures = 0;

always #HALF_PERIOD clk = ~clk;

initial begin
	$display("Initializing the UUT");
	
	clk = 1;
	PC = 'h004;
	failures = 0;
	counter = 0;
	#PERIOD;
	#PERIOD;
	#PERIOD;
	
	
	$display("Testing R-type");
	counter = counter + 1;
	//if (q != 'h1234) begin
	//	failures = failures + 1;
	//	$display("%t (Reading) Error at cycle %d, output = %d, expecting = h'1234", 
	//	   			$time, counter, q);
	//end
	
	PC = 'h005;
	#PERIOD;
	$display("Testing lw");
	counter = counter + 1;

	PC = 'h006;
	#PERIOD;
	$display("Testing sw");
	counter = counter + 1;
	
	PC = 'h007;
	#PERIOD;
	$display("Testing beq");
	counter = counter + 1;

end

endmodule
