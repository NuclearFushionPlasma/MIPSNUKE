module WB_register(
  input [31:0] next_data,
  input next_write_reg,
  input [4:0] next_add,
  input clk,reset,
  output  reg [31:0] data,
  output  reg write_reg,
  output  reg [4:0] add 
);
  always @(posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      data <= 0;
      write_reg <= 0;
		add <= 0;
    end
    else begin
      data <= next_data;
      write_reg <= next_write_reg;
		add <= next_add;
    end
  end
endmodule