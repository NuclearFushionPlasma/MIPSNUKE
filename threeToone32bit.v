module threeToone32bit(a,b,c,d,mode);
  input [31:0] b,c,d;
  input [1:0] mode;
  output [31:0] a;
  reg [31:0] temp;
  always @(b or c or d or mode)begin
    case(mode)
      2'b00: temp = b;
      2'b01: temp = c;
      2'b10: temp = d;
      default: temp = 32'b0;
    endcase
  end
  assign a = temp;
endmodule