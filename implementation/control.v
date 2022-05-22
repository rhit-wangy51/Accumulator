module control (
	input [4:0] Opcode,
	input CLK,
	input Reset,

	output reg [1:0] PCSrc,
	output reg [1:0] MemAddr,
	output reg [0:0] MemData,
	output reg [0:0] MemWrite,
	output reg [0:0] SPWrite,
	output reg [2:0] ACCSrc,
	output reg [0:0] ACCWrite,
	output reg [1:0] ALUSrcA,
	output reg [2:0] ALUSrcB,
	output reg [2:0] ALUOp,
	output reg [1:0] BneOrBeq,
	output reg [1:0] PCWrite,
	output reg [1:0] Branch,
	output reg [0:0] IRWrite
);

//state flip-flops
reg [4:0]    current_state;
reg [4:0]    next_state;

//state definitions
parameter    Fetch = 0;
parameter    Decode = 1;
parameter    Load = 2;
parameter    Addi = 3;
parameter    Save = 4;
parameter    Loadi = 5;
parameter    Jal = 6;
parameter    Ori = 7;
parameter    And = 8;
parameter    Slt = 9;
parameter    SwOrLw = 10;
parameter    Lw = 11;
parameter    Sw = 12;
parameter    Or = 13;
parameter    Beq = 14;
parameter    Sub = 15;
parameter    Bne = 16;
parameter    Jump = 17;
parameter    Ms = 18;
parameter    Add = 19;
parameter    Slti = 20;
parameter    Loadui = 21;

//register calculation
always @ (posedge CLK, posedge Reset) begin
	if (Reset)
	begin
//		MemAddr = 'b0;
//		MemData = 'b0;
//		MemWrite = 'b0;
		current_state = Fetch;
	end
	else 
		current_state = next_state;
end


//OUTPUT signals for each state (depends on current state)
always @ (current_state) begin
	//Reset all signals that cannot be don't cares
	MemWrite = 0;
	SPWrite = 0;
	ACCWrite = 0;
	PCWrite = 0;
	Branch = 0;
	IRWrite = 0;
	MemAddr = 0;

	case (current_state)
		Fetch:
			begin
				PCSrc = 0;
				PCWrite = 1;
				ALUSrcA = 0;
				ALUSrcB = 0;
				MemAddr = 0;
				ALUOp = 'b010;
				IRWrite = 1;
			end
			
		Decode:
			begin
				MemAddr = 1;
				ALUSrcA = 0;
				ALUSrcB = 'b100;
				ALUOp = 'b010;
			end
			
		Load:
			begin
				ACCWrite = 1;
				ACCSrc = 1;
			end
			
		Addi:
			begin
				ALUSrcA = 1;
				ALUSrcB = 1;
				ALUOp = 'b010;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Save:
			begin
				MemWrite = 1;
				MemAddr = 1;
				MemData = 0;
			end
			
		Loadi:
			begin
				ACCWrite = 1;
				ACCSrc = 'b011;
			end
			
		Jal:
			begin
				PCWrite = 1;
				PCSrc = 1;
				MemWrite = 1;
				MemAddr = 'b10;
				MemData = 1;
			end
			
		Ori:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b011;
				ALUOp = 'b001;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		And:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 0;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Slt:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 'b100;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		SwOrLw:
			begin
				ALUSrcA = 'b10;
				ALUSrcB = 1;
				ALUOp = 'b010;
			end
			
		Lw:
			begin
				ACCWrite = 1;
				ACCSrc = 'b010;
				MemAddr = 'b11;
			end
			
		Sw:
			begin
				MemWrite = 1;
				MemAddr = 'b11;
				MemData = 0;
			end
			
		Or:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 1;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Beq:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 'b011;
				Branch = 1;
				BneOrBeq = 1;
			end
			
		Sub:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 'b011;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Bne:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b010;
				ALUOp = 'b011;
				Branch = 1;
				BneOrBeq = 0;
			end
			
		Jump:
			begin
				PCWrite = 1;
				PCSrc = 1;
			end
			
		Ms:
			begin
				SPWrite = 1;
				ALUSrcA = 'b10;
				ALUSrcB = 1;
				ALUOp = 'b010;
			end
			
		Add:
			begin
				ALUSrcA = 1;
				ALUSrcB = 1;
				ALUOp = 'b010;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Slti:
			begin
				ALUSrcA = 1;
				ALUSrcB = 'b011;
				ALUOp = 'b100;
				ACCWrite = 1;
				ACCSrc = 'b100;
			end
			
		Loadui:
			begin
				ACCWrite = 1;
				ACCSrc = 0;
			end
			
		default:
			begin 
				$display ("not implemented"); 
			end
	endcase
	
end

//NEXT STATE calculation (depends on current state and opcode)       
always @ (current_state, next_state, Opcode) begin
	$display("The current state is %d", current_state);
	
	case (current_state)
		Fetch:
			begin
				next_state = Decode;
				$display("In Fetch, the next_state is %d", next_state);
			end
			
		Decode:
			begin
				$display("The opcode is %d", Opcode);
				case (Opcode)
					'b00001:
						begin
							next_state = Load;
							$display("The next state is Load");
						end
					'b00010:
						begin
							next_state = Save;
							$display("The next state is Save");
						end
					'b00011:
						begin
							next_state = Loadui;
							$display("The next state is Loadui");
						end
					'b00100:
						begin
							next_state = Bne;
							$display("The next state is Bne");
						end
					'b00101:
						begin next_state = Beq;
							$display("The next state is Beq");
						end
					'b00110:
						begin next_state = Slt;
							$display("The next state is Slt");
						end
					'b00111:
						begin next_state = Slti;
							$display("The next state is Slti");
						end						
					'b01000:
						begin next_state = Jump;
							$display("The next state is Jump");
						end
					'b01001:
						begin next_state = Jal;
							$display("The next state is Jal");
						end						
					'b01010:
						begin next_state = SwOrLw;
							$display("The next state is LwOrSw");
						end						
					'b01011:
						begin next_state = SwOrLw;
							$display("The next state is LwOrSw");
						end						
					'b01100:
						begin next_state = Ms;
							$display("The next state is Ms");
						end						
					'b01101:
						begin next_state = Sub;
							$display("The next state is Sub");
						end		
					'b01110:
						begin next_state = Add;
							$display("The next state is Add");
						end				
					'b01111:
						begin next_state = Addi;
							$display("The next state is Addi");
						end		
					'b10000:
						begin next_state = And;
							$display("The next state is And");
						end		
					'b10001:
						begin next_state = Or;
							$display("The next state is Or");
						end		
					'b10010:
						begin next_state = Ori;
							$display("The next state is Ori");
						end		
					'b10011:
						begin next_state = Loadi;
							$display("The next state is Loadi");
						end				
						
					default:
						begin 
							$display(" Wrong Opcode %d ", Opcode);  
							next_state = Fetch; 
						end
				endcase  

				$display("In Decode, the next_state is %d", next_state);
			end
			
		Load:
			begin
				next_state = Fetch;
				$display("In Load, the next_state is %d", next_state);
			end
			
		Addi:
			begin
				next_state = Fetch;
				$display("In Addi, the next_state is %d", next_state);
			end
			
		Save:
			begin
				next_state = Fetch;
				$display("In Save, the next_state is %d", next_state);
			end
			
		Loadi:
			begin
				next_state = Fetch;
				$display("In Loadi, the next_state is %d", next_state);
			end
			
		Jal:
			begin
				next_state = Fetch;
				$display("In Jal, the next_state is %d", next_state);
			end
			
		Ori:
			begin
				next_state = Fetch;
				$display("In Ori, the next_state is %d", next_state);
			end
			
		And:
			begin
				next_state = Fetch;
				$display("In And, the next_state is %d", next_state);
			end
			
		Slt:
			begin
				next_state = Fetch;
				$display("In Slt, the next_state is %d", next_state);
			end
			
		SwOrLw:
			begin
				$display("The opcode is %d", Opcode);
				case (Opcode)
					'b01011:
						begin
							next_state = Lw;
							$display("The next state is Lw");
						end
					'b01010:
						begin
							next_state = Lw;
							$display("The next state is Sw");
						end
					default:
						begin
							$display(" Wrong Opcode %d ", Opcode);  
							next_state = Fetch;
						end
				endcase
			end
			
		Lw:
			begin
				next_state = Fetch;
				$display("In Lw, the next_state is %d", next_state);
			end
			
		Sw:
			begin
				next_state = Fetch;
				$display("In Sw, the next_state is %d", next_state);
			end
			
		Or:
			begin
				next_state = Fetch;
				$display("In Or, the next_state is %d", next_state);
			end
			
		Beq:
			begin
				next_state = Fetch;
				$display("In Beq, the next_state is %d", next_state);
			end
			
		Sub:
			begin
				next_state = Fetch;
				$display("In Sub, the next_state is %d", next_state);
			end
			
		Bne:
			begin
				next_state = Fetch;
				$display("In Bne, the next_state is %d", next_state);
			end
			
		Jump:
			begin
				next_state = Fetch;
				$display("In Jump, the next_state is %d", next_state);
			end
			
		Ms:
			begin
				next_state = Fetch;
				$display("In Ms, the next_state is %d", next_state);
			end
			
		Add:
			begin
				next_state = Fetch;
				$display("In Add, the next_state is %d", next_state);
			end
		
		Slti:
			begin
				next_state = Fetch;
				$display("In Add, the next_state is %d", next_state);
			end
			
		Loadui:
			begin
				next_state = Fetch;
				$display("In Add, the next_state is %d", next_state);
			end
			
		default:
			begin 
				$display ("not implemented");
				next_state = Fetch;
			end
	endcase
	
	$display("After the tests, the next_state is %d", next_state);
end
endmodule
