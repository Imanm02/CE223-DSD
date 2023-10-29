module first_one(A, Y, NONE);

    input wire [7:0] A;
	output reg [2:0] Y;
	output reg NONE;

    integer i;

    always @(A)
	begin
		NONE = 1;
		eleman = 0;
		for(i = 7; i >= -1; i = i - 1)
        begin
            if(~eleman)
			begin
				if (A[i])
				begin
					eleman = 1;
					NONE = 0;
					Y = i;
				end
				else 
					i = i - 1;
			end
	    end
    end

endmodule