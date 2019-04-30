module regfile(input clock, input wire [31:0] inst, input wire [31:0] word, output wire [4:0] rs1, output wire [4:0] rs2);

reg [31:0] gpr[31:0];

integer i, j;

wire [4:0] rd;
assign rd = inst[11:7];

assign rs1 = inst[19:15];
assign rs2 = inst[24:20];


initial begin
	initzero();
end

always @(negedge clock) begin

	gpr[rd] = word;
	regprint();
end

task regprint;
begin 
	
	$display($time,": WRITE %h to REG x%d", word, rd);
	#5;
	for (j = 0; j < 32; j = j + 1) begin

		$display($time, ": x%d: 0x%h", j, gpr[j]);
	end

end
endtask

task initzero;
begin
	
	for (i = 0; i < 32; i = i + 1) begin
		gpr[i] <= 0;
	end

end
endtask

endmodule