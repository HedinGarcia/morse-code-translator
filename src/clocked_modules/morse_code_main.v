`timescale 1ns / 1ps

//// Module for storage_main_test
module morse_code_main(
    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
    input Enter,
    output dot_buzzer, dash_buzzer,
    output sent, // Output from Producer
    output storageSent, // Output from Storage
    output TxD // Output from Transmitter
    );
    
    // Sound Generator
    sound_generator Sound (Dot, Dash, dot_buzzer, dash_buzzer);
    // Encoder
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    // Producer
    wire [9:0] EncSeq;
    wire spa_end;
    sequence_producer Producer (clk, Signals, Clear, Reset, EncSeq, spa_end, sent);
    // Separator
    wire sentFlagSep;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator Separator(clk, EncSeq, spa_end, sent, sentFlagSep, FirstSeq, SecSeq);
    // Storage
    wire [29:0] store_seqs;
    sequence_storage Storage(clk, Reset, Enter, sentFlagSep, FirstSeq, SecSeq, store_seqs, storageSent);
    // Translator
    wire [23:0] translated_characters;
    wire transmit;
    sequence_translator Translator (clk, store_seqs, storageSent,translated_characters, transmit);
    // Transmitter
    Transmitter UARTTransmitter(clk, translated_characters, transmit, Reset,  TxD);
endmodule