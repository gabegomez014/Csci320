module add4(cur, counted);

input [31:0] cur;
output [31:0] counted;

wire [31:0] cur;
reg [31:0] counted;

always @(*) begin
	counted = cur + 4;
end

endmodule