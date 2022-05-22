// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module memory 
#(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=10)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, CLK,
	output [(DATA_WIDTH-1):0] q,
	output reg [0:0] IsIO
);

// Declare the RAM variable
reg [DATA_WIDTH-1:0] ram[0:2**ADDR_WIDTH-1];

// Variable to hold the registered read address
reg [ADDR_WIDTH-1:0] addr_reg;

initial begin
 $readmemh("memory.txt", ram);
end

always @ (posedge CLK) begin
	if( addr == 10'h07fc) IsIO <= 1;
	else IsIO <= 0;
end



always @ (negedge CLK) begin
	// Write
	
	if (we) begin
		ram[addr/2] <= data;
	end
	
	addr_reg <= addr/2;
end




// Continuous assignment implies read returns NEW data.
// This is the natural behavior of the TriMatrix memory
// blocks in Single Port mode.  
assign q = ram[addr_reg];

endmodule
