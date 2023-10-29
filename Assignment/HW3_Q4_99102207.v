module new_counter (count, done, load, data_in, clk);

	parameter N = 32;

	output reg [5:0] count;
	output reg done;

	input load;
	input clk;
	input [N-1:0] data_in;
	
	integer j = 0;

	always @(posedge clk)
	begin
		if (load)
		begin
			j = 0;
			done = 0;
			count = 0;
		end

		else if (done == 0)
		begin
            if(data_in[N - 1 - j])
			begin
                count = count + 1;
            end
            if (j == N - 1)
                done = 1;

        end
    end

endmodule