module tb_16bAccumulator();

//input
reg [15:0] IOIn;
reg [0:0] reset;
reg CLK;

//output
wire [15:0] Output;

accumulatorFull testAccumulator(
	.IOIn(IOIn),
	.reset(reset),
	.CLK(CLK),
	.Output(Output)
	
);

parameter HALF_PERIOD = 50;

initial begin
    CLK = 0;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin
	IOIn = 16'hFF00;
	#(HALF_PERIOD);
	reset = 1;
	#(HALF_PERIOD*2)
	reset = 0;
end

endmodule