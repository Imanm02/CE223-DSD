module decoder2_4 (in, out0, out1, out2, out3);

	input [1:0] in;
	output reg out0, out1, out2, out3;
	
	always @ * begin
	
	    out0 = 1'b0;
	    out1 = 1'b0;
	    out2 = 1'b0;
	    out3 = 1'b0;
	
	   case (in)
			2'b00: begin
				out0 = 1;
				out1 = 0;
				out2 = 0;
				out3 = 0;
			end
			2'b01: begin
				out0 = 0;
				out1 = 1;
				out2 = 0;
				out3 = 0;
			end
			2'b10: begin
				out0 = 0;
				out1 = 0;
				out2 = 1;
				out3 = 0;
			end
			2'b11: begin
				out0 = 0;
				out1 = 0;
				out2 = 0;
				out3 = 1;
			end
	    endcase
	end

endmodule