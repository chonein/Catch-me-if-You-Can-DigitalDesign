`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/18/2021 04:10:19 PM
// Design Name: Base n_bit_counter with START_VAL
// Module Name: n_bit_counter
// Description: Base module for the score and heath counter.
//              Counter output width and counter start value are parameters.
//              Counter has ability to take a load D (LD: load enable)
//              all inputs are active high
//////////////////////////////////////////////////////////////////////////////////


module n_bit_counter#(parameter WIDTH=0, START_VAL=0)(
    input clk,
    input UP, // if high counter adds one else subtracts one
    input reset,
    input EN, // counter enable
    input LD = 0, // load enable
    input [WIDTH:0] D, // load
    output logic [WIDTH:0] count=START_VAL
    );
    
    always_ff @ (posedge clk)
    begin
        if (reset)
            begin
                count = START_VAL; // counter resets to start value
            end
        else if (LD)
            begin
                count = D; // sets count to load D
            end
        else if (EN)
            begin
                if (UP)
                    begin
                        count = count + 1; // increments 1
                    end
                else
                    begin
                        count = count - 1; // decrements 1
                    end
            end
        else
            begin
                count = count; // counter is disabled
            end
    end
endmodule
