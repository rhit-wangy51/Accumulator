module tb_gcd();

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
parameter a = 10;
parameter b = 15;


initial begin
    CLK = 1;
    forever begin
        #(HALF_PERIOD);
        CLK = ~CLK;
	 end
end

initial begin


	$display("reset.");
	IOIn = a;
	
	#(HALF_PERIOD);
	reset = 1;
	#(HALF_PERIOD*6)
	reset = 0;
	
	#(HALF_PERIOD*11);
	IOIn = b;
	
end

endmodule