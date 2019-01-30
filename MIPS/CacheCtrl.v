module CacheCtrl(input clk, rst, sram_ready, input[63:0] sram_rdata, input[31:0] addr, wdata, 
  input MEM_R_EN, MEM_W_EN, output reg[31:0] rdata, output reg freeze,
  output reg[31:0] sram_addr, sram_wdata, output reg sram_w_en, sram_r_en);
  reg[63:0] data0[0:63];
  reg[63:0] data1[0:63];
  reg[8:0] tag0[0:63];
  reg[8:0] tag1[0:63];
  reg[63:0] valid0;
  reg[63:0] valid1;
  reg[63:0] LRU;
  integer i;
  reg hit0, hit1, hit, ready,cache_ready;
  wire temp;
  reg[63:0] temp1;
  always@(*)begin
	  hit0 <= (addr[17:9] == tag0[addr[8:3]] && valid0[addr[8:3]]) ? 1 : 0;
	  hit1 <= (addr[17:9] == tag1[addr[8:3]] && valid1[addr[8:3]]) ? 1 : 0;

	  hit <= MEM_W_EN ? 0 : hit0 || hit1 || (!(MEM_R_EN || MEM_W_EN));
	  freeze <= !(sram_ready || hit); //1-> freeze in registers

	  if(hit)begin
		  if(hit0)begin
				temp1 <= data0[addr[8:3]];
				if(addr[2] == 0)
					rdata <= temp1[31:0];
				else
					rdata <= temp1[63:32];
		  end
		  else if(hit1)begin
				temp1 <= data1[addr[8:3]];
				if(addr[2] == 0)
					rdata <= temp1[31:0];
				else
					rdata <= temp1[63:32];
		  end
		end
		else if(sram_ready && MEM_R_EN)begin
			if(addr[2] == 0)
				rdata <= sram_rdata[31:0];
			else
				rdata <= sram_rdata[63:32];

		end

	end

  always@(posedge clk) begin
    if (rst) begin
        sram_addr <= 32'd0;
        sram_wdata <= 32'd0;
        sram_w_en <= 1'd0;
        sram_r_en <= 1'd0;
		for(i = 0; i < 64; i=i+1 )begin
				tag0[i] <= 9'd0;
				tag1[i] <= 9'd0;
				data0[i] <= 64'd0;
				data1[i] <= 64'd0;
				valid0[i] <= 0;
				valid1[i] <= 0;
				LRU[i] <= 0;
		end
	end


    else if (MEM_W_EN) begin
			sram_addr <= addr;
			sram_wdata <= wdata;
			sram_w_en <= MEM_W_EN;
			sram_r_en <= MEM_R_EN;

			if (hit0) begin
				valid0[addr[8:3]] <= 1'd0;
			end
			else if(hit1)begin
				valid1[addr[8:3]] <= 1'd0;
			end
    end

    else if (MEM_R_EN) begin
			if (!hit) begin
			  sram_addr <= addr;
			  sram_w_en <= MEM_W_EN;
			  sram_r_en <= MEM_R_EN;
			end

			else if(hit)begin
				if (hit0)
					LRU[addr[8:3]] <= 1'd1;
				else
					LRU[addr[8:3]] <= 1'd0;
			end
    end
	 if(sram_ready)begin
		sram_w_en <= 0;
		sram_r_en <= 0;
	 end

	 if (LRU[addr[8:3]] == 0 && MEM_R_EN && !hit && sram_ready) begin
				data0[addr[8:3]] <= sram_rdata;
				LRU[addr[8:3]] <= 1'd1;
				valid0[addr[8:3]] <= 1'd1;
				tag0[addr[8:3]] <= addr[17:9];
	end
	else if (LRU[addr[8:3]] == 1 && MEM_R_EN && !hit && sram_ready) begin
				data1[addr[8:3]] <= sram_rdata;
				LRU[addr[8:3]] <= 1'd0;
				valid1[addr[8:3]] <= 1'd1;
				tag1[addr[8:3]] <= addr[17:9];
	end

  end
endmodule
