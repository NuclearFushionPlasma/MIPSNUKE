module logicCal(a,b,c,modeCho);
  input [31:0] a,b;
  output [31:0] c;
  input [1:0] modeCho;
  reg [31:0]c1;
  always @(a or b or modeCho)
  begin
    case(modeCho)
      2'b00 : c1 = a & b;
      2'b01 : c1 = a | b;
      2'b10 : c1 = a ^ b;
      2'b11 : c1 = ~(a | b);
      default : c1 = {32{1'b0}};
    endcase
  end
  assign c = c1;
endmodule

