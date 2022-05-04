module shift_left_tb;
	reg [15:0]data_in;
	wire [15:0]data_out;
	
	shift_left UUT(.in(data_in), .out(data_out));
	
	initial begin
		data_in = 6'b111000;
		#5 data_in = 6'b110000;
		#5 data_in = 6'b111100;
		#5 data_in = 6'b111110;
		#5 data_in = 6'b001100;
	end
endmodule
