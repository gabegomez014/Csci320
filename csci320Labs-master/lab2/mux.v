module mux(input wire [31:0] rs1, input wire [31:0] sign, input wire Op1Sel, output wire [31:0] result);

assign result = rs1;

endmodule