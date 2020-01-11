module compare_1bit(a,b,bigger,equal,less);
  input a,b;
  output bigger,equal,less;
  reg bigger,equal,less;
  always @(a or b) begin
    bigger = 1'b0;
    equal = 1'b0;
    less = 1'b0;
    if(a == 1'b1 && b == 1'b0) bigger = 1'b1;
    else if(a == 1'b0 && b == 1'b1) less = 1'b1;
    else equal = 1'b1;
  end
endmodule