module control(input wire [31:0] inst, output wire [2:0] Alufun, output wire Op2Sel, output wire Op1Sel, output wire pc_sel, output wire Wb_sel, output wire rf_wen, output wire Mem_rw, output wire Mem_val);

assign pc_sel = 0;

always @(inst) begin

	case(inst[6:0])
		7'h33:
			assign Op2Sel = 1'b1;
			assign Op1Sel = 1'b0;
			if (inst[14:12] == 3'b000) begin
				assign Alufun = inst[14:12];
			end

		7'h13:
			assign Op2Sel = 0;
			assign Op1Sel = 0;
			assign Alufun = inst[6:0];
	endcase

end

endmodule