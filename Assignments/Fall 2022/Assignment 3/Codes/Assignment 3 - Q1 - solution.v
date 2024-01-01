module one_hot_counter(reset, enable, clock, out);

    input reset, enable, clock;
    output reg [7:0] out;

    always @(posedge clock)
    begin
        
        if (reset)
		begin	
			i = 0;
			for (i = 0; i < 7; i = i + 1) 
            begin
				out[i] = 0;
		    end
            out[7] = 1;
        end

        else if (enable)
		begin
			out[0] <= out[7];
            out[1] <= out[0];
            out[2] <= out[1];
            out[3] <= out[2];
            out[4] <= out[3];
            out[5] <= out[4];
            out[6] <= out[5];
            out[7] <= out[6];
		end

    end

endmodule