
module RegisterFile (input clk, rst, input[4:0] src1, src2, Dest_wb, input[31:0] Result_WB, input writeBackEn, output [31:0] reg1,reg2);
	reg[31:0] RegFile[0:31];
	integer i;
	initial begin
		for(i=0; i<32; i= i+1)
			RegFile[i] = 0;
	end

	assign reg1 = RegFile[src1];
	assign reg2 = RegFile[src2];

	//write back
	always@(negedge clk, posedge rst)begin
		if(rst)begin
			for(i=0; i<32; i= i+1)
				RegFile[i] = 32'd0;
		end
		else if(writeBackEn && Dest_wb != 0)begin
			RegFile[Dest_wb] = Result_WB;
		end
	end
endmodule