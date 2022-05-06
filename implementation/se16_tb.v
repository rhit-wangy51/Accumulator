module se16_tb;
	reg [7:0]data_in;
	wire [15:0]data_out;
	
	se16 UUT(.In(data_in), .Out(data_out));
	
	initial begin
		data_in = 8'b11110000;
		#10 data_in = 8'b00001111;
		#10 data_in = 8'b11001100;
		#10 data_in = 8'b00110011;
		#10;
	end
endmodule
