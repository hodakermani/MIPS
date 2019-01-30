module IF_Stage_Reg (input clk,rst,freez,flush, input[31:0]PC_in, Instruction_in, output reg [31:0] PC,Instruction);
	initial begin
		PC = 32'd0; Instruction = 32'd0;
	end
	always@(posedge clk)begin
		if (rst || flush) begin
			PC <= 32'd0;
			Instruction = 32'd0;
		end
		else if(!freez) begin
			PC <= PC_in;
			Instruction <= Instruction_in;
		end
		
	end
endmodule