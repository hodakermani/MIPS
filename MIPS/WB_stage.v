module WB_stage(input[31:0] ALU_result, MEM_result, input MEM_R_en, output [31:0] out);
	MUX32 mux32(ALU_result,MEM_result, MEM_R_en, out);
endmodule