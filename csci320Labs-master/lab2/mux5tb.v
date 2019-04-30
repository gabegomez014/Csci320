module mux5tb;

reg [31:0] pc, jalr, brnch, jump, except;
wire [31:0] res;

mux5 mux5test(pc, jalr, branch, jump, except, res);

initial begin
	$monitor($time, ": pc = %h, jalr = %h, branch = %h, jump = %h, except = %h, result = %h", pc, jalr, brnch, jump, except, res);
	pc = 32'h00001000;
	jalr = 32'h10293034;
	brnch = 32'h00000045;
	jump = 32'h00000016;
	except = 32'h00000000;
	#10;
	pc = 32'h00001018;
	jalr = 32'h00007612;
	brnch = 32'h00008871;
	jump = 32'h00204036;
	except = 32'h20100000;
end

endmodule