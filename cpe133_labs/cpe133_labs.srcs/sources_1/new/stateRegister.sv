`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// 
// Create Date: 08/20/2021 10:34:10 AM
// Design Name: State Memory Register
// Module Name: stateRegister
// Project Name: CatchMeIfYouCan
// Target Devices: 
// Tool Versions: 
// Description: Keeps track of the state of the state machine.
//              It only keeps track of states with MSB different than 0.
//              This is done to only keep track of state in which LED is on.
//              (In FSM, all states with LED on have MSB = 0)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stateRegister(
    input clk,
    input reset = 0,
    input [4:0] D,
    output logic [4:0] savedState
    );
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset) // active low reset, sets saved state to FSM start state.
            savedState = 5'b00000;
        else if (D[4] == 0) // MSB of the input D acts like an active high enable.
            savedState = D;
    end
    
endmodule
