`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:38:52 12/13/2022 
// Design Name: 
// Module Name:    Q1 
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
module one_hot_counter(reset, enable, clock, out);
	input reset, enable, clock;
	output reg [7:0] out;
	always@(posedge clock or posedge reset) begin
		if (reset) begin
			out = 0;
		end
		else begin
			if (enable) begin
				if (out == 255) begin
					out = 0;
				end
				else begin
					out = out + 1;
				end
			end
		end
	end
	
endmodule