module MEM_register(
  output [31:0] reg_data, mem_data, mem_address, 
  output load, store, write_reg, enable, 
  output [4:0] reg_address, 
  input [31:0] next_reg_data, next_mem_data, next_mem_address, 
  input next_load, next_store, next_write_reg, next_enable, 
  input [4:0] next_reg_address, 
  input clk, reset
  );
  reg [31:0] W_reg_data, W_mem_data, W_mem_address;
  reg W_load, W_store, W_write_reg, W_enable;
  reg [4:0] W_reg_address;
  assign reg_data = W_reg_data;
  assign mem_data = W_mem_data;
  assign mem_address = W_mem_address;
  assign load = W_load;
  assign store = W_store;
  assign write_reg = W_write_reg;
  assign enable = W_enable;
  assign reg_address = W_reg_address;
  always @ (posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      W_reg_data <= 0;
      W_mem_data <= 0;
      W_mem_address <= 0;
      W_load <= 0;
      W_store <= 0;
      W_write_reg <= 0;
      W_enable <= 0;
      W_reg_address <= 0;
    end
    else begin
      W_reg_data <= next_reg_data;
      W_mem_data <= next_mem_data;
      W_mem_address <= next_mem_address;
      W_load <= next_load;
      W_store <= next_store;
      W_write_reg <= next_write_reg;
      W_enable <= next_enable;
      W_reg_address <= next_reg_address;
    end
  end
endmodule
      
  
  
  