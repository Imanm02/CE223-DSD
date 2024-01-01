`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:03:02 11/21/2023
// Design Name:   voter
// Module Name:   C:/Users/user/Documents/DSD-4021/HWs/HW1/Q8_Test.v
// Project Name:  HW1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: voter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module voter_test;

	// Inputs
	reg [1:0] in1;
	reg [1:0] in2;
	reg [1:0] in3;

	// Outputs
	wire [1:0] out;
	wire error;

	// Instantiate the Unit Under Test (UUT)
	voter uut (
		.in1(in1), 
		.in2(in2), 
		.in3(in3), 
		.out(out), 
		.error(error)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		in3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in2 = 1;
		in3 = 1;
		#10
		in1 = 1;
		#10 
		in2 = 3;
		#10
		in1 = 3;
		#10
		in3 = 3;
		#10
		in3 = 2;
		#10
		in1 = 1;
	end
      
endmodule

