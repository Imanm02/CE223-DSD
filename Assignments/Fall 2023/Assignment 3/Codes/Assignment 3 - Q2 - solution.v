// ماژول تست برای نمایش عملکرد تابع complement_two
module test;
    parameter N = 64; // طول حداکثری بردار

    // تابع برای محاسبه تکمیل به دو
    function [N-1: 0] complement_two;
        input [N-1:0] input_vector; // بردار ورودی
        input integer length; // طول واقعی بردار ورودی
        integer i; // شمارنده حلقه
        reg fl; // پرچم برای نگهداری وضعیت bit
        begin
            i = 0;
            fl = 1'b0;
            // حلقه برای محاسبه تکمیل به دو
            for (; i < length; i = i + 1) begin
                complement_two[i] = input_vector[i] ^ fl;
                fl = fl | input_vector[i];
            end
            // تنظیم بیت‌های باقی‌مانده به صفر
            for(; i < N; i = i + 1) 
                complement_two[i] = 0;
        end
    endfunction

    // تست تابع با مقادیر مختلف
    reg [N-1:0] A, B;
    initial begin
        A = 0; B = 0;

        // تست مقادیر مختلف
        A = 5'b00000;
        B = complement_two(A, 5);
        $display("%b -> %b", A, B);
        #10;

        A = 5'b00111;
        B = complement_two(A, 5);
        $display("%b -> %b", A, B);
        #10;

        A = 7'b1001100;
        B = complement_two(A, 7);
        $display("%b -> %b", A, B);
        #10;

        A = 64'b1111111111111111111111111111111111111111111111111111111111111111;
        B = complement_two(A, 64);
        $display("%b -> %b", A, B);
        #10;
    end

    // تنظیمات برای ضبط waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end
endmodule