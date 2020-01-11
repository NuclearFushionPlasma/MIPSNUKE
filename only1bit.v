module only1bit (a,sum,c);
  input a,c;
  output sum;
  assign sum = a ^c;
endmodule