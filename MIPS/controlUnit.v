module controlUnit (input[5:0] opcode,output reg WB_en, isImmediate, memRead, memWrite, output reg[3:0]executeCMD, output reg[1:0]BR,output reg twoSoursec);
	always@(opcode)begin
	{WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'd0;
	case(opcode)
		6'd0 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'd0; end //NOp
		6'd1 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000001001; end //ADD
		6'd3 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000010001; end //SUB
		6'd5 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000011001; end //AND
		6'd6 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000100001; end //OR
		6'd7 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000101001; end //NOR
		6'd8 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000110001; end //XOR
		6'd9 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10000111001; end //SHIFT LEFT
		6'd10 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10001000001; end //SLL SHIFT LEFT LOGIC
		6'd11: begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10001001001; end //SHIFT RIGHT SRA
		6'd12: begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b10001010001; end //SHIFT RIGHT LOGIC
		6'd32 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b11000001000; end //ADDI
		6'd33 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b11000010000; end //SUBI
		6'd36 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b11100001000; end //LD
		6'd37 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b01010001001; end //ST mem(rs1+offsert)<= rs
		6'd40 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b01000000010; end //BEZ 
		6'd41 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b01000000101; end //BNE
		6'd42 : begin {WB_en, isImmediate, memRead, memWrite, executeCMD,BR,twoSoursec} = 11'b01000000110; end //JMP
	endcase
	end
endmodule