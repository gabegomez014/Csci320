module mux5(input wire [31:0] pc, input wire [31:0] jalr, input wire [31:0] branch, input wire [31:0] jump, input wire [31:0] exception, output wire [31:0] result);

assign result = pc;

endmodule