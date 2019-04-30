module decoder(input wire [31:0] inst, output reg [255:0] str);

reg [6:0] opcode;
reg [4:0] rd;
reg [4:0] rs1;
reg [4:0] rs2;
reg [2:0] func3;
reg [6:0] func7;
reg [11:0] imm12;

always @(inst) begin
	
	opcode = inst[6:0];
	rd = inst[11:7];
	rs1 = inst[19:15];
	rs2 = inst[24:20];
	func3 = inst[14:12];
	func7 = inst[31:25];
	imm12 = inst[31:20];

	case(opcode)
		7'h33: 
			if (func3 == 3'b000) begin
				if (rs1 == 0) begin
					$sformat(str,"add   x%1d   zero   zero", rd);
				end

				else begin
					$sformat(str, "add   x%1d   x%1d   a%1d", rd, rs1, rs2);
				end

			end
		7'h13: 
			if (rs2 - 5 == 0) begin
				$sformat(str, "li   x%d   %d", rs1, imm12);
			end

			else 
				$sformat(str, "addi   x%d   x%d    x%d", rd, rs1, rs2);
		7'h73: $sformat(str, "ecall");
	endcase

	end

endmodule 