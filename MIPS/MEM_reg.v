module MEM_reg(input freeze, clk, rst, WB_en_in, MEM_R_en_in, input[31:0] ALU_result_in, Mem_read_value_in, input[4:0] Dest_in, output reg WB_en, MEM_R_en, output reg[31:0] ALU_result, Mem_read_value, output reg[4:0] Dest);
	initial begin
		WB_en=1'd0; MEM_R_en=1'd0; ALU_result=32'd0; Mem_read_value=32'd0;Dest = 5'd0;
	end
	always@(posedge clk)begin
		if (rst) begin
			WB_en=1'd0; MEM_R_en=1'd0; ALU_result=32'd0; Mem_read_value=32'd0;Dest = 5'd0;
		end
		else if(!freeze) begin
			WB_en <= WB_en_in;
			MEM_R_en <= MEM_R_en_in;
			ALU_result <= ALU_result_in;
			Mem_read_value <= Mem_read_value_in;
			Dest <= Dest_in;
		end
		
	end
endmodule