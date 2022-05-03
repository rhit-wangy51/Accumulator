module tb_mux2b16();

//input
reg [15:0] A;
reg [15:0] B;
reg [15:0] C;
reg [15:0] D;
reg [1:0] OP;

//output
wire [15:0] Out;

mux2b16 test_mux2(
	.A(A),
	.B(B),
	.C(C),
	.D(D),
	.OP(OP),
	.Out(Out)
);



initial begin

	A = 16'b1000;
	B = 16'b0100;
	C = 16'b0010;
	D = 16'b0001;
	#100;
	
// Select A
	$display("Testing A.");
	
	OP = 2'b11;
	#100;
	
	if(Out != 16'b1000) begin
		 $display("(A SELECT) Error at output = %d, expecting = 1000", Out);
	 end
	 else begin
		$display("Testing A select PASS.");
	 end
	 
// Select B
	$display("Testing B.");
	
	OP = 2'b10;
	#100;
	
	
	if(Out != 16'b0100) begin
		 $display("(B SELECT) Error at output = %d, expecting = 0100", Out);
	 end
	 else begin
		$display("Testing B select PASS.");
	 end
	 
// Select C
	$display("Testing C.");
	
	OP = 2'b01;
	#100;
	
	
	if(Out != 16'b0010) begin
		 $display("(C SELECT) Error at output = %d, expecting = 0010", Out);
	 end
	 else begin
		$display("Testing C select PASS.");
	 end
	 
// Select D
	$display("Testing D.");
	
	OP = 2'b00;
	#100;
	
	
	if(Out != 16'b0001) begin
		 $display("(D SELECT) Error at output = %d, expecting = 0001", Out);
	 end
	 else begin
		$display("Testing D select PASS.");
	 end
	 	
end
endmodule