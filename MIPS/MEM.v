module Memory(input clk, rst, WB_EN, MEMread, MEMwrite, input[31:0]address, data,output[31:0] readData, output ready, inout[15:0] SRAM_DQ, output[17:0] SRAM_ADDR, output SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N, WB_EN_out);
	wire freeze, sram_in_r_en, sram_in_w_en;
	wire[31:0] sram_in_addr, sram_in_data;
	wire[63:0] sram_out_data;
	
	//module CacheCtrl(input clk, rst, sram_ready, input[63:0] sram_rdata, input[31:0] addr, wdata, input MEM_R_EN, MEM_W_EN, output[31:0] rdata, output ready, output reg[31:0] sram_addr, sram_wdata, output reg sram_w_en, sram_r_en);
	CacheCtrl cache(clk, rst, freeze, sram_out_data, address, data, MEMread, MEMwrite, readData, ready, sram_in_addr, sram_in_data, sram_in_w_en, sram_in_r_en);
	
	//module SRAMCtrl(input clk, rst , Wr_EN, Read_EN, input[31:0] ADDR, writeData, output reg[63:0] readData, output freeze, inout[15:0] SRAM_DQ, output reg [17:0] SRAM_ADDR, output reg SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N);
	SRAMCtrl sram(clk, rst, sram_in_w_en, sram_in_r_en, sram_in_addr, sram_in_data, sram_out_data, freeze, SRAM_DQ, SRAM_ADDR, SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N);
	MUX1 mux1(WB_EN, 1'd0, ready, WB_EN_out);
	//assign WB_EN_out = WB_EN;
endmodule