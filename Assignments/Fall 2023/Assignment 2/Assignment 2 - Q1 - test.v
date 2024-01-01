`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:43:54 12/13/2022
// Design Name:   one_hot_counter
// Module Name:   C:/Users/user/Documents/DSD-4011/HWs/HW3/Q1_test.v
// Project Name:  HW3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_hot_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Q1_test;

	// Inputs
	reg reset;
	reg enable;
	reg clock;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	one_hot_counter uut (
		.reset(reset), 
		.enable(enable), 
		.clock(clock), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		enable = 0;
		clock = 0;
		#40 reset = 0;
		enable = 1;
	end
      
	initial begin 
		forever begin
			#10 clock = ~clock;
		end 
	end
endmodule