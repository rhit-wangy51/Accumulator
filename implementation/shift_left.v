module shift_left(in, out);
	input [15:0]in;
	output reg[15:0]out;
	
	always @(in) begin
		out = in << 1;
	end
endmodule
