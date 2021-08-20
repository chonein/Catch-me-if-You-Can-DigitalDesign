`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 02:05:18 PM
// Design Name: Clock divider with variable MAX_COUNT
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A regular clock divider, but with ability to change the MAX_COUNT.
//              Gives the ability to actively modify the clock period.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clk,
    input [29:0] MAX_COUNT, // modifiable MAX_COUNT
    output logic sclk = 0
    );
    
    logic [29:0] count = 0;
    
    always_ff @ (posedge clk)
    begin
        count = count + 1;
        if (count == MAX_COUNT)
            begin
                count = 0;
                sclk = ~sclk;
            end
    
    end
    
    
endmodule
