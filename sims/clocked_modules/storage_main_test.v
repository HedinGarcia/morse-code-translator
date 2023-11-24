`timescale 1ns / 1ps

module storage_main_test();
    reg clk, Dot, Dash, Space, EndSeq, Enter, Clear, Reset;
    reg Enter;
    wire dot_buzzer, dash_buzzer;
    wire spa_end, sent;
    wire sentSeparator;
    wire [9:0] FirstSeq, SecSeq;
    wire [9:0] o_sequence;
    wire [29:0] store_seqs;
    wire storageSent;
    
    storage_main StorageMain(
        clk, Dot, Dash, Space, EndSeq, Clear, Reset,
        Enter,
        dot_buzzer, dash_buzzer,
        spa_end, sent,
        sentSeparator,
        FirstSeq, SecSeq,
        o_sequence, // Output of Storage
        store_seqs,
        storageSent
    );

    initial begin
        clk = 0;
        forever begin #5;
            clk = ~clk;
        end
    
    end 
    
    initial begin
        #10;
        // Store: SOS
        //Input S
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        // Inputs O
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        //Input S
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        #300;
        Enter = 1'b1; #100
        Enter = 1'b0; #10;
        
        #300;
        Reset = 1'b1; #100
        Reset = 1'b0; #10;
        
        #300;
        Enter = 1'b1; #100
        Enter = 1'b0; #10;
        
        // Store: OSO
        
        // Inputs O
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        //Input S
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        Dot = 1'b1; #100
        Dot = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        // Inputs O
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        Dash = 1'b1; #100
        Dash = 1'b0; #10
        
        EndSeq = 1'b1; #100
        EndSeq = 1'b0; #10;
        
        #300;
        Enter = 1'b1; #100
        Enter = 1'b0; #10;
        
        
    end
endmodule
