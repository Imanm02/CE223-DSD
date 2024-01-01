`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:19:37 11/18/2023 
// Design Name: 
// Module Name:    Q2_B_decoder 
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
module decoder(in, out0, out1, out2, out3);
	input wire [1:0] in;
	output out0, out1, out2, out3;
	
	assign out0 = (in == 2'b00)?(1):(0);
	assign out1 = (in == 2'b01)?(1):(0);
	assign out2 = (in == 2'b10)?(1):(0);
	assign out3 = (in == 2'b11)?(1):(0);
	
endmodule