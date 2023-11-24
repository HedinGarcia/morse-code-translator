`timescale 1ns / 1ps

// Verilog module for the Sound Generator in Morse Code Translator Projects

module sound_generator(input Dot, Dash, output reg dot_buzzer, dash_buzzer);
    always @(Dot, Dash) begin
        dot_buzzer <= Dot;
        dash_buzzer <= Dash;
    end
endmodule