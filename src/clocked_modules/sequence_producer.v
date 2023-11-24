`timescale 1ns / 1ps

// Verilog module for the Sequence Producer in Morse Code Translator Project

module sequence_producer(
    input clk,
    input [2:0] Signals,
    input Clear, Reset, 
    output reg [9:0] EncSeq = 0,
    output reg Space_EndSeqbar = 0, SentFlag = 0
    );
    
    reg [2:0] state = 3'b000; // State variable to represent the current state
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
    reg [9:0] buffer = 10'b1111111111;

    // Producer of Letter S or O
    always @ (posedge clk) begin
        if (Clear || Reset) begin
                EncSeq <= 10'b1111111111; // Clear the sequence
                state <= S0; // Reset the state
                SentFlag = 0;
        end
        else begin
            case(state)
                S0: begin
                        SentFlag = 0;
                        if (Signals == 3'b000) begin // Dot
                            state <= S1;
                            EncSeq <= 10'b0011111111;
                        end
                        else if (Signals == 3'b001) begin // Dash
                            state <= S1;
                            EncSeq <= 10'b0111111111;
                        end
                    end
                S1: begin
                        SentFlag = 0;
                        if (Signals == 3'b000) begin // Dot
                            state <= S2;
                            EncSeq <= 10'b0000111111;
                        end
                        else if (Signals == 3'b001) begin // Dash
                            state <= S2;
                            EncSeq <= 10'b0101111111;
                        end
                    end
                S2: begin
                        SentFlag = 0;
                        if (Signals == 3'b000) begin // Dot
                            state <= S3;
                            EncSeq <= 10'b0000001111;
                        end
                        else if (Signals == 3'b001) begin // Dash
                            state <= S3;
                            EncSeq <= 10'b0101011111;
                        end
                    end
                S3: begin
                        if(Signals == 3'b010) begin // Space
                                    state <= S0; // Go back to the start
                                    Space_EndSeqbar <= 1; // Space was pressed
                                    SentFlag <= 1; // So Separator can know which sequence to consider
                                end
                        else if(Signals == 3'b011) begin // EndSeq
                                    state <= S0; // Go back to the start
                                    Space_EndSeqbar <= 0; // EndSeq was pressed
                                    SentFlag <= 1; // So Separator can know which sequence to consider
                                end
                    end
            endcase
        end
    end
endmodule

//module sequence_producer(
//    input clk,
//    input Dot, Dash, Space, EndSeq,
//    input Clear, Reset, 
//    output reg [9:0] EncSeq = 10'b1111111111,
//    output reg Space_EndSeqbar = 0, SentFlag = 0
//    );
    
//    reg [2:0] state = 3'b000; // State variable to represent the current state
//    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
//    reg [9:0] buffer = 10'b1111111111;
    
//    always @ (state) begin
//        case(state)
//                S1: EncSeq <= 10'b0011111111;
//                S2: EncSeq <= 10'b0000111111;
//                S3: EncSeq <= 10'b0000001111; // Sequence for S
//                S4: EncSeq <= 10'b0111111111;
//                S5: EncSeq <= 10'b0101111111;
//                S6: EncSeq <= 10'b0101011111; // Sequence for O
                
//            endcase
    
//    end

//    // Producer of Letter S or O
//    always @ (posedge clk) begin
//        if (Clear || Reset) begin
//                state <= S0; // Reset the state
//        end
//        else begin
//            case(state)
//                S0: begin
//                        if (Dot) state <= S1;
//                        else if (Dash) state <= S4;
//                    end
//                S1: begin
//                        if (Dot) state <= S2;
//                    end
//                S2: begin
//                        if (Dot) state <= S3;
//                    end
//                S3: begin
//                        if(Space) begin // Space
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 1; // Space was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                        else if(EndSeq) begin // EndSeq
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 0; // EndSeq was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                    end
//                S4: begin
//                        if (Dash) state <= S5;
//                    end
//                S5: begin
//                        if (Dash) state <= S6;
//                    end
//                S6: begin
//                        if(Space) begin // Space
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 1; // Space was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                        else if(EndSeq) begin // EndSeq
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 0; // EndSeq was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                    end
//            endcase
//        end
//    end
//endmodule

//module sequence_producer(
//    input clk,
//    input Dot, Dash, Space, EndSeq,
//    input Clear, Reset, 
//    output reg [9:0] EncSeq = 0,
//    output reg Space_EndSeqbar = 0, SentFlag = 0
//    );
    
//    reg [2:0] state = 3'b000; // State variable to represent the current state
//    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
//    reg [9:0] buffer = 10'b1111111111;

//    // Producer of Letter F
//    always @ (posedge clk) begin
//        if (Clear || Reset) begin
//                EncSeq <= 10'b1111111111; // Clear the sequence
//                state <= S0; // Reset the state
//        end
//        else begin
//            case(state)
//                S0: begin
//                        if (Dot) begin // Dot
//                            state <= S1;
//                            EncSeq <= 10'b0011111111;
//                        end
//                    end
//                S1: begin
//                        if (Dot) begin // Dot
//                            state <= S2;
//                            EncSeq <= 10'b0000111111;
//                        end
//                    end
//                S2: begin
//                        if (Dash) begin // Dash
//                            state <= S3;
//                            EncSeq <= 10'b0000011111;
//                        end
//                    end
//                S3: begin
//                        if (Dot) begin // Dot
//                            state <= S4;
//                            EncSeq <= 10'b0000010011;
//                        end
//                    end
//                S4: begin
//                        if(Space) begin // Space
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 1; // Space was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                        else if(EndSeq) begin // EndSeq
//                                    state <= S0; // Go back to the start
//                                    Space_EndSeqbar <= 0; // EndSeq was pressed
//                                    SentFlag <= ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                    end
//            endcase
//        end
//    end
//endmodule

//module sequence_producer(
//    input clk,
//    input [2:0] Signals,
//    input Clear, Reset, 
//    output reg [9:0] EncSeq,
//    output reg Space_EndSeqbar, SentFlag
//    );
    
//    reg [2:0] state, nextstate; // State variables to represent the current state and next state
//    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;

//    initial begin
//        SentFlag = 1;
//        EncSeq = 10'b1111111111;
//        state = S0; // Initial state
//        nextstate = S0;
//    end
//    // Producer of Letter F, I
//    always @ (posedge clk) begin
//        if (Clear || Reset) begin
//                EncSeq = 10'b1111111111; // Clear the buffer
//                state = S0; // Reset the state
//        end else state = nextstate;
//        case(state)
//            S0: begin
//                    case(Signals)
//                        3'b000: begin // Dot
//                                    nextstate = S1;
//                                    EncSeq = 10'b0011111111;
//                                end
//                    endcase
//                end
//            S1: begin
//                    case(Signals)
//                        3'b000: begin // Dot
//                                    nextstate = S2;
//                                    EncSeq = 10'b0000111111;
//                                end
//                    endcase
//                end
//            S2: begin
//                    case(Signals)
//                        3'b001: begin // Dash
//                                    nextstate = S3;
//                                    EncSeq = 10'b0000011111;
//                                end
//                    endcase
//                end
//            S3: begin
//                    case(Signals)
//                        3'b000: begin // Dot
//                                    nextstate = S4;
//                                    EncSeq = 10'b0000010011;
//                                end
//                    endcase
//                end
//            S4: begin
//                    case(Signals)
//                        3'b010: begin // Space
//                                    nextstate = S0; // Go back to the start
//                                    Space_EndSeqbar = 1; // Space was pressed
//                                    SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                        3'b011: begin // EndSeq
//                                    nextstate = S0; // Go back to the start
//                                    Space_EndSeqbar = 0; // EndSeq was pressed
//                                    SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                                end
//                    endcase
//                end
//        endcase
//    end
//endmodule

//module sequence_producer(
//    input clk,
//    input [2:0] Signals,
//    input Clear, Reset, 
//    output reg [9:0] EncSeq,
//    output reg Space_EndSeqbar, SentFlag
//    );
    
//    reg seq_ready;
//    reg bufferSent;

//    initial begin
//        SentFlag = 1;
//        seq_ready = 0;
//        EncSeq = 10'b1111111111;
//    end
    
//    always @ (posedge clk) begin
//        if (Clear || Reset) begin
//                EncSeq = 10'b1111111111; // Clear the buffer
//                seq_ready = 0;
//                bufferSent = 0;
//        end
//        case (Signals)
//            3'b000: begin // Dot
//                        seq_ready = 0;
//                        case(EncSeq)
//                            10'b1111111111: EncSeq = 10'b0011111111; // Sequence for E
//                            10'b0011111111: EncSeq = 10'b0000111111; // Sequence for I
//                            10'b0000111111: EncSeq = 10'b0000001111; // Sequence for S
//                            10'b0000001111: EncSeq = 10'b0000000011; // Sequence for H
////                            10'b0000000011: EncSeq = 10'b0000000000; // Sequence for 5
//                        endcase
//                    end
//            3'b001: begin // Dash
//                        seq_ready = 0;
//                        case(EncSeq)
//                            10'b1111111111: EncSeq = 10'b0111111111; // Sequence for T
//                            10'b0111111111: EncSeq = 10'b0101111111; // Sequence for M
//                            10'b0101111111: EncSeq = 10'b0101011111; // Sequence for O
////                            10'b0101011111: EncSeq = 10'b0101010111;
////                            10'b0101010111: EncSeq = 10'b0101010101; // Sequence for number 0
//                            10'b0011111111: EncSeq = 10'b0001111111; // Sequence for A
                            
//                        endcase
//                    end
//            3'b010: begin // Space
//                        Space_EndSeqbar = 1; // Space was pressed
//                        seq_ready = 1;      // Used to indicate sequence should be saved
//                        SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                        bufferSent = 1;
//                    end
//            3'b011: begin // EndSeq
//                        Space_EndSeqbar = 0; // EndSeq was pressed
//                        seq_ready = 1;      // Used to indicate sequence should be saved
//                        SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//                        bufferSent = 1;
//                    end
//        endcase
//    end
//endmodule

//module sequence_producer(
//    input clk,
//    input [2:0] Signals,
//    input Clear, Reset, 
//    output reg [9:0] EncSeq,
//    output reg Space_EndSeqbar, SentFlag
//    );
//    reg [9:0] buffer;
//    reg [3:0] buffer_index; // Counter to keep track of where to store the Signals bits
//    reg bufferSent;
    
//    parameter BUFFER_SIZE = 10;
    
//    initial begin
//        SentFlag = 1;
//        buffer = 10'b1111111111;
//        buffer_index = 10;
//        bufferSent = 0;
//    end
    
//    always @ (posedge clk) begin
//        if (Clear || Reset || bufferSent) begin
//                buffer <= 10'b1111111111; // Clear the buffer
//                buffer_index <= 10; // Set buffer_index to the MSB
//                bufferSent <= 0; // Reset flag
//        end
//        if (Signals == 3'b000 || Signals == 3'b001) begin // Dot or Dash
//            if (buffer_index > 0) begin
//                //buffer <= {buffer[BUFFER_SIZE-3:0], Signals[1:0]}; // Add at the end
//                buffer[buffer_index-1] <= Signals[1];
//                buffer[buffer_index-2] <= Signals[0];
//                buffer_index <= buffer_index - 2;
//            end
//        end
//        else if(Signals == 3'b010) begin // Space
//            EncSeq <= buffer;
//            Space_EndSeqbar <= 1; // Space was pressed
//            bufferSent <= 1;      // Used for cleaning buffer
//            SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//        end
//        else if(Signals == 3'b011) begin // EndSeq
//            EncSeq <= buffer;
//            Space_EndSeqbar <= 0; // EndSeq was pressed
//            bufferSent <= 1;      // Used for cleaning buffer
//            SentFlag = ~SentFlag; // Toggle so Seq Separator can detect when sequence is repeated
//        end
        
////        case(Signals) begin
////            3'b000:
////                case buffer begin
////                    10'b1111111111: EncSeq <= 10'b0011111111;
////                end
////        endcase
//    end
//endmodule