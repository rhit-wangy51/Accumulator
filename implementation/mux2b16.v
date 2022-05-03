module mux2b16(
	input [15:0] A,
	input [15:0] B,
	input [15:0] C,
	input [15:0] D,
	input [1:0] OP,
	output reg [15:0] Out
);


always begin
	if(OP == 2'b11)
		Out <= A; 
	else if(OP == 2'b10)
		Out <= B;
	else if(OP == 2'b01)
		Out <= C;
	else
		Out <= D;
end

endmodule