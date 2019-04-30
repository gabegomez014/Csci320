module mux4tb;

reg [31:0] pc, type, sign, utype, rs2, co, wb_sel, pc2, alures, memres;
reg op2;
wire [31:0] res;

mux4 mux4test(pc, type, sign, utype, rs2, op2, co, wb_sel, pc2, alures, memres, res);

initial begin
	$monitor($time, ": pc = %d, type = %d, sign = %d, utype = %d, rs2 = %d, Op2Sel = %d, co = %d, wb_sel = %d, pc2 = %d, alures = %d, memres = %d, result = %d", pc, type, sign, utype, rs2, op2, co, wb_sel, pc2, alures, memres, res);
	pc = 32'h00001000;
	type = 10'd10;
	sign = 5'd5;
	utype = 2'd3;
	rs2 = 32'd21;
	co = 32'd4;
	wb_sel = 0;
	pc2 = 32'h00001004;
	alures = 4'd8;
	memres = 7'd9;

	#10;

	pc = 32'h0000100e;
	type = 10'd1;
	sign = 5'd2;
	utype = 2'd1;
	rs2 = 32'd30;
	co = 32'd8;
	wb_sel = 1;
	pc2 = 32'h00001020;
	alures = 4'd6;
	memres = 7'd30;
end

endmodule