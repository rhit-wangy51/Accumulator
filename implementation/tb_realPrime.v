module tb_realPrime();

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
parameter a = 12;


initial begin
    CLK = 1;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin


	$display("Testing reset.");
	IOIn = a;
	
	#(HALF_PERIOD);
	reset = 1;
	#(HALF_PERIOD*6)
	reset = 0;
	
end



endmodule