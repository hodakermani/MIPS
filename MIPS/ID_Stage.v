module ID_Stage (input clk,rst, freez , input[31:0] PC,Instruction, Result_WB, input writeBackEn, input[4:0] Dest_wb, output WB_en, memRead, memWrite,output[1:0] BR, output[3:0]executeCMD, output[31:0] out1, out2, reg2, output[4:0] dest, src1,src2, output twoSoursec, isImmediate);
	wire[31:0] immediate;
	wire WB_en_out, memRead_out, memWrite_out, isImmediate_out;
	wire[1:0] BR_out;
	wire[3:0]executeCMD_out;
	wire[31:0] out1_out, out2_out, reg2_out;
	wire[4:0] dest_out;
	
	assign src1 = Instruction[25:21];
	assign src2 = Instruction[20:16];

	
	controlUnit cu (Instruction[31:26], WB_en_out, isImmediate_out, memRead_out, memWrite_out, executeCMD_out, BR_out, twoSoursec);
	
	MUX10 mux10({WB_en_out, isImmediate_out, memRead_out, memWrite_out, executeCMD_out, BR_out},11'd0,freez , {WB_en, isImmediate, memRead, memWrite, executeCMD, BR});

	//(input clk, rst, input[4:0] src1, src2, Dest_wb, input[31:0] Result_WB, input writeBackEn, output [31:0] reg1,reg2);
	RegisterFile rf (.clk(clk), .rst(rst), .src1(Instruction[25:21]), .src2(Instruction[20:16]), .Dest_wb(Dest_wb), .Result_WB(Result_WB), .writeBackEn(writeBackEn), .reg1(out1), .reg2(reg2));
	
	//module SignExtention (input[15:0] in, output [31:0] out);
	SignExtention signExtention(Instruction[15:0], immediate);
	
	//module MUX32 (input[31:0] in1,in2,input sel , output [31:0] out);
	MUX32 mux32(reg2, immediate, isImmediate, out2);
	
	//module MUX5 (input[4:0] in1,in2,input sel , output[4:0] out);
	MUX5 mux5(Instruction[20:16],Instruction[15:11],isImmediate, dest);
	
	
	
	
endmodule