`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:29:40 11/13/2022 
// Design Name: 
// Module Name:    Q2 
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

/* input b definiiton must go inside the module, becuse it uses N parameter AND we can not mix in module definition with on header */
module q2(q, a, input [N-1:0] b, lda, ldb, clk);
	parameter N = 2;
	
	/* there must be semi-colon after a definition */
	input [N-1:0] a
	/* clk can be removed */
	input lda, ldb, clk;
	/* 1- output q can be removed, because we had not used it anywhere 
	   2- the whole module is going to be removed because it does not do anything */
	output [N-1:0] q;
	wire out_one;
	wire out_two;
	
	xor(out_one, a[N-1], ldb);
	/* 1- b is used as the output of and gate while it is an input.
	   2- out_two is not assinged yet and had been used as an input. */
	and(b[0], lda, out_two);

endmodule