module Reg(input clk,rst,input[31:0] PCin,output reg [31:0] PCout);
	
	always@(posedge clk,rst) begin
		if (rst) begin
			PCout = 32'd0;
		end
		else begin
			PCout = PCin;
		end
	end

endmodule
	