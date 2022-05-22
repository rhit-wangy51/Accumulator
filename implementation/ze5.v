module ze5(
	input [10:0] In,
	output reg [15:0] Out
);


always @(In) begin
	Out <= { {5'b0}, In[10:0] };
end

endmodule