`timescale 1ns / 1ps

// Test bench for Sequence Separator

module test_seq_sep();
    reg Dot, Dash, Space, EndSeq;
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    reg Clear, Reset;
    wire [9:0] EncSeq;
    wire Space_EndSeqbar, SentFlag;
    sequence_producer SP (Signals, Clear, Reset, EncSeq, Space_EndSeqbar, SentFlag);
    wire sentFlag;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator SS ( EncSeq, Space_EndSeqbar, SentFlag, sentFlag, FirstSeq, SecSeq);
    
    initial begin
        Clear = 1'b1; #10
        Clear = 1'b0; #10
        
        // First Sequence to test: [00, 01, 00, 00, 01]
        
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
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a EndsSeq Signal
        EndSeq = 1'b1; #10;
        EndSeq = 1'b0; #10;
        
        // Second Sequence to test: [ , , , , ]
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;
        
        // Third Sequence to test: [ 00, 00, 00, 01, 01]
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;
        
        // Fourth Sequence to test: [ , , , , ]
        
        // Send a EndsSeq Signal
        EndSeq = 1'b1; #10;
        EndSeq = 1'b0; #10;

        // Fifth Sequence to test: [ , , , , ]
        // Clear halfway:
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;

        // Send a Clear Signal
        Clear = 1'b1; #10;
        Clear = 1'b0; #10;

        // Send a Reset Signal
        Reset = 1'b1; #10;
        Reset = 1'b0; #10;

        // Send a EndsSeq Signal
        EndSeq = 1'b1; #10;
        EndSeq = 1'b0; #10;
    end
endmodule
