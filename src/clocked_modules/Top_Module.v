module Top_Module(
    //input [15:0] data,
    input clk,
    input transmit,
    input btn,
    output TxD,
    output TxD_debug,
    output transmit_debug,
    output btn_debug,
    output clk_debug
    );
    
    wire transmit_out;
//    reg [23:0] data=0'h534F53;
 reg [23:0] data=0'h414243;
    
    Transmitter T1(clk, data, transmit,btn,  TxD);
    Debounce_Signals DB(clk, transmit, transmit_out);
    
    assign TxD_debug = TxD;
    assign transmit_debug = transmit_out;
    assign btn_debug = btn;
    assign clk_debug = clk;
    
    
    
endmodule