`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 09:34:28 PM
// Design Name: 
// Module Name: LEDS_DECODER
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


module LEDS_DECODER(
    input [3:0] LED_NUM,
    output logic [15:0] LEDS_DECODED
    );
    
    always_comb
    
    begin
    
        case(LED_NUM)
            4'h0: LEDS_DECODED = 16'b0000000000000001;
            4'h1: LEDS_DECODED = 16'b0000000000000010;
            4'h2: LEDS_DECODED = 16'b0000000000000100;
            4'h3: LEDS_DECODED = 16'b0000000000001000;
            4'h4: LEDS_DECODED = 16'b0000000000010000;
            4'h5: LEDS_DECODED = 16'b0000000000100000;
            4'h6: LEDS_DECODED = 16'b0000000001000000;
            4'h7: LEDS_DECODED = 16'b0000000010000000;
            4'h8: LEDS_DECODED = 16'b0000000100000000;
            4'h9: LEDS_DECODED = 16'b0000001000000000;
            4'ha: LEDS_DECODED = 16'b0000010000000000;
            4'hb: LEDS_DECODED = 16'b0000100000000000;
            4'hc: LEDS_DECODED = 16'b0001000000000000;
            4'hd: LEDS_DECODED = 16'b0010000000000000;
            4'he: LEDS_DECODED = 16'b0100000000000000;
            4'hf: LEDS_DECODED = 16'b1000000000000000;
            
            default: LEDS_DECODED = 'b0; 
        endcase
    end
    
endmodule
