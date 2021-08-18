`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 08:32:00 PM
// Design Name: 
// Module Name: switches_encoder
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


module switches_encoder(
    input [15:0] SWITCHES,
    output logic [4:0] ENCODED_SWITCHES
    );
    
    always_comb
        
    begin
    
    case(SWITCHES)
        16'b0000000000000001: ENCODED_SWITCHES = 4'h0;
        16'b0000000000000010: ENCODED_SWITCHES = 4'h1;
        16'b0000000000000100: ENCODED_SWITCHES = 4'h2;
        16'b0000000000001000: ENCODED_SWITCHES = 4'h3;
        16'b0000000000010000: ENCODED_SWITCHES = 4'h4;
        16'b0000000000100000: ENCODED_SWITCHES = 4'h5;
        16'b0000000001000000: ENCODED_SWITCHES = 4'h6;
        16'b0000000010000000: ENCODED_SWITCHES = 4'h7;
        16'b0000000100000000: ENCODED_SWITCHES = 4'h8;
        16'b0000001000000000: ENCODED_SWITCHES = 4'h9;
        16'b0000010000000000: ENCODED_SWITCHES = 4'ha;
        16'b0000100000000000: ENCODED_SWITCHES = 4'hb;
        16'b0001000000000000: ENCODED_SWITCHES = 4'hc;
        16'b0010000000000000: ENCODED_SWITCHES = 4'hd;
        16'b0100000000000000: ENCODED_SWITCHES = 4'he;
        16'b1000000000000000: ENCODED_SWITCHES = 4'hf;
        
        default:
            begin
                ENCODED_SWITCHES = 5'h10;           
            end
    
    endcase
    
    end    
    
endmodule
