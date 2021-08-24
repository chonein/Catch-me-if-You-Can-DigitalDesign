`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/20/2021 10:34:10 AM
// Design Name: 5 bit wide State Memory Register
// Module Name: stateRegister
// Project Name: CatchMeIfYouCan 
// Description: Keeps track of the state of the state machine.
//              It only keeps track of states with MSB different than 0.
//              This is done to only keep track of state in which LED is on.
//              (In FSM, all states with LED on have MSB = 0)
//              all inputs are active high
//////////////////////////////////////////////////////////////////////////////////


module stateRegister(
    input clk,
    input reset = 0,
    input [4:0] D,
    output logic [4:0] savedState
    );
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset) // active high reset, sets savedState to FSM start state.
        begin
            savedState = 5'b10000;
        end
        else if (D[4] == 0) // MSB of the input D acts like an active high enable.
        begin
            savedState = D;
        end
    end
    
endmodule