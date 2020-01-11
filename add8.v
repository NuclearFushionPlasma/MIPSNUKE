module add8(a,b,s,c0,c8,p,g);
	input [7:0] a,b;
	input c0;
	output c8,p,g;
	output [7:0] s;
	wire [7:0] insideP,insideG,insideC;
	add1 A1[7:0](a,b,{insideC[6:0],c0},insideP,insideG,s);
	LookAhead8 Ahead8(insideP,insideG,insideC,p,g,c0);
	assign c8 = insideC[7];
endmodule
	
	