`timescale 1ns / 1ps

module test_main();
    reg Dot, Dash, Space, EndSeq, Enter, Clear, Reset;
    wire [127:0] translatedCharacters;
    morse_code_main Main (Dot, Dash, Space, EndSeq, Enter, Clear, Reset, translatedCharacters);
    
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
