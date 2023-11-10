`timescale 1ns / 1ps

// Test bench for Sequence Producer

module test_seq_prod();
    reg Dot, Dash, Space, EndSeq;
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    reg Clear, Reset;
    wire [9:0] EncSeq;
    wire Space_EndSeqbar, SentFlag;
    sequence_producer SP (Signals, Clear, Reset, EncSeq, Space_EndSeqbar, SentFlag);
    
    initial begin
        Clear = 1'b1; #10
        Clear = 1'b0; #10
        
        // First Sequence to test: [00, 01, 00, 00, ]
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;
        
        // Second Sequence to test: [ , , , , ]
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;
        
        // Third Sequence to test: [00, 01, 00, 00, ]
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a EndSeq Signal
        EndSeq = 1'b1; #10;
        EndSeq = 1'b0; #10;
    end    
endmodule
