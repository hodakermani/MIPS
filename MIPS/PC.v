module PC(input clk, rst, freez, input[31:0]in, output[31:0]out);
	reg[31:0]pc; 
	always@(posedge clk, posedge rst) begin
		if (rst) begin
			pc <= 32'd0;
		end
		else if(!freez) begin
			pc <= in;
		end
	end
	assign out = pc;
endmodule