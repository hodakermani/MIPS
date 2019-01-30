
module MUX5 (input[4:0] in1,in2,input sel , output[4:0] out);
	assign out = sel?in1:in2;
endmodule
	