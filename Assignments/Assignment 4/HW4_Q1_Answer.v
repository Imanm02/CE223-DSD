module fsm(out, in, clk, reset);

input in;
input clk;
input reset;

output out;

parameter state0 = 3'b000;
parameter state1 = 3'b001;
parameter state2 = 3'b010;
parameter state3 = 3'b011;
parameter state4 = 3'b100;
parameter state5 = 3'b101;

reg [2:0] state;
reg output_register;

always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= state0;
        else
            case (state)
                state0:
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
                state1:
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
                state2:
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
                state3:
                    case (in)
                        1'b0: begin
                            state <= state0;
                            output_register <= 1'b0;
                        end
                        1'b1: begin
                            state <= state4;
                            output_register <= 1'b0;
                        end
                    endcase
                state4:
                    case (in)
                        1'b0: begin
                            state <= state1;
                            output_register <= 1'b0;
                        end
                        1'b1: begin
                            state <= state5;
                            output_register <= 1'b0;
                        end
                    endcase
                state5:
                    case (in)
                        1'b0: begin
                            state <= state3;
                            output_register <= 1'b0;
                        end
                        1'b1: begin
                            state <= state1;
                            output_register <= 0'b1;
                        end
                    endcase
                    default: begin
                        state <= state0;
                        output_register <= 0'b0;
                    end

            endcase
    end

assign out = output_register;

endmodule