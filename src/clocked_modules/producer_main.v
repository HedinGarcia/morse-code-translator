`timescale 1ns / 1ps

module producer_main(
    input clk, Dot, Dash, Space, EndSeq, Clear, Reset,
    output [9:0] outputbits, 
    output spa_end, sent);
    
    wire [2:0] Signals;
    morse_code_encoder MCE(Dot, Dash, Space, EndSeq, Signals);
    wire newClk;
    DivideBy10Counter clkdiv(clk, newClk);
    sequence_producer SP (newClk, Signals, Clear, Reset, outputbits, spa_end, sent);
endmodule
