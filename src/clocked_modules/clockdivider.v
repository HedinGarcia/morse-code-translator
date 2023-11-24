`timescale 1ns / 1ps

module DivideBy10Counter (CLK, newCLK);
    input CLK;
    output reg newCLK;
    reg [3:0] state = 4'b0000, nextstate= 4'b0000;
    parameter S0=4'b0, S1=4'b1, S2=4'b10, S3=4'b11, S4=4'b100, S5=4'b101, S6=4'b110, S7=4'b111,
           S8=4'b1000, S9=4'b1001, S10=4'b1010, S11=4'b1011, S12=4'b1100, S13=4'b1101, S14=4'b1110,
           S15=4'b1111;
    
    always @ (CLK) begin
           if(CLK == 0) begin
                state <= nextstate;         
           end
           case (state)
                 S0: begin nextstate = S1; newCLK = 1'b0; end
                 S1: begin nextstate = S2; newCLK = 1'b0; end
                 S2: begin nextstate = S3; newCLK = 1'b0; end
                 S3: begin nextstate = S4; newCLK = 1'b0; end
                 S4: begin nextstate = S5; newCLK = 1'b0; end
                 S5: begin nextstate = S6; newCLK = 1'b0; end
                 S6: begin nextstate = S7; newCLK = 1'b0; end
                 S7: begin nextstate = S8; newCLK = 1'b0; end
                 S8: begin nextstate = S9; newCLK = 1'b0; end
                 S9: begin nextstate = S0; newCLK = 1'b1; end
                 S10: nextstate = S10;
                 S11: nextstate = S11;
                 S12: nextstate = S12;
                 S13: nextstate = S13;
                 S14: nextstate = S14;
                 S15: nextstate = S15;
           endcase
       end 
endmodule

//Divide-By-Five Counter
module DivideBy5Counter (CLK, newCLK);
    input CLK;
    output reg newCLK;
    reg [2:0] state, nextstate;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
    //Count to five in binary using a Moore machine model
    initial begin
        state = S0;
    end
    
    always @ (CLK) begin
           if(CLK == 0) begin
                state <= nextstate;         
           end
           case (state)
                  S0: begin nextstate = S1; newCLK = 1'b0; end
                  S1: begin nextstate = S2; newCLK = 1'b0; end
                  S2: begin nextstate = S3; newCLK = 1'b0; end
                  S3: begin nextstate = S4; newCLK = 1'b0; end
                  S4: begin nextstate = S0; newCLK = 1'b1; end
                  S5: nextstate = S5;
                  S6: nextstate = S6;
                  S7: nextstate = S7;
           endcase
     end
endmodule

// Divide-By-Two Counter
module DivideBy2Counter (CLK, newCLK);
    input CLK;
    output reg newCLK;
    reg [1:0] state = 2'b00, nextstate = 2'b00;  // Reduce the state width to 2 bits
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;  // Adjust the parameter values
    
    always @ (CLK) begin  // Change to posedge for synchronous operation
        if(CLK == 0) begin
            state <= nextstate;         
        end
        case (state)
            S0: begin nextstate = S1; newCLK = 1'b0; end
            S1: begin nextstate = S2; newCLK = 1'b1; end
            S2: begin nextstate = S3; newCLK = 1'b0; end
            S3: begin nextstate = S0; newCLK = 1'b1; end
        endcase
    end
endmodule
