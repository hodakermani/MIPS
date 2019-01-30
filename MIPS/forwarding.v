module forwarding(input enable, input[4:0] IDRegDest, IDRegsrc1, IDRegsrc2, EXERegDest, MEMRegDest,input EXERegWBen, MEMRegWBen, output [1:0] selVal1, selVal2, selImm);
  assign selVal1 =  (EXERegDest == IDRegsrc1 && EXERegWBen) && (!enable) ? 2'd1 : 
        (MEMRegDest == IDRegsrc1 && MEMRegWBen) && (!enable) ? 2'd2 : 2'd0;
  assign selVal2 =  (EXERegDest == IDRegsrc2 && EXERegWBen) && (!enable) ? 2'd1 :
        (MEMRegDest == IDRegsrc2 && MEMRegWBen) && (!enable) ? 2'd2 : 2'd0;
  assign selImm = (EXERegDest == IDRegDest && EXERegWBen) && (!enable) ? 2'd1:
         (IDRegDest == MEMRegDest && MEMRegWBen) && (!enable) ? 2'd2 : 2'd0; 
endmodule