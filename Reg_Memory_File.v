module Reg_Memory_File(add_A,add_B,add_C,data_A,data_B,data_C,clk,reset,write_enable);
  reg [31:0] memoryfile[31:0];
  input [4:0] add_A,add_B,add_C;
  input [31:0] data_C;
  input write_enable;
  input clk,reset;
  output [31:0] data_A,data_B;
  assign data_A = (add_A != add_C) ? memoryfile[add_A]:32'b0;
  assign data_B = (add_B != add_C) ? memoryfile[add_B]:32'b0;
  always @(negedge clk or  negedge reset) begin
    if(reset == 1'b0) begin
      memoryfile[31] <= 0;
      memoryfile[30] <= 0;
      memoryfile[29] <= 0;
      memoryfile[28] <= 0;
      memoryfile[27] <= 0;
      memoryfile[26] <= 0;
      memoryfile[25] <= 0;
      memoryfile[24] <= 0;
      memoryfile[23] <= 0;
      memoryfile[22] <= 0;
      memoryfile[21] <= 0;
      memoryfile[20] <= 0;
      memoryfile[19] <= 0;
      memoryfile[18] <= 0;
      memoryfile[17] <= 0;
      memoryfile[16] <= 0;
      memoryfile[15] <= 0;
      memoryfile[14] <= 0;
      memoryfile[13] <= 0;
      memoryfile[12] <= 0;
      memoryfile[11] <= 0;
      memoryfile[10] <= 0;
      memoryfile[9] <= 0;
      memoryfile[8] <= 0;
      memoryfile[7] <= 0;
      memoryfile[6] <= 0;
      memoryfile[5] <= 0;
      memoryfile[4] <= 0;
      memoryfile[3] <= 0;
      memoryfile[2] <= 0;
      memoryfile[1] <= 0;
      memoryfile[0] <= 0;
    end
   else begin
     if(write_enable == 1'b1 && add_C != 0) memoryfile[add_C] <= data_C;
   end
  end
endmodule
  
    

    
