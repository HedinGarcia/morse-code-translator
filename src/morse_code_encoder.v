`timescale 1ns / 1ps

// Verilog module for the Morse Code Encoder in Morse Code Translator Project

module morse_code_encoder(
    input Dot, Dash, Space, EndSeq,
    output reg [2:0] Signals
    );
    always @ (*) begin
        if (Dot) Signals <= 3'b000; // Dot
        else if (Dash) Signals <= 3'b001; // Dash
        else if (Space) Signals <= 3'b010; // Space
        else if (EndSeq) Signals <= 3'b011; // End Sequence
        else Signals <= 3'b111; // Ignore
    end
endmodule
