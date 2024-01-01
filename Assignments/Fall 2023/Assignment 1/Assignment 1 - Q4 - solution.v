`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:52:00 11/21/2023 
// Design Name: 
// Module Name:    Q4 
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
module truth_table(A, B, C, Q);
	input A, B, C;
	output Q;
	wire A_XOR_C, B_XOR_C, AXORC_AND_BXORC;
	
	xor(A_XOR_C, A, C);
	xor(B_XOR_C, B, C);
	
	and(AXORC_AND_BXORC, B_XOR_C, A_XOR_C);
	
	and(Q, AXORC_AND_BXORC, C);
endmodule
