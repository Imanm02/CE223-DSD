`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:00:49 11/21/2023 
// Design Name: 
// Module Name:    Q8 
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
module voter(in1, in2, in3, out, error);
	input [1:0] in1, in2, in3;
	output [1:0] out;
	output error;
	
	// Generate Error Signal

	wire [1:0] in1vsin2;
	wire [1:0] in2vsin3;
	wire [1:0] in1vsin3;

	wire in1vsin2T;
	wire in2vsin3T;
	wire in1vsin3T;
	
	wire errorI12VI23;
	
	xor in1vsin2XOR0(in1vsin2[0], in1[0], in2[0]);
	xor in1vsin2XOR1(in1vsin2[1], in1[1], in2[1]);

	xor in2vsin3XOR0(in2vsin3[0], in2[0], in3[0]);
	xor in2vsin3XOR1(in2vsin3[1], in2[1], in3[1]);

	xor in1vsin3XOR0(in1vsin3[0], in1[0], in3[0]);
	xor in1vsin3XOR1(in1vsin3[1], in1[1], in3[1]);
	
	or in1vsin2TOR(in1vsin2T, in1vsin2[0], in1vsin2[1]);
	or in2vsin3TOR(in2vsin3T, in2vsin3[0], in2vsin3[1]);
	or in1vsin3TOR(in1vsin3T, in1vsin3[0], in1vsin3[1]);
	
	and errorI12VI23AND(errorI12VI23, in1vsin2T, in2vsin3T);
	and errorAND(error, errorI12VI23, in1vsin3T);
	
	// Generate Voter
	
	wire in1vsin2TNOT;
	wire in2vsin3TNOT;
	wire in1vsin3TNOT;
	
	wire [1:0] in1ANDin1vsin2TNOT;
	wire [1:0] in2ANDin2vsin3TNOT;
	wire [1:0] in3ANDin1vsin3TNOT;
	
	wire [1:0] firstLevelOrOut;
	
	not in1vsin2TNOTNOT(in1vsin2TNOT, in1vsin2T);
	not in2vsin3TNOTNOT(in2vsin3TNOT, in2vsin3T);
	not in1vsin3TNOTNOT(in1vsin3TNOT, in1vsin3T);
	
	and in1ANDin1vsin2TNOTAND0(in1ANDin1vsin2TNOT[0], in1[0], in1vsin2TNOT);
	and in1ANDin1vsin2TNOTAND1(in1ANDin1vsin2TNOT[1], in1[1], in1vsin2TNOT);
	
	and in2ANDin2vsin3TNOTAND0(in2ANDin2vsin3TNOT[0], in2[0], in2vsin3TNOT);
	and in2ANDin2vsin3TNOTAND1(in2ANDin2vsin3TNOT[1], in2[1], in2vsin3TNOT);
	
	and in3ANDin1vsin3TNOTAND0(in3ANDin1vsin3TNOT[0], in3[0], in1vsin3TNOT);
	and in3ANDin1vsin3TNOTAND1(in3ANDin1vsin3TNOT[1], in3[1], in1vsin3TNOT);
	
	or firstLevelOrOutOR0(firstLevelOrOut[0], in1ANDin1vsin2TNOT[0], in2ANDin2vsin3TNOT[0]);
	or firstLevelOrOutOR1(firstLevelOrOut[1], in1ANDin1vsin2TNOT[1], in2ANDin2vsin3TNOT[1]);
	
	or outOR0(out[0], firstLevelOrOut[0], in3ANDin1vsin3TNOT[0]);
	or outOR1(out[1], firstLevelOrOut[1], in3ANDin1vsin3TNOT[1]);
endmodule
