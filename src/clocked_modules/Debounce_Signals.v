module Debounce_Signals#(parameter threshold = 10000000)//1000000
(
    input clk, //input clock
    input btn, //inpput buttons for transmit and reset
    output reg transmit //transmit signal
    );
    
    reg button_ff1=0; //button FF for synchronization, initailly set to 0
    reg button_ff2=0; //button FF for synchronization, initailly set to 0
    reg [30:0] count=0; //20 bits count for increment and decrement when button is pressed or released
    
    //First use two FF to synchronize the button signal, "clk", clk domain
    
    always @(posedge clk)
    begin
    button_ff1<=btn;
    button_ff2<=button_ff1;
    end
    
    //when push button is pressed or released, we increment or decreemnt the counter
    
    always @(posedge clk)
    begin
    if (button_ff2) // if button_ff2 is high
    begin
    if (~&count) //if it isn't at the count limit, make sure you won't count up at the limit. Fist AND all count and then not the AND.
    count<=count+1; //when button is pressed, count up
    end
    else begin
    if (|count) //if count has at least 1 in it, making sure no substract when count is 0
    count<=count-1; //when btn is releasedcount down
    end
    if (count>threshold) //if the count is larger than the threshold
    transmit<=1; //debounce signal is 1
    else
    transmit<=0; //debounce is 0
    end
endmodule
//module Debounce_Signals#(parameter threshold = 10000000)//1000000
//(
//    input clk, //input clock
//    input btn, //inpput buttons for transmit and reset
//    output reg transmit //transmit signal
//    );
    
//    reg button_ff1=0; //button FF for synchronization, initailly set to 0
//    reg button_ff2=0; //button FF for synchronization, initailly set to 0
//    reg [30:0] count=0; //20 bits count for increment and decrement when button is pressed or released
    
//    //First use two FF to synchronize the button signal, "clk", clk domain
    
////    always @(posedge clk)
////    begin
////    button_ff1<=btn;
////    button_ff2<=button_ff1;
////    end
    
    
//    always @(posedge btn) begin// if button_ff2 is high
//    if(count>threshold && btn==1)begin
//    transmit=1;
//    count=0;
//    end
//    if (count<threshold)//if the count is larger than the threshold
//    count=count+1;
//    end
    
//endmodule