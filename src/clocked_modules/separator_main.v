`timescale 1ns / 1ps

module separator_main(
    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
    output dot_buzzer, dash_buzzer,
    output spa_end, sent,
    output [9:0] FirstSeq // Output of Separator
    );
    
    // Sound Generator
    sound_generator Sound (Dot, Dash, dot_buzzer, dash_buzzer);
    // Encoder
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    // Clock Divider
    wire newClk;
    DivideBy10Counter clkdiv(clk, newClk);
    // Producer
    wire [9:0] EncSeq;
    sequence_producer Producer (newClk, Signals, Clear, Reset, EncSeq, spa_end, sent);
    // Separator
    wire sentFlagSep;
    wire [9:0] SecSeq;
    sequence_separator Separator(newClk, EncSeq, spa_end, sent, sentFlagSep, FirstSeq, SecSeq);
endmodule

// Module for separator_main_test
//module separator_main(
//    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
//    output dot_buzzer, dash_buzzer,
//    output [9:0] EncSeq,
//    output spa_end, sent,
//    output [9:0] FirstSeq, SecSeq // Output of Separator
//    );
    
//    // Sound Generator
//    sound_generator Sound (Dot, Dash, dot_buzzer, dash_buzzer);
//    // Encoder
//    wire [2:0] Signals;
//    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
//    // Clock Divider
//    wire newClk;
//    DivideBy10Counter clkdiv(clk, newClk);
//    // Producer
////    wire [9:0] EncSeq;
//    sequence_producer SP (newClk, Signals, Clear, Reset, EncSeq, spa_end, sent);
//    // Separator
//    wire sentFlagSep;
////    wire [9:0] SecSeq;
//    sequence_separator Separator(newClk, EncSeq, spa_end, sent, sentFlagSep, FirstSeq, SecSeq);
//endmodule
