`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 04:23:59 PM
// Design Name: 
// Module Name: score_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module score_counter(
    input clk,
    input reset,
    input EN,
    output logic [6:0] count = 0,
    output logic at_max = 0
    );
    
    logic t1 = 0;
    
    n_bit_counter#(6) counter ( .clk(clk), .reset(t1 | reset), .EN(EN), .UP(1), .count(count) );
    
    always_comb
    begin
        if (count == 99)
            begin
                at_max = 1;
                t1 = 0;
            end
        else if (count == 100)
            begin
                at_max = 0;
                t1 = 1;
            end
        else
            begin
                at_max = 0;
                t1 = 0;
            end
    
    end
    
endmodule
