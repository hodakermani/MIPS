module addPC(input[31:0]PC, offset, output reg[31:0]out);
	always@(PC, offset)begin
		out <= PC + {offset[29:0], 2'd0};
	end
endmodule