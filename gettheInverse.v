module gettheInverse(a,b,enable);
  input [31 : 0] a;
  output [31:0] b;
  input enable;
  wire [31:0] cal1,cal2;
  assign cal1 = ~a;
  addWith1 A1(cal1,cal2);
  assign b = (enable == 1'b1) ? cal2 : a;
endmodule