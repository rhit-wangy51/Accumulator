module tb_16bAccumulator();

//input
reg [15:0] IOIn;
reg [0:0] reset;
reg CLK;

//output
wire [15:0] Output;

accumulatorFull testAccumulator(
	.IOIn(IOIn),
	.reset(reset),
	.CLK(CLK),
	.Output(Output)
	
);

parameter HALF_PERIOD = 50;
parameter a = 16'h0014;
parameter b = 16'h000A;


initial begin
    CLK = 1;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin


	$display("Testing reset.");
	IOIn = 16'hFF00;
	
	#(HALF_PERIOD);
	reset = 1;
	#(HALF_PERIOD*6)
	reset = 0;
	
	
	$display("Testing I/O.");
	#(HALF_PERIOD*12);
	
	if(Output != IOIn) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, IOIn);
	 end
	 else begin
		$display("Testing I/O PASS.");
	 end
	 
	 
	$display("Testing load/save.");
	IOIn = a;//a = 1
	#(HALF_PERIOD*11);
	IOIn = b;// b = 10
	#(HALF_PERIOD*25);
	
	if(Output != a) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a);
	 end
	 else begin
		$display("Testing load/save PASS.");
	 end
	 
	 
	 $display("Testing loadui.");
	 #(HALF_PERIOD*12);
	 
	 if(Output != 16'h0800) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 16'h0800);
	 end
	 else begin
		$display("Testing loadui PASS.");
	 end
	 
	 
	 $display("Testing loadi.");
	 #(HALF_PERIOD*12);
	 
	 if(Output != 30) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 30);
	 end
	 else begin
		$display("Testing loadi PASS.");
	 end
	 
	 
	 $display("Testing slt.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != 0) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 0);
	 end
	 else begin
		$display("Testing slt 1 PASS.");
	 end
	 
	 #(HALF_PERIOD*18);
	 if(Output != 1) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 1);
	 end
	 else begin
		$display("Testing slt 2 PASS.");
	 end
	 
	 
	 $display("Testing slti.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != 0) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 0);
	 end
	 else begin
		$display("Testing slti 1 PASS.");
	 end
	 
	 #(HALF_PERIOD*18);
	 
	 if(Output != 1) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 1);
	 end
	 else begin
		$display("Testing slti 2 PASS.");
	 end
	 
	 
	 $display("Testing sw/lw/ms.");
	 #(HALF_PERIOD*54);
	 
	 if(Output != a) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a);
	 end
	 else begin
		$display("Testing sw/lw/ms 1 PASS.");
	 end
	 
	 #(HALF_PERIOD*14);
	 
	 if(Output != b) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, b);
	 end
	 else begin
		$display("Testing sw/lw/ms 2 PASS.");
	 end
	 
	 
	 $display("Testing sub.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != 10) begin// negative number
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 10);
	 end
	 else begin
		$display("Testing sub PASS.");
	 end
	 
	 
	 $display("Testing add.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != 30) begin// negative number
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 30);
	 end
	 else begin
		$display("Testing add PASS.");
	 end
	 
	 
	 $display("Testing addi.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != 21) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 21);
	 end
	 else begin
		$display("Testing addi 1 PASS.");
	 end
	 
	 #(HALF_PERIOD*18);
	 
	 if(Output != 19) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, 19);
	 end
	 else begin
		$display("Testing addi 2 PASS.");
	 end
	 
	 
	 $display("Testing and.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != a&b) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a&b);
	 end
	 else begin
		$display("Testing and PASS.");
	 end
	 
	 
	 $display("Testing or.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != (a|b)) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a | b);
	 end
	 else begin
		$display("Testing or PASS.");
	 end
	 
	 
	 $display("Testing ori.");
	 #(HALF_PERIOD*18);
	 
	 if(Output != (a|16'h000F)) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a|16'h000F);
	 end
	 else begin
		$display("Testing ori PASS.");
	 end
	 
	 
	 $display("Testing bne.");
	 #(HALF_PERIOD*24);
	 
	 if(Output != b) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, b);
	 end
	 else begin
		$display("Testing bne PASS.");
	 end
	 
	 
	 $display("Testing beq.");
	 #(HALF_PERIOD*24);//may cause problem
	 
	 if(Output != a) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a);
	 end
	 else begin
		$display("Testing beq PASS.");
	 end
	 
	 
	 $display("Testing j.");
	 #(HALF_PERIOD*24);
	 
	 if(Output != b) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, b);
	 end
	 else begin
		$display("Testing j PASS.");
	 end
	 
	 
	 
	 $display("Testing jal.");
	 #(HALF_PERIOD*30);
	 
	 if(Output != a) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, Output, a);
	 end
	 else begin
		$display("Testing jal PASS.");
	 end
	 
	 
	
end

endmodule