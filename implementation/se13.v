module se13(
	input [2:0] In,
	output reg [15:0] Out
);


always @(In) begin
	Out <= { {13{In[2]}}, In[2:0] };
end

endmodule