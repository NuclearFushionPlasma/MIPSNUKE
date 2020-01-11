module MIPS(
  input clk, reset,
  input [31:0] mem_data_recive,Ins_in_PC,
  output load_MEM,store_MEM,
  output [31:0] mem_address_MEM,mem_data_MEM,PC_address
);
    //------------------------------------------------------------------------------------------------------------------------------------
   wire [31:0]  next_PC, next_PC_PC, next_PC_IR, next_PC_ALU;
   assign next_PC = next_PC_PC | next_PC_IR | next_PC_ALU ;
   wire enable_PC;
	PC_register register1(
		.next_PC(next_PC), 
		.now_PC(PC_address), 
		.clk(clk), 
		.reset(reset)
	);
	//Ins_MEM mem1(.Ins_address(PC_address), .Ins_output(Ins_in_PC), .clk(clk), .reset(reset)); no longer need it
	PC_state_signal_producter state_producter1(
		next_PC_PC,
		PC_address,
		enable_PC
	);
	//-------------------------------------------------------------------------------------------------------------------------------------
	wire [31:0] IR_address, Ins_in_IR;
	wire enable_IR, enable_from_PC; 
	wire [4:0] add_A, add_B,add_C, add_mem, warp_Add_ALU, warp_Add_MEM;
	wire [31:0] data_A, data_B, data_C, warp_ALU, warp_MEM, reg_data_IR, mem_data_IR;
	wire write_enable, warp_ALU_enable, warp_MEM_enable, cancel_IR, write_reg_IR_to_ALU;
	wire [4:0] mode_IR, reg_address_IR;
	wire load_IR, store_IR, cal_IR, cmp_IR, cmp_signed_IR, jump_IR,lui_IR;
	wire [31:0] cal_A_IR, cal_B_IR;
	IR_register register2(
		.next_Ins(Ins_in_PC),
		.next_enable(enable_PC),
		.next_PC(PC_address),
		.now_Ins(Ins_in_IR),
		.now_PC(IR_address),
		.now_enable(enable_from_PC),
		.clk(clk),
		.reset(reset)
	);
	IR_address_producter address_producter(
		.Ins(Ins_in_IR),
		.enable(enable_IR),
		.add_A(add_A),
		.add_B(add_B),
		.add_mem(add_mem)
	);
	Reg_File regs(
		.add_A(add_A),
		.add_B(add_B),
		.add_C(add_C),
		.warp_Add_ALU(warp_Add_ALU),
		.warp_Add_MEM(warp_Add_MEM),
		.data_C(data_C),
		.warp_ALU(warp_ALU),
		.warp_MEM(warp_MEM),
		.clk(clk),
		.reset(reset),
		.write_enable(write_enable),
		.warp_ALU_enable(warp_ALU_enable),
		.warp_MEM_enable(warp_MEM_enable),
		.data_A(data_A),
		.data_B(data_B)
	);
	IR_state_producter2 state_producter2(
		.Ins(Ins_in_IR),
		.PC(IR_address),
		.reg_A(data_A),
		.reg_B(data_B),
		.enable(enable_IR),
		.next_PC(next_PC_IR),
		.reg_data(reg_data_IR),
		.mem_data(mem_data_IR),
		.cancel(cancel_IR),
		.write_reg(write_reg_IR_to_ALU),
		.mode(mode_IR),
		.reg_address(reg_address_IR),
		.load(load_IR),
		.store(store_IR), 
		.cal(cal_IR),
		.cmp(cmp_IR),
		.cmp_signed(cmp_signed_IR),
		.jump(jump_IR),
		.cal_A(cal_A_IR),
		.cal_B(cal_B_IR),
		.lui(lui_IR)
	);
    //--------------------------------------------------------------------------------------------------------------------------------------
   wire[4:0] mode_ALU, reg_address_ALU, cal_add_A_ALU, cal_add_B_ALU, add_mem_ALU;
   wire cal_ALU, load_ALU, store_ALU, write_reg_ALU, jump_ALU, enable_ALU, cmp_ALU, cmp_signed_ALU, lui_ALU,write_reg_ALU_To_MEM;
   wire [31:0] cal_A_1, cal_B_1, mem_data_From_IR; 
   wire [31:0] cal_A_ALU,cal_B_ALU,mem_data_ALU,reg_data_ALU,reg_data_ALU_From_IR;
	wire bigger_ALU,equal_ALU,less_ALU;
	wire [31:0] ALU_out,mem_address_ALU;
	wire cancel_ALU;
   ALU_register register3(
		.next_mode(mode_IR),
		.next_reg_address(reg_address_IR), 
		.next_cal_add_A(add_A), 
		.next_cal_add_B(add_B), 
		.next_add_mem(add_mem), 
		.next_cal(cal_IR), 
		.next_load(load_IR), 
		.next_store(store_IR), 
		.next_write_reg(write_reg_IR_to_ALU), 
		.next_jump(jump_IR), 
		.next_enable(enable_IR), 
		.next_cmp(cmp_IR), 
		.next_cmp_signed(cmp_signed_IR), 
		.next_lui(lui_IR), 
		.next_cal_A(cal_A_IR), 
		.next_cal_B(cal_B_IR), 
		.next_reg_data(reg_data_IR), 
		.next_mem_data(mem_data_IR),
		.mode(mode_ALU), 
		.reg_address(reg_address_ALU), 
		.cal_add_A(cal_add_A_ALU),
		.cal_add_B(cal_add_B_ALU), 
		.add_mem(add_mem_ALU), 
		.cal(cal_ALU), 
		.load(load_ALU), 
		.store(store_ALU), 
		.write_reg(write_reg_ALU), 
		.jump(jump_ALU), 
		.enable(enable_ALU), 
		.cmp(cmp_ALU), 
		.cmp_signed(cmp_signed_ALU), 
		.lui(lui_ALU), 
		.cal_A(cal_A_1), 
		.cal_B(cal_B_1), 
		.reg_data(reg_data_ALU_From_IR), 
		.mem_data(mem_data_From_IR), 
		.clk(clk), 
		.reset(reset)
	);
	ALU_warp_drive drive_A(
		.data_in(cal_A_1), 
		.warp_data_in(warp_MEM), 
		.add_in(cal_add_A_ALU),
		.warp_add_in(warp_Add_MEM), 
		.MEM_warp_enable(warp_MEM_enable), 
		.data_out(cal_A_ALU)
	);
	ALU_warp_drive drive_B(
		.data_in(cal_B_1), 
		.warp_data_in(warp_MEM), 
		.add_in(cal_add_B_ALU), 
		.warp_add_in(warp_Add_MEM), 
		.MEM_warp_enable(warp_MEM_enable), 
		.data_out(cal_B_ALU)
	);
	ALU_warp_drive drive_C(
		.data_in(mem_data_From_IR),
		.warp_data_in(warp_MEM), 
		.add_in(add_mem_ALU), 
		.warp_add_in(warp_Add_MEM), 
		.MEM_warp_enable(warp_MEM_enable),
		.data_out(mem_data_ALU)
	);
	ALU the_ALU(
		.a(cal_A_ALU), 
		.b(cal_B_ALU), 
		.c(ALU_out), 
		.mode1(mode_ALU[4:3]), 
		.mode2(mode_ALU[2:1]), 
		.mode3(mode_ALU[0])
	);
	signed_compare_32bit the_compare(
		cal_A_ALU, 
		cal_B_ALU, 
		cmp_signed_ALU, 
		bigger_ALU, 
		equal_ALU, 
		less_ALU
	);
	ALU_state_producter producter3(
		.ALU_in(ALU_out),
		.reg_data_in(reg_data_ALU_From_IR),
		.cal(cal_ALU), .load(load_ALU),
		.store(store_ALU),
		.write_reg_in(write_reg_ALU),
		.jump(jump_ALU),
		.enable(enable_ALU),
		.cmp(cmp_ALU),
		.cmp_signed(cmp_signed_ALU),
		.lui(lui_ALU),
		.cmp_effe(less_ALU),
		.reg_data(reg_data_ALU), 
		.mem_address(mem_address_ALU),
		.next_PC(next_PC_ALU),
		.cancel(cancel_ALU),
		.write_reg(write_reg_ALU_To_MEM)
	);
	//-------------------------------------------------------------------------------------------------------------------------------------
	wire [31:0] reg_data_MEM_From_ALU,reg_data_MEM;
	wire enable_MEM,write_reg_MEM;
	wire [4:0] reg_address_MEM;
	MEM_register register4(
		.next_reg_data(reg_data_ALU), 
		.next_mem_data(mem_data_ALU), 
		.next_mem_address(mem_address_ALU), 
		.next_load(load_ALU), 
		.next_store(store_ALU), 
		.next_write_reg(write_reg_ALU_To_MEM), 
		.next_enable(enable_ALU), 
		.next_reg_address(reg_address_ALU), 
		.clk(clk), 
		.reset(reset),
		.reg_data(reg_data_MEM_From_ALU),
		.mem_data(mem_data_MEM), 
		.mem_address(mem_address_MEM), 
		.load(load_MEM), 
		.store(store_MEM), 
		.write_reg(write_reg_MEM), 
		.enable(enable_MEM), 
		.reg_address(reg_address_MEM)
	);
	//MEM_drive drive1(.address(mem_address_MEM), .load(load_MEM), .store(store_MEM), .mem_data_recive(mem_data_recive), .mem_data_output(mem_data_MEM));
	MEM_state_producter producter4(
		.reg_data_in(reg_data_MEM_From_ALU), 
		.mem_data_in(mem_data_recive), 
		.load(load_MEM), 
		.enable(enable_MEM), 
		.data_out(reg_data_MEM)
	);
	//--------------------------------------------------------------------------------------------------------------------------------------
	wire enable_WB = enable_MEM & write_reg_MEM;
	WB_register register5(.next_data(reg_data_MEM), .next_add(reg_address_MEM), .next_write_reg(enable_WB), .clk(clk), .reset(reset), .data(data_C), .add(add_C), .write_reg(write_enable));
	//Control signal set--------------------------------------------------------------------------------------------------------------------
	assign enable_PC = ~cancel_IR;
	assign enable_IR = enable_from_PC &(~cancel_ALU);
	assign warp_ALU = reg_data_ALU;
	assign warp_MEM = reg_data_MEM;
	assign warp_Add_ALU = reg_address_ALU;
	assign warp_Add_MEM = reg_address_MEM;
	assign warp_ALU_enable = (enable_ALU) & write_reg_ALU;
	assign warp_MEM_enable = (enable_MEM) & write_reg_MEM;		
endmodule
				
				