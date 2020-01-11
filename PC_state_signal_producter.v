module PC_state_signal_producter(next_PC,now_PC,enable);
  input  [31:0] now_PC;
  input enable;
  output reg [31:0] next_PC;
  wire [31:0] temp;
  addWith4 A(now_PC,temp);
  always @(*) begin
    next_PC = 0;
    if(enable == 1'b1) next_PC = temp;
  end
endmodule