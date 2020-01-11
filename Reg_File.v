module Reg_File(
  input [4:0] add_A,add_B,add_C,warp_Add_ALU,warp_Add_MEM,
  input[31:0] data_C,warp_ALU,warp_MEM,
  input clk,reset,write_enable,warp_ALU_enable,warp_MEM_enable,
  output reg [31:0] data_A,data_B);
  wire [31:0] data_A1,data_B1;
  Reg_Memory_File A(add_A,add_B,add_C,data_A1,data_B1,data_C,clk,reset,write_enable);
  always @(*) begin
    data_A = 0;
    if( warp_ALU_enable == 1'b1 && add_A == warp_Add_ALU) data_A = warp_ALU;
    else if(warp_MEM_enable== 1'b1 && add_A ==  warp_Add_MEM) data_A = warp_MEM;
    else if(write_enable == 1'b1 && add_A == add_C) data_A = data_C;
    else data_A = data_A1;
  end
  always @(*) begin
    data_B = 0;
    if(warp_ALU_enable == 1'b1 && add_B == warp_Add_ALU) data_B = warp_ALU;
    else if(warp_MEM_enable == 1'b1 && add_B ==  warp_Add_MEM) data_B = warp_MEM;
    else if(write_enable == 1'b1 && add_B == add_C) data_B = data_C;
    else data_B = data_B1;
  end
endmodule
    