module SRAMCtrl(input clk, rst , Wr_EN, Read_EN, input[31:0] ADDR, writeData, output reg[63:0] readData, output freeze, inout[15:0] SRAM_DQ, output reg [17:0] SRAM_ADDR, output reg SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N);
  reg[2:0] counter;
  reg[15:0] tempData1, tempData2, tempData3;
  reg[15:0] dataDQ;
  initial begin
      counter=3'd0; SRAM_UB_N=0; SRAM_LB_N=0; SRAM_WE_N=1'd1; SRAM_CE_N=0; SRAM_OE_N=0;
  end
  always@(posedge clk)begin
    if(rst)begin
      SRAM_UB_N=0; SRAM_LB_N=0; SRAM_WE_N=1'd1; SRAM_CE_N=0; SRAM_OE_N=0;counter <= 0;
    end
    else begin      
      if(Wr_EN)begin
        counter = counter + 1;
        case(counter)
          3'd1:begin
           SRAM_ADDR <= {ADDR[18:2],1'd0};
           dataDQ <= writeData[15:0];
           SRAM_WE_N <= 1'd0;
          end
          3'd2:begin
            SRAM_ADDR <= {ADDR[18:2],1'd1};
            dataDQ <= writeData[31:16];
            SRAM_WE_N <= 1'd0;
          end
          3'd3: begin
				SRAM_WE_N <= 1'd1;
		  end
          3'd4: begin
            SRAM_WE_N <= 1'd1; 
		  end
          3'd5: SRAM_WE_N <= 1'd1;
          3'd6: begin counter <= 3'd0;SRAM_WE_N <= 1'd1; end
			endcase
      
      end else if(Read_EN) begin
			SRAM_WE_N <= 1;
        counter = counter + 1;
        case(counter)
          3'd1:begin
           SRAM_ADDR <= {ADDR[18:3],2'd0};
          end
          3'd2:begin
            SRAM_ADDR <= {ADDR[18:3],2'd1};
            tempData1 <= SRAM_DQ;
          end
          3'd3:begin
			SRAM_ADDR <= {ADDR[18:3],2'd2};
            tempData2 <= SRAM_DQ;
          end
          3'd4: begin
			SRAM_ADDR <= {ADDR[18:3],2'd3};
            tempData3 <= SRAM_DQ;
          end
          3'd5: begin
            readData <= {SRAM_DQ, tempData3,tempData2,tempData1};
          end 
          3'd6:;
			 3'd7: counter <= 3'd0;
			 endcase
      end else begin
			//counter <= 0;
			SRAM_WE_N <= 1;
		end
		end
	end
  //assign freeze = (counter <=  5) ? 0 : 1; 
  assign freeze = (counter == 5)?1:0;
  assign SRAM_DQ = Wr_EN ? dataDQ : 16'bzzzzzzzzzzzzzzzz;
    
endmodule