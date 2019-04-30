module testbench;

reg clock;
reg [31:0] instruction;
reg [31:0] wrd;
wire[4:0] rd;
wire [4:0] rs1;
wire [4:0] rs2;

regfile register(clock, instruction, wrd, rs1, rs2);

initial begin
	$monitor($time, ": %d", clock);
	instruction = 32'h00500513;
	wrd = 32'h00000046;
	clock = 1;
	#10;
	clock = 0;
	#10
	instruction = 32'h00500593;
	wrd = 32'h0000123a;
	clock = 1;
	#10;
	clock = 0;
	#10;
	instruction = 32'h00b50633;
	clock = 0;
	#10;
	instruction = 32'h00000533;
	wrd = 32'h02007091;
	clock = 1;
	#10;
	instruction = 32'h00000073;
	clock = 0;

end

endmodule