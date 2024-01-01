module voter (in1, in2, in3, out, error);

	input [1:0] in1, in2, in3;
	output [1:0] out;
	output error;
	
	wire [1:0] a1;
	xnor n12[1:0](a1, in1, in2); 

	wire [1:0] a2;
	xnor n13[1:0](a2, in1, in3); 

	wire [1:0] a3;
	xnor n23[1:0](a3, in2, in3); 

	wire[1:0] b1;
	and a12[1:0](b1, a1, in1);

	wire[1:0] b2;
	and a13[1:0](b2, a2, in1);

	wire[1:0] b3;
	and a23[1:0](b3, a3, in2);

	or o[1:0] (out, b1, b2, b3);

	wire c1;
	and (c1, a1[0], a1[1]);

	wire c2;
	and (c2, a2[0], a2[1]);

	wire c3;
	and (c3, a3[0], a3[1]);

	nor (error, c1, c2, c3);

endmodule