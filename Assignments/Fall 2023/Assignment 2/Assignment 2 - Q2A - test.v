`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:15:24 11/18/2023
// Design Name:   Q2_A_decoder
// Module Name:   C:/Users/user/Documents/DSD-4011/HWs/HW3/Q2_A_Test.v
// Project Name:  HW3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Q2_A_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Q2_A_Test;

	// Inputs
	reg [1:0] in;

	// Outputs
	wire out0;
	wire out1;
	wire out2;
	wire out3;

	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.in(in), 
		.out0(out0), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		
		#5 
		in = 1;
		#5 
		in = 2;
		#5 
		in = 3;
		#5 
		in = 0;
	end
      
endmodule