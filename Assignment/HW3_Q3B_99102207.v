module decoder2_4 (in, out0, out1, out2, out3);

	input wire [1:0] in;

	output out0, out1, out2, out3;

	assign out0 = ~in[0] & ~in[1];
	assign out1 = in[0] & ~in[1];
	assign out2 = ~in[0] & in[1];
	assign out3 = in[0] & in[1];

endmodule