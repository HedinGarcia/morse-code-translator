`timescale 1ns / 1ps

// Verilog module for the Sequence Producer in Morse Code Translator Project

module sequence_producer(
    input [2:0] Signals,
    input Clear, Reset, 
    output reg [9:0] EncSeq,
    output reg Space_EndSeqbar, SentFlag
    );
    reg [9:0] buffer;
    reg [3:0] buffer_index; // Counter to keep track of where to store the Signals bits
    reg bufferSent;
    
    initial begin
        SentFlag = 1;
    end
    
    always @ ( Signals, Clear, Reset) begin
        if( Clear || Reset || bufferSent) begin
            buffer <= 10'b1111111111; // Clear the buffer
            buffer_index <= 10; // Reset the buffer_index to the MSB
            bufferSent <= 0;
        end
        if (Signals == 3'b000 || Signals == 3'b001) begin // Dot or Dash
            if (buffer_index > 0) begin
                buffer[buffer_index-1] <= Signals[1];
                buffer[buffer_index-2] <= Signals[0];
                buffer_index <= buffer_index - 2;
            end
        end
        else if(Signals == 3'b010) begin // Space
            EncSeq <= buffer;
            Space_EndSeqbar <= 1;
            bufferSent <= 1;
            SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
        end
        else if(Signals == 3'b011) begin // EndSeq
            EncSeq <= buffer;
            Space_EndSeqbar <= 0;
            bufferSent <= 1;
            SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
        end
    end
endmodule