`timescale 1ns / 1ps

module sequence_translator(
    input clk,
    input [29:0] sequences,
    input storage_sent,
    output reg[23:0] translated_characters = 0,
    output reg transmit = 0
    );

    always @ (posedge clk) begin
        if (storage_sent == 1'b1) begin
            case(sequences[29:20]) // First Sequence
                10'b0101011111 :  translated_characters[23:16] = 8'b01001111; // O
                10'b0000001111 :  translated_characters[23:16] = 8'b01010011; // S
                10'b1111111111 :  translated_characters[23:16] = 8'b00000000; //Invalid sequence (null)
            endcase
            case(sequences[19:10]) // Second Sequence
                10'b0101011111 :  translated_characters[15:8] = 8'b01001111; // O
                10'b0000001111 :  translated_characters[15:8] = 8'b01010011; // S
                10'b1111111111 :  translated_characters[15:8] = 8'b00000000; //Invalid sequence (null)
            endcase
            case(sequences[9:0]) // Second Sequence
                10'b0101011111 :  translated_characters[7:0] = 8'b01001111; // O
                10'b0000001111 :  translated_characters[7:0] = 8'b01010011; // S
                10'b1111111111 :  translated_characters[7:0] = 8'b00000000; //Invalid sequence (null)
            endcase
            transmit = 1; // Let transmitter know when to display the characters
        end
        else transmit = 0;
    end
endmodule

//module sequence_translator(
//    input clk,
//    input [29:0] sequences,
//    input storage_sent,
//    output reg[23:0] translated_characters = 0
//    );
    
//    integer i;
    
//    integer counter=0;
//    reg[9:0] temp_seq = 0;
//    reg[23:0] temp_characters = 0;

//    always @ (posedge clk) begin
//        if (storage_sent == 1'b1) begin
//            for (i = 29; i>=0; i=i-1) begin
//                   temp_seq=temp_seq<<1;
//                   temp_seq=temp_seq+sequences[i];
//                   counter=counter+1;
              
//                if(counter%10==0)begin
//                case (temp_seq)  
//                    10'b0101011111 : begin
//                                        temp_characters = temp_characters<<8;
//                                        temp_characters = temp_characters+ 8'b01001111;//O
                                        
//                                     end
//                    10'b0000001111 : begin
//                                        temp_characters=temp_characters<<8;
//                                        temp_characters = temp_characters+ 8'b01010011;//S
                                        
//                                     end
//                    10'b1111111111 : begin
//                                        temp_characters = temp_characters<<8;
//                                        temp_characters = temp_characters+ 8'b00000000; //Invalid sequence (null)
//                                 end                                                                                   
//                endcase
//                temp_seq=10'b0;  // Reset to load next sequence
//                end  
//            end
//            translated_characters<=temp_characters;
//        end
//    end
//endmodule
