
module IF_Stage (input clk,rst,freez,Branch_taken ,input[31:0]BranchAddr, output [31:0] passPC,Instruction);
	
	wire[31:0] PC_out,PC_in,PCPlus4;
	
	MUX32 mux32(PCPlus4, BranchAddr, Branch_taken, PC_in);
	PC pc(clk,rst,freez,PC_in, PC_out);
	inst_mem inst(clk,rst,PC_out,Instruction);
	assign PCPlus4 = PC_out + 32'd4;
	assign passPC = PCPlus4;
	
endmodule
	