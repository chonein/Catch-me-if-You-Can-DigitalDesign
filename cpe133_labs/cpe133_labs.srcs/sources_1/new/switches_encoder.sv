`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 08:32:00 PM
// Design Name: User input switches to FSM expected
// Module Name: switches_encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This works the other way around of the standard 4:16 decoder.
//              However, the output is 5 bits to accomodate for invalid switches.
//              The MSB of the output is 1 when the switches can't be encoded, and 0 otherwise.
//              Switches can't be encoded if: no switches are raised or more than one switch is raised.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module switches_encoder(
    input [15:0] SWITCHES,
    output logic [4:0] ENCODED_SWITCHES
    );
    
    always_comb
        
    begin
    
    // Evalulating valid cases of Switches
    case(SWITCHES)
        16'b0000000000000001: ENCODED_SWITCHES = 5'h00;
        16'b0000000000000010: ENCODED_SWITCHES = 5'h01;
        16'b0000000000000100: ENCODED_SWITCHES = 5'h02;
        16'b0000000000001000: ENCODED_SWITCHES = 5'h03;
        16'b0000000000010000: ENCODED_SWITCHES = 5'h04;
        16'b0000000000100000: ENCODED_SWITCHES = 5'h05;
        16'b0000000001000000: ENCODED_SWITCHES = 5'h06;
        16'b0000000010000000: ENCODED_SWITCHES = 5'h07;
        16'b0000000100000000: ENCODED_SWITCHES = 5'h08;
        16'b0000001000000000: ENCODED_SWITCHES = 5'h09;
        16'b0000010000000000: ENCODED_SWITCHES = 5'h0a;
        16'b0000100000000000: ENCODED_SWITCHES = 5'h0b;
        16'b0001000000000000: ENCODED_SWITCHES = 5'h0c;
        16'b0010000000000000: ENCODED_SWITCHES = 5'h0d;
        16'b0100000000000000: ENCODED_SWITCHES = 5'h0e;
        16'b1000000000000000: ENCODED_SWITCHES = 5'h0f;
        
        // Invalid Switches: no switches are raised or more than one switch is raised.
        default:
            begin
                ENCODED_SWITCHES = 5'h10;           
            end
    
    endcase
    
    end    
    
endmodule
