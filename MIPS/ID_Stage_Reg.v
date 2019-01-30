module ID_Stage_Reg (input freeze, isImmediateIN,clk,rst,flush, input[1:0]Br_taken_in,input MEM_R_En_in, MEM_W_En_in, WB_En_in,input[3:0]EXE_CMD_in, input[4:0]Dest_in, src1,src2, input[31:0]Reg2_in, Val1_in, Val2_in,PC_in, output reg[1:0] Br_taken,output reg MEM_R_En, MEM_W_En, WB_En,output reg[3:0]EXE_CMD, output reg[4:0]Dest, src1_EXEIN, src2_EXEIN, output reg[31:0]Reg2, Val1, Val2,PC_out,output reg isImmediateOUT);
	initial begin
		isImmediateOUT=1'd0;Br_taken = 2'd0;MEM_R_En=1'd0; MEM_W_En=1'd0; WB_En=1'd0;EXE_CMD=4'd0; Dest=5'd0; Reg2=32'd0; Val1=32'd0; Val2=32'd0; PC_out=32'd0;src1_EXEIN=5'd0; src2_EXEIN=5'd0;
	end
	always@(posedge clk)begin
		if (rst || flush) begin
			isImmediateOUT = 1'd0; Br_taken = 2'd0;MEM_R_En=1'd0; MEM_W_En=1'd0; WB_En=1'd0;EXE_CMD=4'd0; Dest=5'd0; Reg2=32'd0; Val1=32'd0; Val2=32'd0; PC_out=32'd0;src1_EXEIN=5'd0; src2_EXEIN=5'd0;
		end
		else if(!freeze)begin
		  src1_EXEIN <= src1;
		  src2_EXEIN <= src2;
		  isImmediateOUT <= isImmediateIN;
			Br_taken <= Br_taken_in;
			MEM_R_En <= MEM_R_En_in;
			MEM_W_En <= MEM_W_En_in;
			WB_En <= WB_En_in;
			EXE_CMD <= EXE_CMD_in;
			Dest <= Dest_in;
			Reg2 <= Reg2_in;
			Val1 <= Val1_in;
			Val2 <= Val2_in;
			PC_out <= PC_in;
		end
	end

endmodule