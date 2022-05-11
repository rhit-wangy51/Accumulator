module tb_alu16();

//input
reg [15:0] A;
reg [15:0] B;
reg [2:0] OP;
reg [0:0] CLK;

//output
wire [15:0] Out;
wire [0:0] Zero;

alu16 test_alu(
	.A(A),
	.B(B),
	.OP(OP),
	.CLK(CLK),
	.Out(Out),
	.Zero(Zero)
);

parameter HALF_PERIOD = 50;


initial begin
    CLK = 0;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin

	A = 16'b101;
	B = 16'b001;
	#(2*HALF_PERIOD);
	
	OP = 3'b000;
	#(2*HALF_PERIOD);
	
// AND
	$display("Testing AND.");
	
	
	if(Out != 3'b001) begin
		 $display("%t (AND) Error at output = %d, expecting = 001", $time, Out);
	 end
	 else begin
		$display("Testing AND PASS.");
	 end
	 
// test OR
	$display("Testing OR.");
	
	OP = 3'b001;
	#(2*HALF_PERIOD);
	
	if(Out != 16'b101) begin
		 $display("%t (OR) Error at output = %d, expecting = 101", $time, Out);
	 end
	 else begin
		$display("Testing OR PASS.");
	 end
	 
// test ADD
	$display("Testing ADD.");
	
	OP = 3'b010;
	#(2*HALF_PERIOD);
	
	if(Out != 16'b110) begin
		 $display("%t (ADD) Error at output = %d, expecting = 110", $time, Out);
	 end
	 else begin
		$display("Testing ADD PASS.");
	 end
	 
// test SUB
	$display("Testing SUB.");
	
	OP = 3'b011;
	#(2*HALF_PERIOD);
	
	if(Out != 16'b100) begin
		 $display("%t (SUB) Error at output = %d, expecting = 100", $time, Out);
	 end
	 else begin
		$display("Testing SUB PASS.");
	 end
	 
// test A<B = 0
	$display("Testing A<B = 0.");
	
	OP = 3'b100;
	#(2*HALF_PERIOD);
	
	if(Out != 0) begin
		 $display("%t(A<B = 0) Error at output = %d, expecting = 0", $time, Out);
	 end
	 else begin
		$display("Testing A<B = 0 PASS.");
	 end
	 
// test A<B = 1
	$display("Testing A<B = 1.");
	
	A = 16'b001;
	B = 16'b101;
	OP = 3'b100;
	#(2*HALF_PERIOD);
	
	if(Out != 1) begin
		 $display("%t(A<B = 1) Error at output = %d, expecting = 1", $time, Out);
	 end
	 else begin
		$display("Testing A<B = 1 PASS.");
	 end
	 
// test Zero
	$display("Testing Zero");
	
	A = 16'b101;
	B = 16'b101;
	#(2*HALF_PERIOD);
	
	if(Zero != 1) begin
		 $display("%t(Zero) Error at output = %d, expecting = 1", $time, Out);
	 end
	 else begin
		$display("Testing Zero PASS.");
	 end
	 
	 
// test update on pos edge
	$display("Testing update on pos edge.");
	
	A = 16'b101;
	B = 16'b001;
	OP = 3'b010;
	#(0.5*HALF_PERIOD);
	$display("%t ", $time);
	if(Out != 16'b110) begin
		 $display("%t (ADD) Error at output = %d, expecting = 110", $time, Out);
	 end
	 
	 A = 16'b110;
	 B = 16'b001;
	 #(1.5*HALF_PERIOD);
	 $display("%t ", $time);
	if(Out != 16'b111) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = 111", $time, Out);
	 end
	$display("Testing update on pos edge PASS.");
	
end
endmodule