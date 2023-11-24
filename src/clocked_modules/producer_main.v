`timescale 1ns / 1ps

module producer_main(
    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
    output dot_buzzer, dash_buzzer,
    output [9:0] outputbits, 
    output spa_end, sent);
    
    // Sound Generator
    sound_generator(Dot, Dash, dot_buzzer, dash_buzzer);
    // Encoder
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    // Clock Divider
    wire newClk;
    DivideBy10Counter clkdiv(clk, newClk);
    // Producer
    sequence_producer SP (newClk, Signals, Clear, Reset, outputbits, spa_end, sent);
endmodule
