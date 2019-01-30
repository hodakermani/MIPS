module MUX10 (input[9:0] in1,in2,input sel , output [9:0] out);
	assign out = sel?in2:in1;
endmodule