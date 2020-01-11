module addWith4(a,b);
  input [31:0] a;
  output [31:0] b;
  wire [31:0] tempValue;
  addWith1 A1({2'b0,a[31:2]},tempValue);
  assign b = {tempValue[29:0],a[1:0]};
endmodule