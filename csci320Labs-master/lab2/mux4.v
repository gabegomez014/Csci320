module mux4(input wire [31:0] pc, input wire [31:0] type, input wire [31:0] sign, input wire [31:0] utype, input wire [31:0] rs2, input wire Op2Sel, input wire [31:0] co, input wire [31:0] wb_sel, input wire [31:0] pc2, input wire [31:0] alures, input wire [31:0] memres, output wire [31:0] result);

assign result = rs2;

endmodule