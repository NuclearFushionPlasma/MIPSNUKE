module signed_compare_32bit(a,b,enable,bigger,equal,less);
  input [31:0] a,b;
  input enable;
  wire tb,te,tl;
  output bigger,equal,less;
  wire bigger1,equal1,less1;
  compare_32bit A(a,b,tb,te,tl);
  assign bigger1 = ((a[31] == 1'b0 && b[31] == 1'b1) || (a[31] == 1'b0 && b[31] == 1'b0 && tb == 1'b1) || (a[31] == 1'b1 && b[31] == 1'b1 && tb == 1'b1)) ?  1'b1 : 1'b0;
  assign less1 = ((a[31] == 1'b1 && b[31] == 1'b0) ||  (a[31] == 1'b0 && b[31] == 1'b0 && tl == 1'b1) || (a[31] == 1'b1 && b[31] == 1'b1 && tl == 1'b1))  ? 1'b1 : 1'b0;
  assign equal1 = (a == b ) ? 1'b1 : 1'b0;
  assign bigger = (enable == 1'b1) ?  bigger1: tb;
  assign equal = (enable == 1'b1) ? equal1:te;
  assign less = (enable == 1'b1) ? less1:tl;
endmodule
