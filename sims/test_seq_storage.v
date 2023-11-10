`timescale 1ns / 1ps

// Test bench for sequence storage

module test_sequence_storage();
    reg reset, enter;
    reg[9:0] first_seq, sec_seq;
    wire [159:0] o_sequence;
    sequence_storage strorage_1(reset,enter, first_seq, sec_seq,o_sequence);

    initial begin
        reset = 1'b1; #10;
        reset = 1'b0; #10;
        
        // Sequences: [01, 00, , , ] & [ , , , , ]
        first_seq=10'b0100111111;
        sec_seq=10'b1111111111;
        #10;
        
        // Sequences: [00, 01, 00, 01, 00] & [10 , , , , ]
        first_seq=10'b0001000100;
        sec_seq=10'b1011111111;
        #10;
        
        // Sequences: [10, , , , ] & [ , , , , ]
        first_seq=10'b1011111111;
        sec_seq=10'b1111111111;
        #10;

       //enter
        enter=1'b1;#10;
        enter=1'b0;#10;
       
    end
endmodule