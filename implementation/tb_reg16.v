module tb_reg16();

//input
reg [15:0] In;
reg [0:0] E;
reg [0:0] reset;
reg [0:0] CLK;

//output
wire [15:0] Out;

reg16 test_reg(
	.In(In),
	.E(E),
	.reset(reset),
	.CLK(CLK),
	.Out(Out)
);

parameter HALF_PERIOD = 50;
integer counter = 0;


initial begin
    CLK = 0;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin

	In = 0;
	E = 0;
	#(2*HALF_PERIOD)
	
	reset = 1;
	#(10*HALF_PERIOD);
	reset = 0;
	#(2*HALF_PERIOD)
	
// reset
	$display("Testing reset.");
	
	
	if(Out != 0) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 0", $time, Out);
	 end
	 else begin
		$display("Testing reset PASS.");
	 end
	 
// test enable
	$display("Testing enable.");
	
	In = 1;
	#(2*HALF_PERIOD)
	
	if(Out != 0) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 0", $time, Out);
	 end
	 
	 E = 1;
	 #(1.5*HALF_PERIOD)
	 
	 if(Out != 1) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 1", $time, Out);
	 end
	 
	 $display("Testing enable PASS.");
	 
	 
// test update on pos edge
	$display("Testing update on pos edge.");
	
	In = 2;
	#(0.5*HALF_PERIOD)
	$display("%t ", $time);
	if(Out != 1) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 1", $time, Out);
	 end
	 
	 #(1.5*HALF_PERIOD)
	 $display("%t ", $time);
	if(Out != 2) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 2", $time, Out);
	 end
	$display("Testing update on pos edge PASS.");
	
end
endmodule