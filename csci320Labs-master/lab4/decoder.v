module decoder(input wire [31:0] inst, output reg [255:0] str);

reg [6:0] opcode;
reg [4:0] rd;
reg [4:0] rs1;
reg [4:0] rs2;
reg [2:0] func3;
reg [6:0] func7;
reg [11:0] imm12;
reg [18:0] offset;

always @(inst) begin

	//$monitor("opcode is %h, rd is %h, rs1 is %h, rs2 is %h, func3 is %h, func7 is %h, imm12 is %h, offset is %h", opcode, rd, rs1, rs2, func3, func7, imm12, offset);
	
	opcode = inst[6:0];
	rd = inst[11:7];
	rs1 = inst[19:15];
	rs2 = inst[24:20];
	func3 = inst[14:12];
	func7 = inst[31:25];
	imm12 = inst[31:20];
	offset = inst[31:12];

	case(opcode)
		7'h33: 
			if (func3 == 3'b000) begin
				if (rs1 == 0) begin
					$sformat(str,"add   x%1d   zero   zero", rd);
				end

				else begin
					$sformat(str, "add   x%1d   x%1d   x%1d", rd, rs1, rs2);
				end
			end

			else if (func3 == 1'h1) begin
				$sformat(str, "sll   x%d   x%d   %d", rd, rs1, rs2);
			end

			else if (func3 == 7'h6) begin
				$sformat(str, "or   x%d   x%d   x%d", rd, rs1, rs2);
			end

			else if (func3 == 9'd200) begin
				$sformat(str, "sub   x%d   x%d   x%d", rd, rs1, rs2);
			end

			else if (func3 == 3'd4) begin
				$sformat(str, "xor   x%d   x%d   x%d", rd, rs1, rs2);
			end

		7'h13: 
			if (rs2 - 5 == 0) begin
				$sformat(str, "li   x%d   %d", rd, imm12);
			end

			else if (func3 == 3'h7) begin
				$sformat(str, "andi   x%d   x%d   x%d", rd, rs1, imm12);
			end

			else begin
				$sformat(str, "addi   x%d   x%d    %d", rd, rs1, imm12);
			end

		7'h37:
			$sformat(str, "lui   x%d   %d", rd, offset);

		7'h73: $sformat(str, "ecall");

		7'h63:
			if (func3 == 1'b0) begin
				$sformat(str, "beq   x%d   x%d   %d", rs1, rs2, offset);
			end

			else begin
				$sformat(str, "bne   x%d   x%d   %d", rs1, rs2, offset);
			end
		7'h6f:
			$sformat(str, "jal   x%d   %d", rs1, imm12);
		7'h03:
			if (func3 == 2'h2) begin
				$sformat(str, "lw   x%d   %d(x%d)", rd, offset, rs1);
			end
		7'h23:
			if (func3 == 2'h2) begin
				$sformat(str, "sw   x%d   %d(x%d)", rs2, offset, rs1);
			end
	endcase

	end

endmodule 