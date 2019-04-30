module alu(input wire [31:0] alufun, input wire [31:0] rs1, input wire [31:0] rs2, output reg [31:0] result);

always @(alufun) begin
	case (alufun)

		7'h13: result = rs1 + rs2;

		3'b000: result = rs1 + rs2;

	endcase
end

endmodule