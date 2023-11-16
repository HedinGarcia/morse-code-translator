`timescale 1ns / 1ps

// Verilog module for the PWM Generator in Morse Code Translator Projects

module pwm_generator(input clk, Dot, Dash, output speaker1, speaker2);
  sound Sounds(clk, Dot, Dash, speaker1, speaker2);
endmodule

module sound(input clk, button1, button2, output speaker1, speaker2);
  assign clkdivider = 100000000/440/2; // Note A
  assign clkdivider2 = 100000000/196/2; // Note G

  reg [14:0] counter1, counter2;
  always @(posedge clk) begin
    if(counter1 == 0) counter1 <= clkdivider-1; 
    else counter1 <= counter1-1;
    
    if(counter2 == 0) counter2 <= clkdivider2-1;
    else counter2 <= counter2-1;
  end

  reg speaker1, speaker2;
  always @(posedge clk) begin
     if (counter1 == 0 && button1) speaker1 <= ~speaker1; // Play buzzer1 when button1 is pressed
     if (counter2 == 0 && button2) speaker2 <= ~speaker2; // Play buzzer2 when button2 is pressed
  end
endmodule
