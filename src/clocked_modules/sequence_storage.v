
module sequence_storage(
    input clk,
    input reset, enter, sentFlag,  // Inputs Reset, Enter, and SentFlag
    input [9:0] first_seq, sec_seq,  // Input sequences from sequence separator module
    output reg [29:0] store_seqs = {30{1'b1}},  // Output of storage content
    output reg storageSent = 0
    );
    
    always @ (posedge clk) begin // Save sequences when flag is signaled
        if (reset == 1'b1) begin
            store_seqs <= {30{1'b1}}; //Assignes 1 to all bits of the storage
            storageSent <= 1'b0;
        end
        if (sentFlag == 1'b1 && first_seq == 10'b0000001111) begin // S sequence
            store_seqs[29:20] <= 10'b0000001111;
            store_seqs[19:10] <= 10'b0101011111;
            store_seqs[9:0] <= 10'b0000001111;
            storageSent <= 1'b0;
        end
        else if (sentFlag == 1'b1 && first_seq == 10'b0101011111) begin // O sequence
            store_seqs[29:20] <= 10'b0101011111;
            store_seqs[19:10] <= 10'b0000001111;
            store_seqs[9:0] <= 10'b0101011111;
            storageSent <= 1'b0;
        end
        if (enter == 1'b1) begin // O sequence
            storageSent <= 1'b1;
        end
     end
endmodule



//module sequence_storage(
//    input clk,
//    input reset, enter, sentFlag,  // Inputs Reset, Enter, and SentFlag
//    input [9:0] first_seq, sec_seq,  // Input sequences from sequence separator module
//    output reg [29:0] store_seqs = {30{1'b1}},  // Output of storage content
//    output reg storageSent = 0
//    );
    
//    reg [2:0] state = 3'b000; // State variable to represent the current state
//    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;
    
//    always @ (posedge clk) begin // Save sequences when flag is signaled
//        if (reset == 1'b1) begin
//            store_seqs <= {30{1'b1}}; //Assignes 1 to all bits of the storage
//            storageSent <= 1'b0;
//            state <= S0;
//        end
//        case (state)
//            S0: begin
//                    if (sentFlag == 1'b1 && first_seq == 10'b0000001111) begin // S sequence
//                        state <= S1;
//                        store_seqs[29:20] <= 10'b0000001111;
//                        store_seqs[19:10] <= 10'b1111111111;
//                        store_seqs[9:0] <= 10'b1111111111;
//                        storageSent <= 1'b0;
//                    end
//                    else if (sentFlag == 1'b1 && first_seq == 10'b0101011111) begin // O sequence
//                        state <= S1;
//                        store_seqs[29:20] <= 10'b0101011111;
//                        store_seqs[19:10] <= 10'b1111111111;
//                        store_seqs[9:0] <= 10'b1111111111;
//                        storageSent <= 1'b0;
//                    end
//                end
//            S1: begin
//                    if (sentFlag == 1'b1 && first_seq == 10'b0101011111) begin // O sequence
//                        state <= S2;
//                        store_seqs[29:20] <= 10'b0000001111;
//                        store_seqs[19:10] <= 10'b0101011111;
//                        store_seqs[9:0] <= 10'b1111111111;
//                        storageSent <= 1'b0;
//                    end
//                    else if (sentFlag == 1'b1 && first_seq == 10'b0000001111) begin // S sequence
//                        state <= S2;
//                        store_seqs[29:20] <= 10'b0101011111;
//                        store_seqs[19:10] <= 10'b0000001111;
//                        store_seqs[9:0] <= 10'b1111111111;
//                        storageSent <= 1'b0;
//                    end
//                end
//            S2: begin
//                    if (sentFlag == 1'b1 && first_seq == 10'b0000001111) begin // S sequence
//                        state <= S3;
//                        store_seqs[29:20] <= 10'b0000001111;
//                        store_seqs[19:10] <= 10'b0101011111;
//                        store_seqs[9:0] <= 10'b0000001111;
//                        storageSent <= 1'b0;
//                    end
//                    else if (sentFlag == 1'b1 && first_seq == 10'b0101011111) begin // O sequence
//                        state <= S3;
//                        store_seqs[29:20] <= 10'b0101011111;
//                        store_seqs[19:10] <= 10'b0000001111;
//                        store_seqs[9:0] <= 10'b0101011111;
//                        storageSent <= 1'b0;
//                    end
//                end
//            S3: begin
//                    if (enter == 1'b1) begin
//                        state <= S3; // Keep outputing the content of storage whenever enter is pressed
//                    end
//                end
//        endcase
//        if (enter == 1'b1) begin
//            storageSent <= 1'b1;
//        end
//     end
//endmodule