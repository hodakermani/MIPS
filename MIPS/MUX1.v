module MUX1 (input in1,in2,input sel , output out);
	assign out = sel?in2:in1;
endmodule
