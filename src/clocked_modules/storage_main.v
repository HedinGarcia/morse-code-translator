`timescale 1ns / 1ps

module storage_main(
    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
    input Enter,
    output dot_buzzer, dash_buzzer,
    output spa_end, sent,
    output reg [9:0] o_sequence, // Output of Storage
    output storageSent
    );
    // Sound Generator
    sound_generator Sound (Dot, Dash, dot_buzzer, dash_buzzer);
    // Encoder
    wire [2:0] Signals;
    morse_code_encoder Encoder(Dot, Dash, Space, EndSeq, Signals);
    // Clock Divider
    wire newClk;
    DivideBy10Counter clkdiv(clk, newClk);
    // Producer
    wire [9:0] EncSeq;
    sequence_producer Producer (newClk, Signals, Clear, Reset, EncSeq, spa_end, sent);
    // Separator
    wire sentFlagSep;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator Separator(newClk, EncSeq, spa_end, sent, sentFlagSep, FirstSeq, SecSeq);
    // Storage
    wire [29:0] store_seqs;
    sequence_storage Storage(newClk, Reset, Enter, sentFlagSep, FirstSeq, SecSeq, store_seqs, storageSent);
    
    always @ (store_seqs) begin
        o_sequence = {store_seqs[29:20]};
    end
endmodule

//// Module for storage_main_test
//module storage_main(
//    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
//    input Enter,
//    output dot_buzzer, dash_buzzer,
//    output spa_end, sent,
//    output sentFlagSep,
//    output [9:0] FirstSeq, SecSeq,
//    output reg [9:0] o_sequence, // Output of Storage
//    output [29:0] store_seqs,
//    output storageSent
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
//    wire [9:0] EncSeq;
//    sequence_producer Producer (newClk, Signals, Clear, Reset, EncSeq, spa_end, sent);
//    // Separator
////    wire sentFlagSep;
////    wire [9:0] FirstSeq, SecSeq;
//    sequence_separator Separator(newClk, EncSeq, spa_end, sent, sentFlagSep, FirstSeq, SecSeq);
//    // Storage
////    wire [29:0] store_seqs;
//    sequence_storage Storage(newClk, Reset, Enter, sentFlagSep, FirstSeq, SecSeq, store_seqs, storageSent);
    
//    always @ (store_seqs) begin
//        o_sequence = {store_seqs[29:20]};
//    end
//endmodule
