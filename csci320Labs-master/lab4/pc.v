module pc(input clock, input wire [31:0] in, output reg [31:0] counter);

initial begin
	counter = 32'h1000;
end

always @(posedge clock) begin
	counter = in;
end

endmodule