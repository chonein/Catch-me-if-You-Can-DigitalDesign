`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/18/2021 04:23:59 PM
// Design Name: Score counter 0<=score<=99
// Module Name: score_counter
// Description: Counts the score from 0 to 99 inclusive
//              Starting value is at 0. When 99 is reached at_max is 1.
//              When max is reached, counter automatically resets itself.
//////////////////////////////////////////////////////////////////////////////////


module score_counter(
    input clk,
    input reset,
    input EN,
    output logic [6:0] count,
    output logic at_max = 0
    );
    
    logic t1 = 0; // internal reset of counter
    // Instantiating generic counter
    n_bit_counter#(6, 0) counter ( .clk(clk), .reset(t1 | reset), .EN(EN), .UP(1), .LD(0), .D('0), .count(count) );
    
    always_comb
    begin
        if (count == 99) // reset counter when 99 is reached/signal the reset with at_max
            begin
                t1 = 1; // internally resets counter on next clock cycle
                at_max = 1; // signals counter reached max value
            end
        else // regular functioning of the counter
            begin
                at_max = 0;
                t1 = 0;
            end
    end
endmodule
