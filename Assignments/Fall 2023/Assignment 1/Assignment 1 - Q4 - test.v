`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:52:46 11/21/2023
// Design Name:   truth_table
// Module Name:   C:/Users/user/Documents/DSD-4021/HWs/HW1/Q4_Test.v
// Project Name:  HW1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: truth_table
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Q4_Test;

	// Inputs
	reg A;
	reg B;
	reg C;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	truth_table uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.Q(Q)
	);

	initial begin
		{A,B,C} = 3'b000;
		#2
		{A,B,C} = 3'b001;
		#2
		{A,B,C} = 3'b010;
		#2
		{A,B,C} = 3'b011;
		#2
		{A,B,C} = 3'b100;
		#2
		{A,B,C} = 3'b101;
		#2
		{A,B,C} = 3'b110;
		#2
		{A,B,C} = 3'b111;
	end
      
endmodule