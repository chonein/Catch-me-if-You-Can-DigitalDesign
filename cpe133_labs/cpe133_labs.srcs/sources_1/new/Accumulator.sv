`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Alex Elliott
// 
// Create Date: 08/24/2021 12:18:41 AM
// Design Name: Accumulator
// Module Name: Accumulator
// Project Name: Accumulator
// Target Devices: Basys 3 Board
// Description: A standard accumulator with some nice features, including an input to choose addition or subtraction and a limit value that the accumulator does not accumulate beyond.
// 
//////////////////////////////////////////////////////////////////////////////////


module Accumulator # (parameter MAX_WIDTH = 7)(
    input clk, reset, en, sub, // various control inputs (including an enable input and a subtract input)
    input [MAX_WIDTH:0] startValue, inputValue, limitValue, // the starting value, input value, and limit value of the accumulator, all of which may be spontaneously changed at will
    output logic [MAX_WIDTH:0] sum = startValue // the sum output, initialized to the starting value
    );
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset) // asynchronous active high reset, to make the sum revert back to the starting value
        begin
            sum <= startValue;
        end
        else if (en) // if the reset input is not activated, the module functions whenever the active-high enable is activated
        begin
            if (sub) // if sub is high, the module should subtract the input value from the sum (only if the sum isn't already less than the limit)
            begin
                if (sum > limitValue)
                begin
                    sum <= (sum - inputValue);
                end
            end
            else // when sub is low, the module adds the input value to the sum (only if the sum isn't already greater than the limit)
            begin
                if (sum < limitValue)
                begin
                    sum <= (sum + inputValue);
                end
            end
        end
    end
    
endmodule
