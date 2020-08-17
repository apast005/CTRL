module testbench();

// Inputs
reg eq;
reg[31:26] ir31_26;
reg[5:0] ir5_0;

// Outputs
wire rf_we;
wire add2_s;
wire rf_wd_s;
wire dm_we;
wire rf_wa_s;
wire[4:0] alu_op;
wire[1:0] pc_s;

CTRL myCTRL(
	eq,
	ir31_26,
	ir5_0,
	rf_we,
	add2_s,
	rf_wd_s,
	dm_we,
	rf_wa_s,
	alu_op,
	pc_s
);


initial begin

////////////////////////////////////////////////////////////////////////////////////////////
// LW
ir31_26 = 6'b100011; #10; 
if ((rf_wa_s !== 1) | (rf_wd_s !== 0) | (rf_we !== 1) | (add2_s !== 0) | (dm_we !== 0) |
   (alu_op !==5'b00010) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for lw");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// SW
ir31_26 = 6'b101011; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 0) | (rf_we !== 0) | (add2_s !== 0) | (dm_we !== 1) |
   (alu_op !==5'b00010) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for sw");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// ADDI
ir31_26 = 6'b001000; #10; 
if ((rf_wa_s !== 1) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 0) | (dm_we !== 0) |
   (alu_op !==5'b00010) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for addi");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// ADD
ir31_26 = 6'b000000;  ir5_0 = 6'b100000; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !==5'b00010) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for add");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// SUB
ir31_26 = 6'b000000;  ir5_0 = 6'b100010; #10;  
if ((rf_wa_s !== 0) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !==5'b01110) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for sub");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// AND
ir31_26 = 6'b000000;  ir5_0 = 6'b100100; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !==5'b00000) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for and");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// OR
ir31_26 = 6'b000000;  ir5_0 = 6'b100101; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !==5'b00001) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for or");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// SLT
ir31_26 = 6'b000000;  ir5_0 = 6'b101010; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 1) | (rf_we !== 1) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !==5'b01111) | (pc_s !==2'b00)) begin
           $display("Error: Incorrect data for slt");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// J
ir31_26 = 6'b000010; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 0) | (rf_we !== 0) | (add2_s !== 0) | (dm_we !== 0) |
   (alu_op !== 5'b00000) | (pc_s !== 2'b01)) begin
           $display("Error: Incorrect data for j");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// BEQ (Not Taken)
ir31_26 = 6'b000100; eq=0; #10; 
if ((rf_wa_s !== 0) | (rf_wd_s !== 0) | (rf_we !== 0) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !== 5'b01110) | (pc_s !== 2'b00)) begin
           $display("Error: Incorrect data for beq (not taken)");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// BEQ (Taken)
ir31_26 = 6'b000100; eq=1; #10;  
if ((rf_wa_s !== 0) | (rf_wd_s !== 0) | (rf_we !== 0) | (add2_s !== 1) | (dm_we !== 0) |
   (alu_op !== 5'b01110) | (pc_s !== 2'b10)) begin
           $display("Error: Incorrect data for beq (taken)");
           $display("Values generated: rf_wa_s=%d, rf_wd_s=%d, rf_we=%d, add2_s=%d, dm_we=%d, alu_op=%d, pc_s=%d", rf_wa_s, rf_wd_s, rf_we, add2_s, dm_we, alu_op, pc_s); 
           $stop;
end
////////////////////////////////////////////////////////////////////////////////////////////

$display("All tests passed.");

end

endmodule