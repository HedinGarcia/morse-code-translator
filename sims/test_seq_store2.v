`timescale 1ns / 1ps

module test_seq_store2();
    reg Dot, Dash, Space, EndSeq, Enter;
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    reg Clear, Reset;
    wire [9:0] EncSeq;
    wire Space_EndSeqbar, SentFlagPP;
    sequence_producer SP (Signals, Clear, Reset, EncSeq, Space_EndSeqbar, SentFlagPP);
    wire sentFlagSS;
    wire [9:0] FirstSeq, SecSeq;
    sequence_separator SS ( EncSeq, Space_EndSeqbar, SentFlagPP, sentFlagSS, FirstSeq, SecSeq);
    wire [159:0] store_seqs;
    sequence_storage SeqStor (Reset, Enter, sentFlagSS, FirstSeq, SecSeq, store_seqs);
    wire [127:0] translated_characters;
    sequence_translator M_Translator(store_seqs, translated_characters);
    
    initial begin
        Reset = 1'b1; #10
        Reset = 1'b0; #10
        
        //Input sequence will be "ABCD 0"
        
        //Input A
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input B
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input Space
        Space = 1'b1; #10
        Space = 1'b0; #10
        
        //Input C
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input D
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input 1
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        Dash = 1'b1; #10
        Dash = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10

        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input E
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Input S
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        Dot = 1'b1; #10
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #10
        EndSeq = 1'b0; #10
        
        //Enter
        Enter = 1'b1; #10
        Enter = 1'b0; #10;
        
    end
endmodule