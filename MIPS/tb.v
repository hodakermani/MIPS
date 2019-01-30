module tb();
	reg clk,rst, hazardEn;
	myMIPS my(clk,rst, hazardEn);
	initial begin
	  hazardEn = 0;
		clk = 0;
		rst = 0;
		#25 rst = ~rst;
		#30 rst = ~rst;
		repeat(600) #50 clk = ~clk;
	end
endmodule