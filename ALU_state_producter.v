module ALU_state_producter(
  input [31:0] ALU_in,
  input [31:0] reg_data_in,
  input cal,load,store,write_reg_in,jump,enable,cmp,cmp_signed,lui,cmp_effe,
  output reg [31:0] reg_data,
  output reg [31:0] mem_address,
  output reg [31:0] next_PC,
  output reg cancel,
  output reg write_reg
  );
  wire cmp1 = cmp | cmp_signed;
  always @(*) begin
    reg_data = reg_data_in; mem_address = 0;  next_PC = 0;  cancel = 0;write_reg = write_reg_in;
    casex ({enable,cal,jump,cmp1,load,store,lui})
      {7'b1100000} : begin reg_data = ALU_in;end //add addu sub subu and or xor nor sll srl sra sllv srlv srav addi addiu andi ori xori
      {7'b1001000} : begin reg_data = (cmp_effe == 1'b1) ? 32'b1 : 32'b0; end //slt sltu slti sltiu
      {7'b1100100} : begin mem_address = ALU_in; write_reg = 1; end //load
      {7'b1110000} : begin next_PC = ALU_in; cancel = 1; end //beq bne
      {7'b1100010} : begin mem_address = ALU_in; end //store
    endcase
  end
endmodule
      
  