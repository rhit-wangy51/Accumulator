module se16(
	input [7:0] In,
	output reg [15:0] Out
);


always @(In) begin
	Out <= { {8{In[7]}}, In[7:0] };
end

endmodule