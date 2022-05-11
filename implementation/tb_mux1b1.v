module tb_mux1b1();

//input
reg [0:0] InA;
reg [0:0] InB;
reg [0:0] OP;

//output
wire [0:0] MuxOut;

mux1b1 test_mux1b(
	.A(InA),
	.B(InB),
	.OP(OP),
	.Out(MuxOut)
);

initial begin
	InA = 1;
	InB = 0;
	OP = 0;
	#10
	
	
	//Test op = 1
	$display("Testing op = 0.");
	
	
	if(MuxOut != InA) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, MuxOut, InA);
	 end
	 else begin
		$display("Testing op = 0 PASS.");
	 end
	 
	 
	 
	 //Test op = 1
	 
	$display("Testing op = 1.");
	OP = 1;
	#10
	
	if(MuxOut != InB) begin
		 $display("%t (COUNT UP) Error at output = %d, expecting = %d", $time, MuxOut, InB);
	 end
	 else begin
		$display("Testing op = 1 PASS.");
	 end

end

endmodule