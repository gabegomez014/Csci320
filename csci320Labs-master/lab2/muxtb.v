module muxtb;

reg [31:0] r1;
reg [31:0] sign;
reg op1;
wire [31:0] res;

mux muxtest(r1, sign, op1, res);

initial begin
	$monitor($time, ": rs1 = %d, sign = %d, op1 = %d, result = %d", r1, sign, op1, res);
	r1 = 7'd10;
	sign = 32'd50;
	op1 = 1;
	#10;
	r1 = 7'd20;
	sign = 32'd8;
	op1 = 0;
end

endmodule