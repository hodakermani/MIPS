module CalcMemAddress(input[31:0] addrIN, output[31:0] addrOut);
	wire[31:0] tempOut;
	assign tempOut = addrIN - 1024;
	assign addrOut = {2'd0,tempOut[31:2]};
endmodule