module mux_5to1_testbench;
	reg [15:0] in0;
	reg [15:0] in1;
	reg [15:0] in2;
	reg [15:0] in3;
	reg [15:0] in4;
	reg [2:0] sel;
	wire [15:0] out;
	integer i;
	
	parameter testDelay = 10;
	
	CSSE232_Project_3_Bit_Mux UUT(.a (in0), .b (in1), .c (in2), .d (in3), .e (in4), .sel (sel), .out (out));
	
	initial
	begin
		in0 = $random; in1 = $random; in2 = $random; in3 = $random; in4 = $random; sel = 3'b000;
		
		for(i = 0; i < 5; i=i+1) begin
			#(testDelay) sel = i;
		end
		
		#(testDelay) in4 = $random;
		
		end
endmodule
