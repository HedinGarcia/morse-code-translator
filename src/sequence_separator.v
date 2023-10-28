`timescale 1ns / 1ps

// Verilog module for the Sequence Separator in Morse Code Translator Project

module sequence_separator(
    input [9:0] EncSeq,
    input Space_EndSeqbar,
    output reg [9:0] FirstSeq, SecSeq
    );
    always @ (*) begin
        if (Space_EndSeqbar == 0 ) begin // EndSeq was pressed
            FirstSeq <= EncSeq;
            SecSeq <= 10'b1111111111; // Empty sequence
        end
        else if (Space_EndSeqbar == 1) begin // Space was pressed
            // Check whether the input sequence is empty with "11" in the 2 MSB
            if({EncSeq[9],EncSeq[8]} == 2'b11) begin
                // Set space to be in first sequence
                FirstSeq <= 10'b1111111111;
                {FirstSeq[9],FirstSeq[8]} <= 2'b10; // Space
                SecSeq <= 10'b1111111111; // Empty sequence
            end
            else begin
                // The input sequence is not empty, set space in second sequence
                FirstSeq <= EncSeq;
                SecSeq <= 10'b1111111111;
                {SecSeq[9],SecSeq[8]} <= 2'b10; // Space
            end
        end
    end
endmodule
