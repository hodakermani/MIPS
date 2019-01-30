module EXE_Stage(input clk, input[1:0] selVal1, selVal2, selImm, input[3:0]EXE_CMD, input[31:0]memInput, WBInput,val1,val2,valSrc2,PC, input[1:0] BRType, output[31:0] ALU_result, Br_addr, output Br_taken);
wire[31:0]ALUInput1, ALUInput2, IMMmuxOutput;
MUX32_3input mux1(val1 , memInput, WBInput, selVal1, ALUInput1);
MUX32_3input mux2(val2, memInput, WBInput, selVal2, ALUInput2);
MUX32_3input mux3(valSrc2, memInput, WBInput, selImm,IMMmuxOutput);
  
//ALU (input[31:0] in1,in2, input[3:0]exeCMD, output[31:0]out);
ALU alu(ALUInput1, ALUInput2, EXE_CMD, ALU_result);

//condCheck(input[31:0]val1, src2Val, input[1:0]BRType, output out);
condCheck cond_check(ALUInput1, IMMmuxOutput, BRType, Br_taken);

//addPC(input[31:0]PC, offset, output[31:0]out);
addPC add_PC(PC, ALUInput2, Br_addr);
endmodule