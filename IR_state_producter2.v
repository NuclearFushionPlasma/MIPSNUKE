module IR_state_producter2(
  input[31:0] Ins,PC,reg_A,reg_B, 
  input enable,
  output reg [31:0] next_PC,reg_data,mem_data,
  output reg cancel,write_reg,
  output reg [4:0] mode,reg_address,
  output reg load,store,cal,cmp,cmp_signed,jump,
  output reg [31:0]  cal_A,cal_B,
  output reg lui
  ); 
  wire [31:0] PC4; 
  addWith4 A(PC,PC4); 
  wire [4:0] shamt = Ins[10:6]; 
  wire [15:0] im = Ins[15:0]; 
  wire [25:0] address = Ins[25:0]; 
  wire [5:0] op = Ins[31:26]; 
  wire [5:0] funct = Ins[5:0]; 
  wire [4:0] rd = Ins[15:11]; 
  wire [4:0] rt = Ins[20:16];
  wire [25:0] jumpaddr = Ins[25:0];
  wire equal;
  Is_equal B(reg_A,reg_B,equal);
  always @(*) begin
    next_PC = 0; cancel = 0; mode = 0; reg_address = 0; load = 0; store = 0; cal = 0; cmp = 0; cmp_signed = 0;  cal_A = 0; cal_B = 0; write_reg = 0;lui = 0;reg_data = 0; mem_data = 0;jump = 0; //???
    casex({enable,op,funct})
      {1'b1,6'b0,6'b100000} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1;  reg_address = rd; write_reg = 1; end //add
      {1'b1,6'b0,6'b100001} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1;  reg_address = rd; write_reg = 1; end //addu
      {1'b1,6'b0,6'b100010} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 1; cal = 1;  reg_address = rd; write_reg = 1; end //sub
      {1'b1,6'b0,6'b100011} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 1; cal = 1;  reg_address = rd; write_reg = 1; end //subu
      {1'b1,6'b0,6'b101010} : begin cal_A = reg_A; cal_B = reg_B; cmp_signed = 1;  reg_address = rd; write_reg = 1; end //slt
      {1'b1,6'b0,6'b101011} : begin cal_A = reg_A; cal_B = reg_B; cmp = 1; reg_address = rd; write_reg = 1; end //sltu
      {1'b1,6'b0,6'b100100} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b10; mode[2:1] = 2'b00; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //and
      {1'b1,6'b0,6'b100101} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b10; mode[2:1] = 2'b01; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //or
      {1'b1,6'b0,6'b100110} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b10; mode[2:1] = 2'b10; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //xor
      {1'b1,6'b0,6'b100111} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b10; mode[2:1] = 2'b11; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //nor
      {1'b1,6'b0,6'b000000} : begin cal_A = reg_A; cal_B = {27'b0,shamt}; mode[4:3] = 2'b01; mode[2:1] = 2'b01; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //sll
      {1'b1,6'b0,6'b000010} : begin cal_A = reg_A; cal_B = {27'b0,shamt}; mode[4:3] = 2'b01; mode[2:1] = 2'b00; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //srl
      {1'b1,6'b0,6'b000011} : begin cal_A = reg_A; cal_B = {27'b0,shamt}; mode[4:3] = 2'b01; mode[2:1] = 2'b10; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //sra
      {1'b1,6'b0,6'b000100} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b01; mode[2:1] = 2'b01; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //sllv
      {1'b1,6'b0,6'b000110} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b01; mode[2:1] = 2'b00; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //srlv
      {1'b1,6'b0,6'b000111} : begin cal_A = reg_A; cal_B = reg_B; mode[4:3] = 2'b01; mode[2:1] = 2'b10; mode[0] = 0; cal = 1; reg_address = rd; write_reg = 1; end //srav
      {1'b1,6'b0,6'b001000} : begin next_PC = reg_A;cancel = 1;end //jr
      //-----------------------------------------------------------------------------------------------------------------------------------------------
      {1'b1,6'b001000,6'bx} : begin cal_A = reg_A; cal_B = {{16{im[15]}},im}; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1;  reg_address = rt; write_reg = 1; end //addi
      {1'b1,6'b001001,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1;  reg_address = rt; write_reg = 1; end //addiu
      {1'b1,6'b001010,6'bx} : begin cal_A = reg_A; cal_B = {{16{im[15]}},im}; cmp_signed = 1;  reg_address = rt; write_reg = 1; end //slti
      {1'b1,6'b001011,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; cmp = 1;  reg_address = rt; write_reg = 1; end //sltiu
      {1'b1,6'b001100,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; mode[4:3] = 2'b10; mode[2:1] = 2'b00; mode[0] = 0; cal = 1; reg_address = rt; write_reg = 1; end //andi
      {1'b1,6'b001101,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; mode[4:3] = 2'b10; mode[2:1] = 2'b01; mode[0] = 0; cal = 1; reg_address = rt; write_reg = 1; end //ori
      {1'b1,6'b001110,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im};  mode[4:3] = 2'b10; mode[2:1] = 2'b10; mode[0] = 0; cal = 1; reg_address = rt; write_reg = 1; end //xori
      {1'b1,6'b001111,6'bx} : begin reg_data = {im,16'b0}; reg_address = rt; write_reg = 1; lui = 1; end // lui
      {1'b1,6'b100011,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; reg_address = rt; load = 1; end //load
      {1'b1,6'b101011,6'bx} : begin cal_A = reg_A; cal_B = {16'b0,im}; mem_data = reg_B; store = 1; end //store     
      {1'b1,6'b000100,6'bx} : begin jump = equal; cal_A = PC4; cal_B = {14'b0,im,2'b0}; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1; end // beq
      {1'b1,6'b000101,6'bx} : begin jump = ~equal; cal_A = PC4; cal_B = {14'b0,im,2'b0}; mode[4:3] = 2'b0; mode[2:1] = 2'b0; mode[0] = 0; cal = 1; end // bne
      //-----------------------------------------------------------------------------------------------------------------------------------------------
      {1'b1,6'b000010,6'bx} : begin next_PC = {PC4[31:28],jumpaddr,2'b0}; cancel = 1; end //j
      {1'b1,6'b000011,6'bx} : begin next_PC = {PC4[31:28],jumpaddr,2'b0}; cancel = 1; reg_data = PC; reg_address = 31; write_reg = 1;end //jal
    endcase
  end
endmodule
     
    
      
    
  
  
