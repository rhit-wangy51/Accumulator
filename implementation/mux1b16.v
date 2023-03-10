module mux1b16(
	input [15:0] A,
	input [15:0] B,
	input [0:0] OP,
	output reg [15:0] Out
);


always @(A, B, OP) begin
	if(OP==1'b0)
		Out <= A; 
	else
		Out <= B;
end

endmodule
