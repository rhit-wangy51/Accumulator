module mux3b16 (input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [2:0] sel,
	output reg [15:0] out);
	
	always @ (a or b or c or d or e or sel) begin
		case (sel)
			3'b000 : out = a;
			3'b001 : out = b;
			3'b010 : out = c;
			3'b011 : out = d;
			3'b100 : out = e;
			default : out <= 0;
		endcase
	end
endmodule
