`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:08:20 11/18/2023 
// Design Name: 
// Module Name:    Q2-a 
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
	output reg out0, out1, out2, out3;

	always @(in) begin
		if(in == 2'b00) begin
			{out3, out2, out1, out0} = 4'b0001;
		end
		else if(in == 2'b01) begin
			{out3, out2, out1, out0} = 4'b0010;
		end
		else if(in == 2'b10) begin
			{out3, out2, out1, out0} = 4'b0100;
		end
		else if(in == 2'b11) begin
			{out3, out2, out1, out0} = 4'b1000;
		end
	end

endmodule
