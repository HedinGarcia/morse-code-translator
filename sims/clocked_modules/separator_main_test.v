`timescale 1ns / 1ps

module separator_main_test();
    reg clk, Dot, Dash, Space, EndSeq, Enter, Clear, Reset;
    wire dot_buzzer, dash_buzzer;
    wire [9:0] EncSeq, FirstSeq, SecSeq;
    wire spa_end, sent;
    separator_main SepMain(
        clk, Dot, Dash, Space, EndSeq, Clear, Reset,
        dot_buzzer, dash_buzzer,
        EncSeq,
        spa_end, sent,
        FirstSeq, SecSeq // Output of Separator
    );

    initial begin
        clk = 0;
        forever begin #5;
            clk = ~clk;
        end
    
    end 
    
    initial begin
        #10;
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
        
    end
endmodule
