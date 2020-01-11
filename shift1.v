module shift1 #(parameter SI = 1)(a,b,mode,enable); //a is input node, while b is output node 
  input [31:0] a;
  input [1:0]mode;
  input enable;
  output [31:0] b;
  wire flag = a[31];
  reg [31:0]tempValue;
  always @(a or mode or enable)
  begin
    case(mode)
      2'b00 : tempValue = a>>SI;
      2'b01 : tempValue = a<<SI;
      2'b10 : tempValue = (a >>SI) | ({SI{flag}} << (31 - SI + 1));
      default: tempValue = 32'b0;
    endcase
  end
  assign b = (enable == 1'b1) ? tempValue : a;
endmodule
