module myMIPS(input clk, input rst, input hazardEn);
  wire[17:0] sw;
  assign sw = {14'd0,hazardEn,rst,2'd0};
	MIPS mips(.CLOCK_50(clk), .SW(sw));
endmodule