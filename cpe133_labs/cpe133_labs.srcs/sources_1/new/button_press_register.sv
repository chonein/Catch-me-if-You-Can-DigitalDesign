`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 12:08:31 PM
// Design Name: 
// Module Name: button_press_register
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


module button_press_register(
    input T,
    input S,
    input R,
    input clk,
    output logic Q = 0
    );
    
    always_ff @ (posedge clk, posedge R)
    begin
        if (R)
            begin
                Q = '0;
            end
        else if (S)
            begin
                Q = '1;
            end
        else if (T)
            begin
                Q = ~Q;
            end
    end
    
endmodule
