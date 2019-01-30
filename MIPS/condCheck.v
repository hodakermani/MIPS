module condCheck(input[31:0]val1, src2Val, input[1:0]BRType, output reg out);
	always@(val1, src2Val, BRType)begin
		case(BRType)
			2'd0:out = 1'd0;//other
			2'd1:begin//BEZ
				if(val1 == 0)
					out = 1'd1;
				else
					out = 1'd0;
			end
			2'd2:begin //BNE
				if(val1 != src2Val)
					out = 1'd1;
				else
					out = 1'd0;
			end
			2'd3: out = 1;//jmp
		endcase
	end
endmodule