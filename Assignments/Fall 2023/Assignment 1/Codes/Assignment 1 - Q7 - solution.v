module unsigned_multiplier(result, a, b);
    parameter N = 4;
    input wire [N - 1:0] a;
    input wire [N - 1:0] b;
    output reg [2 * N - 1:0] result;
    always @(*)
    begin
        result = a * b;
    end
endmodule