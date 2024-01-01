// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module Q1;
	reg [4:0] a;
	reg [3:0] b;
	reg [0:5] c;
	reg [3:0] d;
	integer i = 16'h4a6c;
	
	initial begin
		a = 4'bx;
		b = 4'bz;
		c = 4'b1;
		d = i[8-:6];
		$display("%b, %b, %b, %b", a, b, c, d); // 0xxxx, zzzz, 000001, 1101
   end
endmodule