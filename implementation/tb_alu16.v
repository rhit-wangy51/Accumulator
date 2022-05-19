module tb_alu16();

//input
reg [15:0] A;
reg [15:0] B;
reg [2:0] OP;

//output
wire [15:0] Out;
wire [0:0] Zero;

alu16 test_alu(
	.A(A),
	.B(B),
	.OP(OP),
	.Out(Out),
	.Zero(Zero)
);



initial begin

	A = 16'b101;
	B = 16'b001;
	
	OP = 3'b000;

	
// AND
	$display("Testing AND.");
	
	
	if(Out != 3'b001) begin
		 $display("(AND) Error at output = %d, expecting = 001", Out);
	 end
	 else begin
		$display("Testing AND PASS.");
	 end
	 
// test OR
	$display("Testing OR.");
	
	OP = 3'b001;
	
	if(Out != 16'b101) begin
		 $display("(OR) Error at output = %d, expecting = 101", Out);
	 end
	 else begin
		$display("Testing OR PASS.");
	 end
	 
// test ADD
	$display("Testing ADD.");
	
	OP = 3'b010;
	
	if(Out != 16'b110) begin
		 $display("(ADD) Error at output = %d, expecting = 110", Out);
	 end
	 else begin
		$display("Testing ADD PASS.");
	 end
	 
// test SUB
	$display("Testing SUB.");
	
	OP = 3'b011;
	
	if(Out != 16'b100) begin
		 $display("(SUB) Error at output = %d, expecting = 100", Out);
	 end
	 else begin
		$display("Testing SUB PASS.");
	 end
	 
// test A<B = 0
	$display("Testing A<B = 0.");
	
	OP = 3'b100;
	
	if(Out != 0) begin
		 $display("(A<B = 0) Error at output = %d, expecting = 0", Out);
	 end
	 else begin
		$display("Testing A<B = 0 PASS.");
	 end
	 
// test A<B = 1
	$display("Testing A<B = 1.");
	
	A = 16'b001;
	B = 16'b101;
	OP = 3'b100;
	
	if(Out != 1) begin
		 $display("(A<B = 1) Error at output = %d, expecting = 1", Out);
	 end
	 else begin
		$display("Testing A<B = 1 PASS.");
	 end
	 
// test Zero
	$display("Testing Zero");
	
	A = 16'b101;
	B = 16'b101;

	if(Zero != 1) begin
		 $display("(Zero) Error at output = %d, expecting = 1", Out);
	 end
	 else begin
		$display("Testing Zero PASS.");
	 end
	 
	 
// test update on pos edge
	$display("Testing update on pos edge.");
	
	A = 16'b101;
	B = 16'b001;
	OP = 3'b010;

	if(Out != 16'b110) begin
		 $display("(ADD) Error at output = %d, expecting = 110", Out);
	 end
	 
	 A = 16'b110;
	 B = 16'b001;

	if(Out != 16'b111) begin
		 $display("(COUNT UP) Error at output = %d, expecting = 111", Out);
	 end
	
end
endmodule