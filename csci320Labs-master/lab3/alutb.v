module alutb;

reg [31:0] fun;
reg [31:0] r1;
reg [31:0] r2;
wire [31:0] res;

alu aluse(fun, r1, r2, res);

initial begin
	$monitor($time, ": function = %h, rs1 = %d, rs2 = %d, result = %d", fun, r1, r2, res);
	fun = 3'b000;
	r1 = 10;
	r2 = 20;
	#10;
	fun = 7'h13;
	r1 = 4;
	r2 = 9;
end

endmodule
