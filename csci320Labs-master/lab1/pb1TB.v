module pb1TB;

reg clock = 1'b0;
wire [31:0] progcount;
wire [31:0] res;
wire [31:0] memout;
wire [255:0] decoded;

pc p_test(clock, res, progcount);
add4 add(progcount, res);
memory mem_test(progcount, memout);
decoder decoder_test(memout, decoded);

always begin 
	#10; clock = ~clock;
	if (memout == 0)
		$finish;
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, pb1TB);

	$display($time, ": Reading program mem.in");
	$display($time, ": boot.");
	$display($time, ": PC = 0x%h, IR = 0xxxxxxxxx", progcount);
	$monitor($time,": PC = 0x%h, IR = 0x%h, %s", progcount, memout, decoded);
end


endmodule