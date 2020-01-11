module shiftUnit (a,b,c,mode); 
  input [31:0] a,b;
  input[1:0] mode;
  output [31:0] c;
  wire bigger;
  assign bigger = (b[31:5] == 27'b0) ? 1'b0:1'b1;
  reg [31:0]tempValue;
  wire flag;
  assign flag = (mode == 2'b10) ? a[31] : 1'b0;
  wire [31:0] tempValue1_2,tempValue2_4,tempValue4_8,tempValue8_16,endtempValue,endtempValue1;
  shift1 S1(a,tempValue1_2,mode,b[0]);
  shift2 S2(tempValue1_2,tempValue2_4,mode,b[1]);
  shift4 S4(tempValue2_4,tempValue4_8,mode,b[2]);
  shift8 S8(tempValue4_8,tempValue8_16,mode,b[3]);
  shift16 S16(tempValue8_16,endtempValue,mode,b[4]);
  assign endtempValue1 = {32{flag}};
  assign c = (bigger == 1'b1 ) ? endtempValue1: endtempValue;
endmodule   