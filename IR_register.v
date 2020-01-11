module IR_register(
  input [31:0] next_Ins,
  input next_enable,
  input [31:0] next_PC,
  output [31:0] now_Ins,
  output now_enable,
  output[31:0] now_PC,
  input clk,
  input reset);
  reg [31:0] IR_Work,PC_Work;
  reg effective;
  assign now_Ins = IR_Work;
  assign now_enable = effective;
  assign now_PC = PC_Work;
  always@(posedge clk or negedge reset) begin
    if(reset == 1'b0) begin
      IR_Work <= 0;
      PC_Work <= 0;
      effective <= 0;
    end
    else begin
      IR_Work <= next_Ins;
      PC_Work <= next_PC;
      effective <= next_enable;
    end
  end
endmodule
    