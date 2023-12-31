module sequence_storage(
    input reset, enter, sentFlag,  // Inputs Reset, Enter, and SentFlag
    input [9:0] first_seq, sec_seq,  // Input sequences from sequence separator module
    output reg [159:0] store_seqs  // Output of storage content
    );
    
    integer i = 0, j = 0;
    integer shift_counter;
    reg[159:0] storage;
      
    always @ (sentFlag, enter, reset) begin // Save sequences when flag is signaled
        if (reset) begin
            storage <= {160{1'b1}}; //Assignes 1 to all bits of the storage
            shift_counter <= 1'b0;
        end
        if (shift_counter < 16) begin
            if({first_seq[9],first_seq[8]} != 2'b11) begin // Check if the first sequence is valid
                storage <= (storage << 10) + first_seq; // Saves first sequence in index i of the storage
                shift_counter <= shift_counter+1;
            end
            if ({sec_seq[9],sec_seq[8]} != 2'b11) begin // Check if the second sequence is valid
                storage <= (storage << 10) + sec_seq;  // Saves second sequence in index i of the storage
                shift_counter <= shift_counter+1;
            end
        end
        if (enter) begin
            store_seqs <= storage; // Output storage content
        end
     end
endmodule