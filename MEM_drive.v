module MEM_drive(
  input [31:0] address,
  input load,store,clk,
  output [31:0] mem_data_recive,
  input [31:0] mem_data_output
  output clk_mem;
  
  );
  assign mem_data_recive = 0;
endmodule
  