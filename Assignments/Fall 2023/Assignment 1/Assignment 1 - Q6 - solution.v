`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:58:21 11/21/2023 
// Design Name: 
// Module Name:    Q6 
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
module top();
	reg C;
	wire #5 A;
	assign #10 A = C;
	wire #10 B;
	assign #5 B = C;
	initial
	begin
		C=0;
		#8 C = 1;
		#3 C = 0;
	end
endmodule