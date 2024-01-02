// ماژول DSP برای ضرب دو عدد 32 بیتی
module DSP(c, a, b);
    input [31:0] a, b;    // دو عدد ورودی 32 بیتی
    output [63:0] c;      // خروجی 64 بیتی

    // انجام عملیات ضرب
    assign c = a * b;
endmodule

// ماژول ضرب‌کننده برای ضرب دو عدد بزرگ
module multiplier(clock, start, in1, in2, ready, out);
    parameter N = 128;    // اندازه ورودی‌ها

    input clock, start;   // سیگنال‌های کلاک و شروع
    input [N-1:0] in1, in2; // ورودی‌های N بیتی

    output reg ready;     // سیگنال آماده بودن
    output reg [2*N-1:0] out; // خروجی 2N بیتی

    parameter M = N/32;   // تعداد بخش‌های 32 بیتی

    reg [4:0] i, j;       // شمارنده‌های حلقه
    reg [31:0] a, b;      // بخش‌های ورودی برای ضرب
    wire [63:0] c;        // خروجی ضرب‌کننده DSP
    reg flag;             // پرچم برای کنترل فرایند

    DSP instantiate(c, b, a); // نمونه‌سازی از ماژول DSP

    // مقداردهی اولیه
    initial begin
        out <= 0;
        ready <= 0;
        i <= 0;
        j <= 0;
        flag <= 0;
    end

    // بلوک always با فعال‌سازی در لبه مثبت کلاک
    always @(posedge clock) begin
        if (start) begin
            out <= 0;
            ready <= 0;
            i <= 0;
            j <= 0;
            flag <= 1;
        end
        if (flag) begin
            if (i < M) begin
                if (j < M) begin
                    a = in1[32*i+:32];
                    b = in2[32*j+:32];

                    out <= out + (c << (i + j) * 32);

                    j <= j + 1;
                end else begin
                    j <= 0;
                    i <= i + 1;
                end
            end else ready <= 1;
        end
    end
endmodule