module sd_mealy (input clock, input reset, input in, output out);
    
    // تعریف حالت‌های ماشین حالت
    parameter state0 = 2'b00;
    parameter state1 = 2'b01;
    parameter state2 = 2'b10;
    parameter state3 = 2'b11;
    
    // تعریف رجیسترهای داخلی برای خروجی و حالت فعلی
    reg [1:0] output_register;
    reg [1:0] state;        
    
    // بلاک always که با هر لبه مثبت کلاک فعال می‌شود
    always @(posedge clock)
    begin
        if (reset == 1'b1) // اگر سیگنال reset فعال باشد
        begin
            state <= state0; // حالت اولیه را state0 قرار می‌دهیم
            output_register <= 1'b0; // خروجی را 0 می‌کنیم
        end
        else // در صورتی که reset فعال نیست
        begin
            case (state) // بررسی حالت فعلی
                state0: begin
                    // تعریف عملیات برای حالت state0
                    if (in == 1'b0) begin
                        state <= state0; // ماندن در همین حالت
                        output_register <= 1'b0; // خروجی 0
                    end
                    else begin
                        state <= state1; // تغییر حالت به state1
                        output_register <= 1'b0; // خروجی 0
                    end
                end
                state1: begin
                    // تعریف عملیات برای حالت state1
                    if (in == 1'b0) begin
                        state <= state2; // تغییر حالت به state2
                        output_register <= 1'b0; // خروجی 0
                    end
                    else begin
                        state <= state1; // ماندن در همین حالت
                        output_register <= 1'b0; // خروجی 0
                    end
                end
                state2: begin
                    // تعریف عملیات برای حالت state2
                    if (in == 1'b0) begin
                        state <= state3; // تغییر حالت به state3
                        output_register <= 1'b0; // خروجی 0
                    end
                    else begin
                        state <= state1; // تغییر حالت به state1
                        output_register <= 1'b0; // خروجی 0
                    end
                end
                state3: begin
                    // تعریف عملیات برای حالت state3
                    if (in == 1'b0) begin
                        state <= state0; // تغییر حالت به state0
                        output_register <= 1'b0; // خروجی 0
                    end
                    else begin
                        state <= state0; // تغییر حالت به state0
                        output_register <= 1'b1; // خروجی 1
                    end
                end
                default: begin
                    // در صورتی که حالتی نامشخص باشد
                    state <= state0; // حالت را به state0 تنظیم می‌کنیم
                    output_register <= 1'b0; // خروجی 0
                end
            endcase
        end
    end
    
    assign out = output_register; // انتقال مقدار رجیستر خروجی به پین خروجی

endmodule