module sodor;

reg clock = 1'b0;
wire [31:0] progcount;
wire [31:0] res;
wire [31:0] memout;
wire [255:0] decoded;
wire [2:0] alufun;
wire [1:0] op2sel;
wire op1sel;
wire pc_sel;
wire [1:0] wb_sel;
wire rf_wen;
wire mem_rw;
wire mem_val;
wire [31:0] co;
wire [31:0] word;
wire [4:0] rs1;
wire [4:0] rs2;
wire [31:0] regres;
wire[31:0] type;

mux4 mux4_test(progcount, memout, op2sel, wb_sel, progcount + 4, word, memout, type, regres);
pc p_test(clock, res, progcount);
add4 add(progcount, res);
memory mem_test(progcount, memout);
decoder decoder_test(memout, decoded);
control control_test(memout, alufun, op2sel, op1sel, pc_sel, wb_sel, rf_wen, mem_rww, mem_val);
alu alu_test(alufun, memout, op2sel, rs1, type, word);
regfile reg_test(clock, memout, regres, rs1, rs2);

/*
always begin 
	#10; clock = ~clock;
	if (memout == 0)
		$finish;
end
*/

initial begin
	$display($time, ": Reading program mem.in");
	$display($time, ": boot.");
	$display($time, ": PC = 0x%h, IR = 0xxxxxxxxx", progcount);
	$monitor($time,": PC = 0x%h, IR = 0x%h, %s", progcount, memout, decoded);
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
	#10;
	clock = ~clock;
end


endmodule