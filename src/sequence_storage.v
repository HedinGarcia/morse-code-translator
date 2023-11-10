module sequence_storage(
    input reset, enter, sentFlag,  // Inputs Reset, Enter, and SentFlag
    input [9:0] first_seq, sec_seq,  // Input sequences from sequence separator module
    output reg [159:0] o_sequence  // Output of storage content
    );
    
    integer i = 0, j = 0;
    integer shift_counter;
    reg[159:0] storage;
    
    always @ (reset) begin
        if (reset) begin
            storage = {160{1'b1}}; //Assignes 1 to all bits of the storage
            shift_counter=1'b0;
        end
    end
    
    always @ (enter) begin
        if (enter) begin
            o_sequence <= storage; // Output storage content
        end
    end
    
    always @ (sentFlag) begin // Save sequences when flag is signaled
        if (shift_counter < 16) begin
            if({first_seq[9],first_seq[8]} != 2'b11) begin // Check if the first sequence is valid
                storage = storage << 10;
                storage = storage + first_seq; // Saves first sequence in index i of the storage
                shift_counter = shift_counter+1;
            end
            if ({sec_seq[9],sec_seq[8]} != 2'b11) begin // Check if the second sequence is valid
                storage = storage << 10;
                storage = storage + sec_seq;  // Saves second sequence in index i of the storage
                shift_counter = shift_counter+1;
            end
        end
     end
endmodule