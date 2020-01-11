module add32(a,b,c,sum,c0);
  input [31:0] a,b;
  output[31:0] c;
  output sum;
  input c0;
  wire [3:0] insideP,insideG;
  wire [3:1] insideC;
  wire [3:0] nop;
  add8 a0(a[7:0],b[7:0],c[7:0],c0,nop[0],insideP[0],insideG[0]);
  add8 a1(a[15:8],b[15:8],c[15:8],insideC[1],nop[1],insideP[1],insideG[1]);
  add8 a2(a[23:16],b[23:16],c[23:16],insideC[2],nop[2],insideP[2],insideG[2]);
  add8 a3(a[31:24],b[31:24],c[31:24],insideC[3],nop[3],insideP[3],insideG[3]);
  assign insideC[1] = insideG[0] | insideP[0] & c0;
  assign insideC[2] = insideG[1] | insideP[1] & insideG[0] | insideP[1] & insideP[0] &c0;
  assign insideC[3] = insideG[2] | insideP[2] & insideG[1] | insideP[2] & insideP[1] & insideG[0] | insideP[2] & insideP[1] & insideP[0] & c0;
  assign sum = insideG[3] | insideP[3] & insideG[2] | insideP[3] & insideP[2] & insideG[1] | insideP[3] & insideP[2] & insideP[1] & insideG[0] | insideP[3] & insideP[2] & insideP[1] & insideP[0] & c0;
endmodule

  
