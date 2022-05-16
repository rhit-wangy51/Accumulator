module reg16(
	input [15:0] In,
	input [0:0] E,
	input [0:0] reset,
	input [0:0] CLK,
	output reg [15:0] Out
);


always @ (posedge CLK, posedge reset) begin //posedge reset
	if(reset==1'b1)
		Out <= 16'b0; 
	else if(E == 1'b1)
		Out <= In;
	else
		Out <= Out; 
end

endmodule
