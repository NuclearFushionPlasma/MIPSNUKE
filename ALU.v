module ALU(a,b,c,mode1,mode2,mode3); 
  input [1:0] mode1,mode2;
  input [31:0] a,b;
  output [31:0] c;
  input mode3;
  wire [31:0] inverseofb;
  gettheInverse G(b,inverseofb,mode3);
  wire[31:0] a_To_add,a_To_shift,a_To_logic,b_To_add,b_To_shift,b_To_logic,value_Of_add,value_Of_shift,value_Of_logic;
  wire nop;
  add32 A(a_To_add,b_To_add,value_Of_add,nop,1'b0);
  shiftUnit B(a_To_shift,b_To_shift,value_Of_shift,mode2);
  logicCal C(a_To_logic,b_To_logic,value_Of_logic,mode2);
  oneTothree32bit D(a,a_To_add,a_To_shift,a_To_logic,mode1);
  oneTothree32bit E(inverseofb,b_To_add,b_To_shift,b_To_logic,mode1);
  threeToone32bit F(c,value_Of_add,value_Of_shift,value_Of_logic,mode1);
endmodule
  