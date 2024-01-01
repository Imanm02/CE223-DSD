`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:27:07 11/21/2023
// Design Name:   new_counter
// Module Name:   C:/Users/user/Documents/DSD-4021/HWs/HW2/Q3_Test.v
// Project Name:  HW2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: new_counter
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
	reg load;
	reg [31:0] data_in;
	reg clk;

	// Outputs
	wire [5:0] count;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	new_counter uut (
		.count(count), 
		.done(done), 
		.load(load), 
		.data_in(data_in), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		load = 0;
		data_in = 0;
		clk = 0;
		
		data_in = 32'h000000ff;
		load = 1;
		
		#15 load = 0;

		#320
		
		data_in = 32'hff0000ff;
		load = 1;
		
		#15 load = 0;
	end
	always #5 clk = ~clk;
      
endmodule

