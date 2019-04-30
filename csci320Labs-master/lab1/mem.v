/*
  module memory

  Implements a 32-bit big-endian memory block. The address is initialised at 0
  and for each positive clock edge, the current address is incremented. The
  addressed memory word is output on "out". Data is read from the file
  'mem.in'.
*/
module memory (input wire [31:0] in, output wire [31:0] out);

///////////////////////// internal memory storage //////////////////////////////
reg [31:0] mem [255:0];  // store 4 32-bit words.


//////////////////////////////// initial ///////////////////////////////////////
initial
begin
  $readmemh("mem.in", mem, 0,255);     			// load some data
end

assign
  out = mem[(in - 4096) / 4]; 		// continuous assignment for output

endmodule
////////////////////////// endmodule memory ////////////////////////////////////