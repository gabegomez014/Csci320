module control(input wire [31:0] inst, output reg [2:0] Alufun, output reg [1:0] Op2Sel, output reg Op1Sel, output wire pc_sel, output reg [1:0] wb_sel, output wire rf_wen, output wire mem_rw, output wire mem_val);

assign pc_sel = 0;
reg [6:0] opcode;
reg [4:0] rs1;
reg [4:0] rs2;
reg [2:0] func3;
reg [6:0] func7;
reg [11:0] imm12;
reg [19:0] offset;

always @(inst) begin
//$monitor("func3 is %b", func3);

	opcode = inst[6:0];
	rs1 = inst[19:15];
	rs2 = inst[24:20];
	func3 = inst[14:12];
	func7 = inst[31:25];
	imm12 = inst[31:20];
	offset = inst[31:12];


	case(opcode)
		7'h33:
			if (func3 == 3'b000) begin
				Alufun = func3;
				Op2Sel = 2'd3;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end

			else if (func3 == 1'h1) begin
				Alufun = func3;
				Op2Sel = 2'd3;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end

			else if (func3 == 7'h6) begin
				Alufun = func3;
				Op2Sel = 2'd3;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end

			else if (func3 == 9'd200) begin
				Alufun = func3;
				Op2Sel = 2'd3;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end

			else if (func3 == 3'd4) begin
				Alufun = func3;
				Op2Sel = 2'd3;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end

		7'h13:
			if (rs2 - 5 == 0) begin
				Op2Sel = 1'b1;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
				Alufun = opcode;
			end

			else if (func3 == 3'h7) begin
				Op2Sel = 1'b1;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
				Alufun = func3;
			end

			else begin
				Op2Sel = 1'b1;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
				Alufun = func3;
			end

		7'h23:
			if (func3 == 2'h2) begin
				Op2Sel = 3'd2;
				Op1Sel = 1'b0;
				Alufun = func3;
				wb_sel = 2'd2;
			end

		7'h03:
			if (func3 == 2'h2) begin
				Alufun = func3;
				Op2Sel = 3'd1;
				Op1Sel = 1'b0;
				wb_sel = 2'd2;
			end
	endcase

end

endmodule