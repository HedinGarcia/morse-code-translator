`timescale 1ns / 1ps

// Verilog module thst connects all the components for the Morse Code Translator Project

module morse_code_main(
    input Dot, Dash, Space, EndSeq, Enter, Clear, Reset,
    output reg [127:0] translatedCharacters);
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    wire [9:0] EncSeq;
    wire Space_EndSeqbar, SentFlagSP;
    sequence_producer SP (Signals, Clear, Reset, EncSeq, Space_EndSeqbar, SentFlagSP);
    wire sentFlagSS;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator SS ( EncSeq, Space_EndSeqbar, SentFlagSP, sentFlagSS, FirstSeq, SecSeq);
    wire [159:0] o_sequence;
    sequence_storage SeqStor (Reset, Enter, sentFlagSS, FirstSeq, SecSeq, o_sequence);
    wire [127:0] translatedCh;
    Morse_Code_Translator M_Translator(o_sequence, translatedCh);
    always @ (translatedCh) begin
        translatedCharacters <= translatedCh;
    end
    initial begin
        $monitor("Translated Characters: %b", translatedCharacters);
    end
endmodule
