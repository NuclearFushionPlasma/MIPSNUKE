module oneTothree32bit(a,b,c,d,mode);
  input [1:0] mode;
  input [31:0] a;
  output [31:0] b,c,d;
  assign b = (mode == 2'b00) ? a: 32'b0;
  assign c = (mode == 2'b01) ? a : 32'b0;
  assign d = (mode == 2'b10) ? a : 32'b0;
endmodule 