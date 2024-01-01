`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:56:16 11/21/2023 
// Design Name: 
// Module Name:    Q5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_wave();
	wire out;
	reg a, b, c, d;
	wire e, f, g;
	or #(2,3) (e, a, b);
	and #(3,4) (f, e, c);
	nor #(3, 5) (g, f, d);
	xor #(4, 6) (out, e, g);
	initial
	begin
		a = 1'b1;
		c = 1'b1;
		#3 c = 1'b0;
		#2 c = 1'b1;
		#8 a = 1'b0;
		b = 1'b0;
		#6 d = 1'b0;
	end
endmodule

