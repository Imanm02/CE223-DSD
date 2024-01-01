`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:49:22 11/21/2023
// Design Name:   less_than_three
// Module Name:   C:/Users/user/Documents/DSD-4021/HWs/HW1/Q3_Test.v
// Project Name:  HW1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: less_than_three
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Q3_Test;

	// Inputs
	reg [2:0] a;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	less_than_three uut (
		.a(a), 
		.y(y)
	);

	initial begin
		a = 3'b000;
		#2
		a = 3'b001;
		#2
		a = 3'b010;
		#2
		a = 3'b011;
		#2
		a = 3'b100;
		#2
		a = 3'b101;
		#2
		a = 3'b110;
		#2
		a = 3'b111;
	end
      
endmodule