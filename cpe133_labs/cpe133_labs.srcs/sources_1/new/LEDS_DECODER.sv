`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/17/2021 09:34:28 PM
// Design Name: LED 5:16 DECODER
// Module Name: LEDS_DECODER
// Project Name: CatchMeIfYouCan
// Description: This modulues is based on 4:16 standard decoder.
//              However, there is one additional bit in the input.
//              When this MSB is 1, this means that the LEDS should be off.
//              Other wise the LED is on.
//////////////////////////////////////////////////////////////////////////////////


module LEDS_DECODER(
    input [4:0] LED_NUM,
    output logic [15:0] LEDS_DECODED
    );
    
    always_comb
    
    begin
        // Evaluating all cases when 00000 <= LED_NUM <= 01111
        case(LED_NUM)
            5'h00: LEDS_DECODED = 16'b0000000000000001;
            5'h01: LEDS_DECODED = 16'b0000000000000010;
            5'h02: LEDS_DECODED = 16'b0000000000000100;
            5'h03: LEDS_DECODED = 16'b0000000000001000;
            5'h04: LEDS_DECODED = 16'b0000000000010000;
            5'h05: LEDS_DECODED = 16'b0000000000100000;
            5'h06: LEDS_DECODED = 16'b0000000001000000;
            5'h07: LEDS_DECODED = 16'b0000000010000000;
            5'h08: LEDS_DECODED = 16'b0000000100000000;
            5'h09: LEDS_DECODED = 16'b0000001000000000;
            5'h0a: LEDS_DECODED = 16'b0000010000000000;
            5'h0b: LEDS_DECODED = 16'b0000100000000000;
            5'h0c: LEDS_DECODED = 16'b0001000000000000;
            5'h0d: LEDS_DECODED = 16'b0010000000000000;
            5'h0e: LEDS_DECODED = 16'b0100000000000000;
            5'h0f: LEDS_DECODED = 16'b1000000000000000;
            
            // dafault case when LED_NUM[4] != 0
            default: LEDS_DECODED = 'b0; //all leds off
        endcase
    end
    
endmodule
