module ALU (input[31:0] in1,in2, input[3:0]exeCMD, output reg[31:0]out);
	always@(exeCMD, in1, in2)begin
		case(exeCMD)
			4'd1: out <= in1+in2;
			4'd2: out <= in1-in2;
			4'd3: out <= in1&in2;
			4'd4: out <= in1|in2;
			4'd5: out <= ~(in1 | in2);
			4'd6: out <= in1^in2;
			4'd9: out <= $signed(in1)>>>in2;
			4'd10: out <= $signed(in1)>>>in2;
			4'd7: out <= in1<<in2;
			4'd8: out <= in1<<in2;
		endcase
	end
endmodule