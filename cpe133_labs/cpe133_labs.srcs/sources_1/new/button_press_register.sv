`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// 
// Create Date: 08/18/2021 12:08:31 PM
// Design Name: Button toggle for reset and mode buttons 
// Module Name: button_press_register
// Description: This is based on a t flip-flop.
//              In this case the T input is the button press which switches the current value of Q. 
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
        if (R) // active high asynchronus reset t flip-flop
            begin
                Q = '0;
            end
        else if (S) // active high set t flip-flop
            begin
                Q = '1;
            end
        else if (T) // negate Q if T is 1
            begin
                Q = ~Q;
            end
    end
    
endmodule
