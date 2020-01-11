module ALU_register(
  output [4:0] mode, reg_address,cal_add_A,cal_add_B,add_mem,
  output cal, load, store, write_reg, jump, enable, cmp, cmp_signed, lui,
  output[31:0] cal_A,cal_B,reg_data,mem_data,
  input [4:0] next_mode, next_reg_address,next_cal_add_A,next_cal_add_B,next_add_mem,
  input next_cal, next_load, next_store, next_write_reg, next_jump, next_enable, next_cmp, next_cmp_signed, next_lui,
  input [31:0] next_cal_A, next_cal_B,next_reg_data,next_mem_data, 
  input clk,reset
  );
  reg [4:0]  W_mode, W_reg_address,W_cal_add_A,W_cal_add_B,W_add_mem;
  reg W_cal, W_load, W_store, W_write_reg, W_jump, W_enable, W_cmp, W_cmp_signed,W_lui;
  reg [31:0] W_cal_A, W_cal_B, W_reg_data, W_mem_data;
  assign mode = W_mode;
  assign reg_address = W_reg_address;
  assign cal_add_A = W_cal_add_A;
  assign cal_add_B = W_cal_add_B;
  assign add_mem = W_add_mem;
  assign cal = W_cal;
  assign load = W_load;
  assign store = W_store;
  assign write_reg = W_write_reg;
  assign jump = W_jump;
  assign enable = W_enable;
  assign cmp = W_cmp;
  assign cmp_signed = W_cmp_signed;
  assign lui = W_lui;
  assign cal_A = W_cal_A;
  assign cal_B = W_cal_B;
  assign reg_data = W_reg_data;
  assign mem_data = W_mem_data;
  always @ (posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      W_mode <= 0;
      W_reg_address <= 0;
      W_cal_add_A <= 0;
      W_cal_add_B <= 0;
      W_add_mem <= 0;
      W_cal <= 0;
      W_load <= 0;
      W_store <= 0;
      W_write_reg <= 0;
      W_jump <= 0;
      W_enable <= 0;
      W_cmp <= 0;
      W_cmp_signed <= 0;
      W_lui <= 0;
      W_cal_A <= 0;
      W_cal_B <= 0;
      W_reg_data <= 0;
      W_mem_data <= 0;
    end
    else begin
      W_mode <= next_mode;
      W_reg_address <= next_reg_address;
      W_cal_add_A <= next_cal_add_A;
      W_cal_add_B <= next_cal_add_B;
      W_add_mem <= next_add_mem;
      W_cal <= next_cal;
      W_load <= next_load;
      W_store <= next_store;
      W_write_reg <= next_write_reg;
      W_jump <= next_jump;
      W_enable <= next_enable;
      W_cmp <= next_cmp;
      W_cmp_signed <= next_cmp_signed;
      W_lui <= next_lui;
      W_cal_A <= next_cal_A;
      W_cal_B <= next_cal_B;
      W_reg_data <= next_reg_data;
      W_mem_data <= next_mem_data;
    end
  end
endmodule
  