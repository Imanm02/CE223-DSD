`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:48:25 11/21/2023 
// Design Name: 
// Module Name:    Q3 
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
module less_than_three(a, y);
	input [2:0] a;
	output y;
	wire a0_AND_a1;
	
	and(a0_AND_a1, a[0], a[1]);
	nor(y, a[2], a0_AND_a1);
endmodule