module sd_mealy (input clk, input reset, input in, output out);

parameter state0 = 2'b00;
parameter state1 = 2'b01;
parameter state2 = 2'b10;
parameter state3 = 2'b11;

reg [1:0] output_register;
reg [1:0] state;

always @(posedge clk or posedge reset)
    begin
    if (reset)
        state <= state0;
    else
        begin
        case (state)
            state0: begin
                case (in)
                    1'b0: begin
                        state <= state0;
                        output_register <= 1'b0;
                    end
                    1'b1: begin
                        state <= state1;
                        output_register <= 1'b0;
                    end
                endcase
            end
            state1: begin
                case (in)
                    1'b0: begin
                        state <= state2;
                        output_register <= 1'b0;
                    end
                    1'b1: begin
                        state <= state1;
                        output_register <= 1'b0;
                    end
                endcase
            end
            state2: begin
                case (in)
                    1'b0: begin
                        state <= state3;
                        output_register <= 1'b0;
                    end
                    1'b1: begin
                        state <= state1;
                        output_register <= 1'b0;
                    end
                endcase
            end
            state3: begin
                case (in)
                    1'b0: begin
                        state <= state0;
                        output_register <= 1'b0;
                    end
                    1'b1: begin
                        state <= state0;
                        output_register <= 1'b1;
                    end
                endcase
            end
            default: begin
                state <= state0;
                output_register <= 1'b0;
            end
        endcase
        end
    end

assign out = output_register;

endmodule
