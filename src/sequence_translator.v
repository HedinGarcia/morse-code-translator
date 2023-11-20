`timescale 1ns / 1ps

module sequence_translator(
    input [159:0] sequences,
    output reg[127:0] translated_characters
    );
    
    integer i;
    
    integer counter=0;
    reg[9:0] temp_seq=10'b0;
    reg[127:0] temp_letters=128'b0;

    always @ (sequences) begin
        for (i = 159; i>=0; i=i-1) begin
               temp_seq=temp_seq<<1;
               temp_seq=temp_seq+sequences[i];
               counter=counter+1;
          
            if(counter%10==0)begin
             $display("temp_seq = %b", temp_seq);
            case (temp_seq)  
                10'b0001111111 : begin 
                                    temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000001;//A
                                 end
                10'b0100000011 :  begin
                                    temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000010;//B
                                    
                                  end
                10'b0100010011 : begin
                                    temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000011;//C
                                    
                                 end 
                10'b0100001111 : begin
                                    temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000100;//D
                                    
                                 end
                10'b0011111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000101;//E
                                    
                                 end
                10'b0000010011 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000110;//F
                                    
                                 end
                10'b0101001111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01000111;//G
                                    
                                 end
                10'b0000000011 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001000;//H
                                    
                                 end
                10'b0000111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001001;//I
                                    
                                 end
                10'b0001010111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001010;//J
                                    
                                 end
                10'b0100011111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001011;//K
                                    
                                 end
                10'b0001000011 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001100;//L
                                    
                                 end 
                10'b0101111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001101;//M
                                    
                                 end
                10'b0100111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001110;//N
                                    
                                 end
                10'b0101011111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01001111;//O
                                    
                                 end
                10'b0001010011 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010000;//P
                                    
                                 end
                10'b0101000111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010001;//Q
                                    
                                 end 
                10'b0001001111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010010;//R
                                    
                                 end
                10'b0000001111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010011;//S
                                    
                                 end
                10'b0111111111 : begin
                                    temp_letters = temp_letters+ 8'b01010100;//T
                                    
                                 end
                10'b0000011111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010101;//U
                                    
                                 end
                10'b0000000111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010110;//V
                                    
                                 end
                10'b0001011111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01010111;//W
                                    
                                 end
                10'b0100000111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01011000;//X
                                    
                                 end
                10'b0100010111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01011001;//Y
                                    
                                 end 
                10'b0101000011 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b01011010;//Z
                                    
                                 end 
                10'b0001010101 : begin
                temp_letters=temp_letters<<8;
                                   temp_letters = temp_letters+ 8'b00110001;//1
                                    
                                 end 
                10'b0000010101 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110010;//2
                                    
                                 end 
                10'b0000000101 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110011;//3
                                    
                                 end
                10'b0000000001 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110100;//4
                                    
                                 end
                10'b0000000000 : begin
                                    temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110101;//5
                                    
                                 end
                10'b0100000000 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110110;//6
                                    
                                 end
                10'b0101000000 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110111;//7
                                    
                                 end 
                10'b0101010000 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00111000;//8
                                    
                                 end
                10'b0101010100 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00111001;//9
                                    
                                 end
                10'b0101010101 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00110000;//0
                                    
                                 end
                10'b1011111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00100000;//space
                                    
                                 end
                10'b1111111111 : begin
                temp_letters=temp_letters<<8;
                                    temp_letters = temp_letters+ 8'b00000000;//Invalid sequence (null)
                                    
                                 end                                                                               
            endcase
            //reset temp_seq and it's counter to load next sequence
            temp_seq=10'b0;  
            end  
        end
        translated_characters<=temp_letters;
    end
endmodule