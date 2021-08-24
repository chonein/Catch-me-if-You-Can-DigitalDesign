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
// Description: A standard accumulator with some nice features.
// 
//////////////////////////////////////////////////////////////////////////////////


module Accumulator # (parameter MAX_WIDTH = 7)(
    input clk, reset, sub,
    input [MAX_WIDTH:0] startValue, inputValue,
    output logic [MAX_WIDTH:0] sum = startValue
    );
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset)
        begin
            sum <= startValue;
        end
        else
        begin
            if (sub)
            begin
                sum <= (sum - inputValue);
            end
            else
            begin
                sum <= (sum + inputValue);
            end
        end
    end
    
endmodule
