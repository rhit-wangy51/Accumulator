module alu16(
	input [15:0] A,
	input [15:0] B,
	input [2:0] OP,
	output reg [15:0] Out,
	output reg [0:0] Zero
);


always @ (A, B, OP) begin
	if(A == B)
		Zero <= 1'b1;
	else
		Zero <= 1'b0;
		
	case(OP)
		3'b000: Out <= A & B;
		3'b001: Out <= A | B;
		3'b010: Out <= A + B;
		3'b011: Out <= A - B;
		3'b100: 
			if(A < B)
				Out <= 16'b1;
			else
				Out <= 16'b0;
	endcase
end

endmodule
