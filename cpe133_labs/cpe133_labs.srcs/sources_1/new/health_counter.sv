`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/18/2021 05:00:10 PM
// Design Name: Health counter default at 3
// Module Name: health_counter 
// Description: Health counter that defaults to 3. 0<=health<=9
//              if the health count becomes 0, counter_zero = 1 which signals a reset for all the game.
//////////////////////////////////////////////////////////////////////////////////


module health_counter#(parameter START_HEALTH=3)(
    input clk,
    input UP,
    input reset,
    input EN,
    output logic [6:0] count,
    output logic counter_zero
    );
    
    logic EN2 = 1, EN3 = 0;
    // EN2: enables/disables counter internally to prevent overflow/underflow 
    // EN3: enables the counter; overrides EN and EN2
    
    n_bit_counter#(6, START_HEALTH) counter ( .clk(clk), .reset(reset | counter_zero), .EN((EN & EN2) | EN3), .UP(UP), .LD(0), .D(3), .count(count) );
    
    always_comb
    begin
        if (count == 0) // signals a reset for all of the game.
            begin
                // counter disabled
                EN2 = 0;
                EN3 = 0;
                counter_zero = 1; // reset signal
            end
        else if (count == 9) // prevent counter from becoming greater than 9
            begin
                EN2 = 0;
                EN3 = 0;
                counter_zero = 0;
            end
        else if (UP == 1) // health increases by 1
            begin
                EN3 = 1; // enables the counter when UP input is 1 no matter value of EN input
                EN2 = 1;
                counter_zero = 0;
            end
        else
            begin // normal functioning of counter
                EN2 = 1; // internal enable is high
                EN3 = 0;
                counter_zero = 0;
            end
    end
endmodule
