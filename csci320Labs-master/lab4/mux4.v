module mux4(input wire [31:0] pc, input wire [31:0] inst, input wire [1:0] Op2Sel, input wire [1:0] wb_sel, input wire [31:0] pc2, input wire [31:0] alures, input wire [31:0] memres, output reg [31:0] type, output reg [31:0] result);

always @(inst) begin
	if (Op2Sel == 1) begin
		type <= inst[31:20];
	end

	if (Op2Sel == 3) begin
		type <= inst[24:20];
	end

	if (wb_sel == 2) begin
		result <= alures;
		$display(result);
	end

end

/*
always @(alures) begin
	if (wb_sel == 2) begin
		result <= alures;
		$display(result);
	end
end
*/

endmodule