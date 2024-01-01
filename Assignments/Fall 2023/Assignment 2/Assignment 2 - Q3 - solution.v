`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:20 11/21/2023 
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
module new_counter(count, done, load, data_in, clk);
	parameter N = 32;
	input load;
	input clk;
	input [31:0] data_in;
	output reg [5:0] count;
	output reg done;
	reg [5:0] i;
	reg [31:0] reged_data_in;
	wire should_start;
	
	// Start Condition
	assign should_start = (i == 0 && load == 1);
	
	// Start the process
	always @(posedge clk) begin
		if (should_start) begin
			i = N;
			done = 0;
			count = 0;
			reged_data_in = data_in;
		end
	end
	
	// Counting
	always @(posedge clk) begin
		if (i != 0) begin
			if (reged_data_in[0])
				count = count + 1;
			reged_data_in = {0, reged_data_in[31:1]};
			if (i == 1)
				done = 1;
			i = i - 1;
		end
	end
	initial begin
		i = 0;
	end
endmodule
