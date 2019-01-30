module inst_mem(input clk, rst, input[31:0]addr, output[31:0]out);
	reg [31:0] ram [0:1023]; //2 ^ 10 = 1024
	wire[31:0] addr_temp;
	always@(*)begin
	if(rst)begin
		{ram[32'd0],ram[32'd1],ram[32'd2],ram[32'd3]} = 32'b10000000000000010000011000001010;//-- Addi r1 ,r0 ,1546 //2
		{ram[32'd4],ram[32'd5],ram[32'd6],ram[32'd7]} = 32'b000001_00000_00001_00010_00000000000;//-- Add r2 ,r0 ,r1
		{ram[32'd8],ram[32'd9],ram[32'd10],ram[32'd11]} = 32'b000011_00000_00001_00011_00000000000;//-- sub r3 ,r0 ,r1
		{ram[32'd12],ram[32'd13],ram[32'd14],ram[32'd15]} = 32'b00010100010000110010000000000000; //and r4,r2,r3 //1
		{ram[32'd16],ram[32'd17],ram[32'd18],ram[32'd19]} = 32'b10000100011001010001101000110100; //subi r5,r3,6708 
		{ram[32'd20],ram[32'd21],ram[32'd22],ram[32'd23]} = 32'b00011000011001000010100000000000; //or r5,r3,r4 //2
		{ram[32'd24],ram[32'd25],ram[32'd26],ram[32'd27]} = 32'b00011100101000000011000000000000; //nor r6,r5,r0
		{ram[32'd28],ram[32'd29],ram[32'd30],ram[32'd31]} = 32'b00011100100000000101100000000000; //nor r11,r4,r0
		{ram[32'd32],ram[32'd33],ram[32'd34],ram[32'd35]} = 32'b00001100101001010010100000000000; //sub r5,r5,r5
		{ram[32'd36],ram[32'd37],ram[32'd38],ram[32'd39]} = 32'b10000000000000010000010000000000; //addi r1,r0,1024 //2
		{ram[32'd40],ram[32'd41],ram[32'd42],ram[32'd43]} = 32'b10010100001000100000000000000000;//-- st r2 ,r1 ,0
		{ram[32'd44],ram[32'd45],ram[32'd46],ram[32'd47]} = 32'b100100_00001_00101_00000_00000000000;//-- ld r5 ,r1 ,0 //2
		{ram[32'd48],ram[32'd49],ram[32'd50],ram[32'd51]} = 32'b101000_00101_00000_00000_00000000001;//-- Bez r5 ,1
		{ram[32'd52],ram[32'd53],ram[32'd54],ram[32'd55]} = 32'b001000_00101_00001_00111_00000000000;//-- xor r7 ,r5 ,r1
		{ram[32'd56],ram[32'd57],ram[32'd58],ram[32'd59]} = 32'b001000_00101_00001_00000_00000000000;//-- xor r0 ,r5 ,r1
		{ram[32'd60],ram[32'd61],ram[32'd62],ram[32'd63]} = 32'b001001_00011_01011_00111_00000000000;//-- sla r7 ,r3 ,r11
		{ram[32'd64],ram[32'd65],ram[32'd66],ram[32'd67]} = 32'b001010_00011_01011_01000_00000000000;//-- sll r8 ,r3 ,r11
		{ram[32'd68],ram[32'd69],ram[32'd70],ram[32'd71]} = 32'b001011_00011_00100_01001_00000000000;//-- sra r9 ,r3 ,r4
		{ram[32'd72],ram[32'd73],ram[32'd74],ram[32'd75]} = 32'b001100_00011_00100_01010_00000000000;//-- srl r10 ,r3 ,r4
		{ram[32'd76],ram[32'd77],ram[32'd78],ram[32'd79]} = 32'b100101_00001_00011_00000_00000000100;//-- st r3 ,r1 ,4
		{ram[32'd80],ram[32'd81],ram[32'd82],ram[32'd83]} = 32'b100101_00001_00100_00000_00000001000;//-- st r4 ,r1 ,8
		{ram[32'd84],ram[32'd85],ram[32'd86],ram[32'd87]} = 32'b100101_00001_00101_00000_00000001100;//-- st r5 ,r1 ,12
		{ram[32'd88],ram[32'd89],ram[32'd90],ram[32'd91]} = 32'b100101_00001_00110_00000_00000010000;//-- st r6 ,r1 ,16
		{ram[32'd92],ram[32'd93],ram[32'd94],ram[32'd95]} = 32'b100100_00001_01011_00000_00000000100;//-- ld r11 ,r1 ,4
		{ram[32'd96],ram[32'd97],ram[32'd98],ram[32'd99]} = 32'b100101_00001_00111_00000_00000010100;//-- st r7 ,r1 ,20
		{ram[32'd100],ram[32'd101],ram[32'd102],ram[32'd103]} = 32'b100101_00001_01000_00000_00000011000;//-- st r8 ,r1 ,24
		{ram[32'd104],ram[32'd105],ram[32'd106],ram[32'd107]} = 32'b100101_00001_01001_00000_00000011100;//-- st r9 ,r1 ,28
		{ram[32'd108],ram[32'd109],ram[32'd110],ram[32'd111]} = 32'b100101_00001_01010_00000_00000100000;//-- st r10 ,r1 ,32 
		{ram[32'd112],ram[32'd113],ram[32'd114],ram[32'd115]} = 32'b100101_00001_01011_00000_00000100100;//-- st r11 ,r1 ,36
		{ram[32'd116],ram[32'd117],ram[32'd118],ram[32'd119]} = 32'b100000_00000_00001_00000_00000000011;//-- Addi r1 ,r0 ,3
		{ram[32'd120],ram[32'd121],ram[32'd122],ram[32'd123]} = 32'b100000_00000_00100_00000_10000000000;//-- Addi r4 ,r0 ,1024    
		{ram[32'd124],ram[32'd125],ram[32'd126],ram[32'd127]} = 32'b100000_00000_00010_00000_00000000000;//-- Addi r2 ,r0 ,0
		{ram[32'd128],ram[32'd129],ram[32'd130],ram[32'd131]} = 32'b100000_00000_00011_00000_00000000001;//-- Addi r3 ,r0 ,1 //1
		{ram[32'd132],ram[32'd133],ram[32'd134],ram[32'd135]} = 32'b100000_00000_01001_00000_00000000010;//-- Addi r9 ,r0 ,2 //2
		{ram[32'd136],ram[32'd137],ram[32'd138],ram[32'd139]} = 32'b001010_00011_01001_01000_00000000000;//-- sll r8 ,r3 ,r9 //2 
		{ram[32'd140],ram[32'd141],ram[32'd142],ram[32'd143]} = 32'b000001_00100_01000_01000_00000000000;//-- Add r8 ,r4 ,r8 //2
		{ram[32'd144],ram[32'd145],ram[32'd146],ram[32'd147]} = 32'b100100_01000_00101_00000_00000000000;//-- ld r5 ,r8 ,0 //1 
		{ram[32'd148],ram[32'd149],ram[32'd150],ram[32'd151]} = 32'b100100_01000_00110_11111_11111111100;//-- ld r6 ,r8 ,-4 //2
		{ram[152],ram[153],ram[154],ram[155]}  = 32'b000011_00101_00110_01001_00000000000;//-- sub r9 ,r5 ,r6 
		{ram[156],ram[157],ram[158],ram[159]}  = 32'b100000_00000_01010_10000_00000000000;//-- Addi r10 ,r0 ,0x8000
		{ram[160],ram[161],ram[162],ram[163]}  = 32'b100000_00000_01011_00000_00000010000;//-- Addi r11 ,r0 ,16 //2
		{ram[164],ram[165],ram[166],ram[167]}  = 32'b001010_01010_01011_01010_00000000000;//-- sll r10 ,r1 ,r11 //2 
		{ram[168],ram[169],ram[170],ram[171]}  = 32'b000101_01001_01010_01001_00000000000;//-- And r9 ,r9 ,r10 //2 
		{ram[172],ram[173],ram[174],ram[175]}  = 32'b101000_01001_00000_00000_00000000010;//-- Bez r9 ,2
		{ram[176],ram[177],ram[178],ram[179]}  = 32'b100101_01000_00101_11111_11111111100;//-- st r5 ,r8 ,-4 
		{ram[180],ram[181],ram[182],ram[183]}  = 32'b100101_01000_00110_00000_00000000000;//-- st r6 ,r8 ,0
		{ram[184],ram[185],ram[186],ram[187]}  = 32'b100000_00011_00011_00000_00000000001;//-- Addi r3 ,r3 ,1 //2
		{ram[188],ram[189],ram[190],ram[191]}  = 32'b101001_00001_00011_11111_11111110001;//-- BNE r1 ,r3 ,-15
		{ram[192],ram[193],ram[194],ram[195]}  = 32'b100000_00010_00010_00000_00000000001;//-- Addi r2 ,r2 ,1 //2
		{ram[196],ram[197],ram[198],ram[199]}  = 32'b101001_00001_00010_11111_11111101110;//-- BNE r1 ,r2 ,-18
		{ram[200],ram[201],ram[202],ram[203]}  = 32'b100000_00000_00001_00000_10000000000;//-- Addi r1 ,r0 ,1024 //2
		{ram[204],ram[205],ram[206],ram[207]}  = 32'b100100_00001_00010_00000_00000000000;//-- ld ,r2 ,r1 ,0
		{ram[208],ram[209],ram[210],ram[211]}  = 32'b100100_00001_00011_00000_00000000100;//-- ld ,r3 ,r1 ,4
		{ram[212],ram[213],ram[214],ram[215]}  = 32'b100100_00001_00100_00000_00000001000;//-- ld ,r4 ,r1 ,8
		{ram[216],ram[217],ram[218],ram[219]}  = 32'b100100_00001_00100_00000_01000001000;//-- ld ,r4 ,r1 ,520
		{ram[220],ram[221],ram[222],ram[223]}  = 32'b100100_00001_00100_00000_10000001000;//-- ld ,r4 ,r1 ,1023 
		{ram[224],ram[225],ram[226],ram[227]}  = 32'b100100_00001_00101_00000_00000001100;//-- ld ,r5 ,r1 ,12
		{ram[228],ram[229],ram[230],ram[231]}  = 32'b100100_00001_00110_00000_00000010000;//-- ld ,r6 ,r1 ,16 
		{ram[232],ram[233],ram[234],ram[235]}  = 32'b100100_00001_00111_00000_00000010100;//-- ld ,r7 ,r1 ,20
		{ram[236],ram[237],ram[238],ram[239]}  = 32'b100100_00001_01000_00000_00000011000;//-- ld ,r8 ,r1 ,24
		{ram[240],ram[241],ram[242],ram[243]}  = 32'b100100_00001_01001_00000_00000011100;//-- ld ,r9 ,r1 ,28
		{ram[244],ram[245],ram[246],ram[247]}  = 32'b100100_00001_01010_00000_00000100000;//-- ld ,r10,r1 ,32 
		{ram[248],ram[249],ram[250],ram[251]}  = 32'b100100_00001_01011_00000_00000100100;//-- ld ,r11,r1 ,36 
    {ram[252],ram[253],ram[254],ram[255]}  = 32'b101010_00000_00000_11111_11111111111;//-- JMP -1*/

		
	end
	end
	assign addr_temp = (addr>>2)<<2;
	assign out = {ram[addr_temp],ram[addr_temp+1],ram[addr_temp+2],ram[addr_temp+3]};
endmodule