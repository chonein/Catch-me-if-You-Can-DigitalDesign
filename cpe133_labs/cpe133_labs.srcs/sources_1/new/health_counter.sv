`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 05:00:10 PM
// Design Name: 
// Module Name: health_counter
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


module health_counter#(parameter START_HEALTH=3)(
    input clk,
    input UP,
    input reset,
    input EN,
    output logic [6:0] count = START_HEALTH
    );
    
    logic EN2 = 1;
    
    n_bit_counter#(6) counter ( .clk(clk), .reset(reset), .EN(EN & EN2), .UP(UP), .count(count) );
    
    always_comb
    begin
        if (count == 9 || (UP == 0 && count == 0))
            begin
                EN2 = 0;
            end
        else
            begin
                EN2 = 1;
            end
    end
endmodule
