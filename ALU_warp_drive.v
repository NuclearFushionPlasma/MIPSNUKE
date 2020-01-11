module ALU_warp_drive(
  input[31:0] data_in,warp_data_in,
  input[4:0] add_in,warp_add_in,
  input MEM_warp_enable,
  output [31:0] data_out
  );
  assign data_out = (warp_add_in == 0 || warp_add_in != add_in || MEM_warp_enable == 1'b0) ? data_in : warp_data_in;
endmodule  