module tb_memory();

//Inputs 
reg [0:0] clk;
reg [15:0] data;
reg [0:0] we;
reg [9:0] addr;

//Outputs
wire [15:0] q;

memory UUT
(
	.data(data) ,	// input [DATA_WIDTH-1:0] data_sig
	.addr(addr) ,	// input [ADDR_WIDTH-1:0] addr_sig
	.we(we) ,	// input  we_sig
	.clk(clk) ,	// input  clk_sig
	.q(q) 	// output [DATA_WIDTH-1:0] q_sig
);

defparam UUT.DATA_WIDTH = 16;
defparam UUT.ADDR_WIDTH = 10;


parameter HALF_PERIOD=50;
parameter PERIOD = HALF_PERIOD * 2;

integer cycle_counter = 0;
integer counter = 0;
integer failures = 0;

always #HALF_PERIOD clk = ~clk;

initial begin
	$display("Initializing the memory");
	
	clk = 0;
	addr = 'h000;
	data = 'h1111;
	we = 0;
	failures = 0;
	counter = 0;
	
	
	
	
	#PERIOD;
	
	$display("Testing Reading the data");
	counter = counter + 1;
	if (q != 'h1234) begin
		failures = failures + 1;
		$display("%t (Reading) Error at cycle %d, output = %d, expecting = h'1234", 
		   			$time, counter, q);
	end
	
	addr = 'h001;
	#PERIOD;
	counter = counter + 1;
	if (q != 'h1337) begin
		failures = failures + 1;
		$display("%t (Reading) Error at cycle %d, output = %d, expecting = h'1337", 
		   			$time, counter, q);
	end

	addr = 'h002;
	#PERIOD;
	counter = counter + 1;
	if (q != 'hdead) begin
		failures = failures + 1;
		$display("%t (Reading) Error at cycle %d, output = %d, expecting = h'dead", 
		   			$time, counter, q);
	end
	
	addr = 'h003;
	#PERIOD;
	counter = counter + 1;
	if (q != 'hbeef) begin
		failures = failures + 1;
		$display("%t (Reading) Error at cycle %d, output = %d, expecting = h'beef", 
		   			$time, counter, q);
	end
	
	
	$display("Testing Writing the data");
	
	//Writing Test
	we = 1;
	#PERIOD;
	counter = counter + 1;
	if (q != 'h1111) begin
		failures = failures + 1;
		$display("%t (Writing) Error at cycle %d, output = %d, expecting = h'1111", 
		   			$time, counter, q);
	end
	
	$display("TEST COMPLETE. \n Failures = %d \n", failures);
end

endmodule