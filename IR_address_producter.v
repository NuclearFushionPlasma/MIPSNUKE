module IR_address_producter(
  input [31:0] Ins,
  input enable,
  output reg [4:0] add_A,add_B,add_mem
  );
  wire [5:0] op = Ins[31:26];
  wire [5:0] funct = Ins[5:0];
  wire [4:0] rs = Ins[25:21];
  wire [4:0] rt = Ins[20:16];
  wire [4:0] rd = Ins[15:11];
  always @(*) begin
    add_A = (enable == 1'b1 ) ? rs : 5'b0;add_B =(enable == 1'b1) ?  rt : 5'b0;
	 add_mem = 0;
    casex({enable,op,funct})
      {1'b1,6'b0,6'b000000} : begin add_A = rt; add_B = 0; end //sll
      {1'b1,6'b0,6'b000010} : begin add_A = rt; add_B = 0; end //srl
      {1'b1,6'b0,6'b000011} : begin add_A = rt; add_B = 0; end //sra
      {1'b1,6'b0,6'b000100} : begin add_A = rt; add_B = rs; end //sllv
      {1'b1,6'b0,6'b000110} : begin add_A = rt; add_B = rs; end //srlv
      {1'b1,6'b0,6'b000111} : begin add_A = rt; add_B = rs; end //srav
      {1'b1,6'b0,6'b001000} : begin add_A = 0; add_B = 0; end //jr
      //-----------------------------------------------------------------------------------------------------------------------------
      {1'b1,6'b001000,6'bx} : begin add_A = rs; add_B = 0; end //addi
      {1'b1,6'b001001,6'bx} : begin add_A = rs; add_B = 0; end //addiu
      {1'b1,6'b001010,6'bx} : begin add_A = rs; add_B = 0; end //slti
      {1'b1,6'b001011,6'bx} : begin add_A = rs; add_B = 0; end  //sltiu
      {1'b1,6'b001100,6'bx} : begin add_A = rs; add_B = 0; end  //andi
      {1'b1,6'b001101,6'bx} : begin add_A = rs; add_B = 0; end  //ori
      {1'b1,6'b001110,6'bx} : begin add_A = rs; add_B = 0; end  //xori
      {1'b1,6'b001111,6'bx} : begin add_A = 0; add_B = 0; end  //lui
      {1'b1,6'b100011,6'bx} : begin add_A = rs; add_B = 0; end //lw
      {1'b1,6'b101011,6'bx} : begin add_A = rs; add_B = 0; add_mem = rt; end //sw
      {1'b1,6'b000100,6'bx} : begin add_A = rs; add_B = rt; end //beq
      {1'b1,6'b000101,6'bx} : begin add_A = rs; add_B = rt; end //bne
      //-----------------------------------------------------------------------------------------------------------------------------
      {1'b1,6'b000010,6'bx} : begin add_A = 0; add_B = 0; end //j
      {1'b1,6'b000011,6'bx} : begin add_A = 0; add_B = 0; end //jal
    endcase
  end                
endmodule
      
      
  
  
