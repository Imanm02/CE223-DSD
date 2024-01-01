module key_checker (clock, reset, start, in, key, ready, valid, out);

    // تعریف پارامترها برای اندازه‌های بیت
    parameter N = 32; // تعداد چرخه‌ها
    parameter W = 32; // عرض ورودی
    parameter M = N * W; // کل عرض برای خروجی و کلید

    // تعریف ورودی‌ها و خروجی‌ها
    input clock, reset, start;
    input [W - 1:0] in;
    input [M - 1:0] key;

    output reg ready, valid;
    output reg [M - 1:0] out;

    // متغیرهای داخلی
    integer i = 0; // شمارنده برای چرخه‌ها
    reg [M - 1:0] oth; // رجیستر موقت برای پردازش

    // بلاک اولیه برای تنظیم مقادیر اولیه
    initial begin
        ready = 0;
        valid = 0;
        out = 0;
        oth = 0;
    end

    // منطق ریست: ریست کردن متغیرهای داخلی در لبه مثبت سیگنال ریست
    always @(posedge reset) begin
        ready <= 0;
        valid <= 0;
        out <= 0;
        oth <= 0;
    end

    // منطق پردازش اصلی: فعال شدن در لبه مثبت کلاک
    always @(posedge clock) begin
        if(start) begin
            // اضافه کردن 'in' به 'oth' و افزایش شمارنده وقتی استارت بالا است
            oth <= {in, oth[M-1:W]};
            i = i + 1;
            ready <= 0; // سیگنال آماده‌باش در طول پردازش پایین می‌ماند
        end
        else begin
            // تنظیم 'ready' وقتی تعداد کافی چرخه گذشته باشد
            ready <= (i >= N ? 1 : 0);
            out <= oth; // به‌روزرسانی 'out' با مقدار فعلی 'oth'
            // تنظیم 'valid' اگر 'key' با 'oth' مطابقت داشته باشد و تعداد کافی چرخه گذشته باشد
            valid <= (key == oth && i >= N ? 1 : 0);
        end
    end

endmodule