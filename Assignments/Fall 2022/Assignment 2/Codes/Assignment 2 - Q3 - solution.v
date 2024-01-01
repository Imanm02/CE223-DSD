module unsigned_multiplier (result, x, y);

	parameter N = 5;

	input [N-1:0] x;
 	input [N-1:0] y;

	output [2*N-1:0] result;
	
	wire  [N-1:0] s [N-1:0];
	wire  [N-1:0] carries [N-1:0];
	
	genvar i;
	genvar j;
	generate for (i = 0; i < N; i = i + 1)
	begin: first_loop
		for (j = 0; j < N; j = j+1)
			begin: second_loop
				if ( j != 0 && i != 0 && j != N-1)
					full_adder fa (s[i][j], carries[i][j], s[i-1][j+1], x[j] * y[i], carries[i][j-1]);
				else if (i == 0) begin
					and (s[i][j], x[j], y[0]);
					and (carries[i][j], 0, 0);
				end
				else if (j == 0)
					half_adder ha (s[i][j], carries[i][j], s[i-1][j+1], x[j] * y[i]);
				else if (j == N -1)
					full_adder fb (s[i][j], carries[i][j], carries[i-1][j], x[j] * y[i], carries[i][j-1]);
			end
		end
	endgenerate

	genvar t;
	generate for (t = 0; t < 2*N ; t = t+1)
		begin: result_loop
			if (t <= N -1)
				or(result[t], s[t][0], s[t][0]);
			else if (t != 2*N -1)
				or(result[t], s[N-1][t-N+1], s[N-1][t - N + 1]);
			else
				or (result[2*N-1], carries[N-1][N-1], carries[N-1][N-1]);
				
		end
	endgenerate
	
endmodule

module half_adder (S, C, A, B);

    input A , B; 
    output S , C;
    xor ( S , A , B );
    and ( C , A , B );

endmodule 

module full_adder (output sum, output c_out, input a, input b, input c_in);  

	assign {c_out, sum} = a + b + c_in;  
	
endmodule