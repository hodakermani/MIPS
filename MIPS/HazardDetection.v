module hazadDetection(input enable, MEM_R_EN_IDReg, input[4:0]src1,src2,dest_EXE,dest_mem, input twoSources, wbEN_EXE, wbEN_mem, output hazardDetected);
        assign hazardDetected = enable ? (!twoSources && (wbEN_EXE && dest_EXE == src1) ? 1
        :!twoSources &&(wbEN_mem && dest_mem == src1)? 1
        :twoSources && (wbEN_EXE && (dest_EXE == src1 || dest_EXE == src2))?1
        :twoSources &&(wbEN_mem && (dest_mem == src1 || dest_mem == src2))? 1 :0) 
        : (MEM_R_EN_IDReg && twoSources && (dest_EXE == src1 || dest_EXE == src2)) ? 1 
        : (MEM_R_EN_IDReg && !twoSources && (dest_EXE == src1)) ? 1 : 0; // ?src2 = 0
        //if enable is 0 -> forwarding 
endmodule