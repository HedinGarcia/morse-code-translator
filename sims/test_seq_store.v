`timescale 1ns / 1ps

// Test bench for sequence storage

module test_seq_store();
    reg Dot, Dash, Space, EndSeq, Enter;
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    reg Clear, Reset;
    wire [9:0] EncSeq;
    wire Space_EndSeqbar, SentFlag;
    sequence_producer SP (Signals, Clear, Reset, EncSeq, Space_EndSeqbar, SentFlag);
    wire sentFlag;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator SS ( EncSeq, Space_EndSeqbar, SentFlag, sentFlag, FirstSeq, SecSeq);
    wire [159:0] o_sequence;
    sequence_storage SeqStor (Reset, Enter, SentFlag, FirstSeq, SecSeq, o_sequence);
    
    initial begin
        Reset = 1'b1; #10
        Reset = 1'b0; #10
        
        // First Sequence to test: [00, 01, 11, 11, 11]
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;
        
        // Send a Dash signal
        Dash = 1'b1; #10;
        Dash = 1'b0; #10;
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;

        // Expected sequences to be input in storage:
        // first_seq=10'b00 01 11 11 11; <- A
        // sec_seq=10'b10 11 11 11 11; <- Space
        
        // Second Sequence to test: [ , , , , ]
        
        // Send a Space Signal
        Space = 1'b1; #10;
        Space = 1'b0; #10;

        // Expected sequences to be input in storage:
        // first_seq=10'b10 11 11 11 11; <- Space
        // sec_seq=10'b11 11 11 11 11; <- Invalid
        
        // Third Sequence to test: [00, 00, 00, 01, 01]
        
        // Specify how many times these sequences should repeat
        for (integer i = 0; i < 2; i = i + 1) begin
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
    
            // Expected sequences to be input in storage:
            // first_seq=10''b00 00 00 01 01; <- 3
            // sec_seq=10'b10 11 11 11 11; <- Space
        end
        
        // Fourth Sequence to test: [ , , , , ]
        
        // Send a Dot signal
        Dot = 1'b1; #10;
        Dot = 1'b0; #10;

        Clear = 1'b1; #10
        Clear = 1'b0; #10
        
        // Send a EndsSeq Signal
        EndSeq = 1'b1; #10;
        EndSeq = 1'b0; #10;

        // Expected sequences to be input in storage:
        // first_seq=10'b11 11 11 11 11; <- Invalid
        // sec_seq=10'b11 11 11 11 11; <- Invalid
        
        // Send an Enter signal
        Enter = 1'b1; #10;
        Enter = 1'b0; #10;
    end
endmodule