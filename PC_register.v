module PC_register(
input [31:0] next_PC,
output [31:0] now_PC,
input clk,
input reset);
  reg [31:0] register_Work;
  assign now_PC = register_Work;
  always @(posedge clk or negedge reset) begin
    if(reset == 1'b0)
      register_Work <= 32'b0;
    else
      register_Work <= next_PC;
  end
endmodule