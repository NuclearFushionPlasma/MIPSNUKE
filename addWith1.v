module addWith1(a,b);
  input [31:0] a;
  output[31:0] b;
  wire [31:1] c;
  wire nop1,nop2;
  only1bit A1[31:1](a[31:1],b[31:1],c[31:1]);
  add1 B1(a[0] ,1'b1,1'b0,nop1,nop2,b[0]);
  assign c[1] = a[0];
  assign c[2] = a[1]&a[0];
  assign c[3] = a[2]&a[1]&a[0];
  assign c[4] = a[3]&a[2]&a[1]&a[0];
  assign c[5] = a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[6] = a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[7] = a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[8] = a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[9] = a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[10] = a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[11] = a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[12] = a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[13] = a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[14] = a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[15] = a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[16] = a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[17] = a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[18] = a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[19] = a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[20] = a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[21] = a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[22] = a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[23] = a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[24] = a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[25] = a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[26] = a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[27] = a[26]&a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[28] = a[27]&a[26]&a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[29] = a[28]&a[27]&a[26]&a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[30] = a[29]&a[28]&a[27]&a[26]&a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
  assign c[31] = a[30]&a[29]&a[28]&a[27]&a[26]&a[25]&a[24]&a[23]&a[22]&a[21]&a[20]&a[19]&a[18]&a[17]&a[16]&a[15]&a[14]&a[13]&a[12]&a[11]&a[10]&a[9]&a[8]&a[7]&a[6]&a[5]&a[4]&a[3]&a[2]&a[1]&a[0];
endmodule
  