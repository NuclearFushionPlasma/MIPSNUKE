module DFF1# (parameter DW = 32) (
input load_enable,
input [DW - 1 : 0] D_in,
output [DW - 1 : 0] D_out,
input clk,
input reset_low
);
  reg [DW - 1:0] D_work;
  always @(posedge clk or negedge reset_low)
    begin
      if(reset_low == 1'b0)
        D_work <= {DW{1'b0}};
      else if(load_enable == 1'b1)
        D_work <= D_in;
    end
    assign D_out = D_work;
endmodule