`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Alex Elliott
// 
// Create Date: 08/19/2021 02:03:08 PM
// Design Name: CatchMeIfYouCan
// Module Name: CatchMeIfYouCan
// Project Name: Catch Me If You Can
// Target Devices: Basys 3 Board
// Description: A game created for the Basys 3 Board, which involves flipping switches at the right times as signaled by the corresponding leds.
// 
//////////////////////////////////////////////////////////////////////////////////


module CatchMeIfYouCan (
    input [15:0] SWITCHES,
    input PAUSE_BTN,
    input MODE_BTN,
    input clk,
    output [3:0] DISP_EN,
    output [7:0] SEGMENTS,
    output [15:0] LEDS
    );
    
    logic t1, t6, t7, t8, t9, t10, t11; //clock, healthEN, scoreEN, at_max, counter_zero, PAUSE, MODE
    logic [4:0] t2, t3, t12; //led number, switch number, previous state
    logic [6:0] t4, t5; //health, score
    
    univ_sseg s_seg( .clk(clk), .cnt1({t4}), .cnt2(t5), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b01), .sign(1'b0), .valid('b1), .ssegs(SEGMENTS), .disp_en(DISP_EN) );
    CatchMeFSM catchme (.clk(t1), .reset(t9), .mode(t11), .pause(t10), .switch(t3), .scoreEN(t7), .healthEN(t6), .led(t2), .prevState(t12));
    clock_divider clkDiv (.clk(clk), .MAX_COUNT(50000000), .sclk(t1));
    LEDS_DECODER leds (.LED_NUM(t2), .LEDS_DECODED(LEDS));
    switches_encoder switches (.SWITCHES(SWITCHES), .ENCODED_SWITCHES(t3));
    health_counter health (.clk(t1), .UP(t8), .reset(t9), .EN(t6), .count(t4), .counter_zero(t9));
    score_counter score (.clk(t1), .reset(t9), .EN(t7), .count(t5), .at_max(t8));
    button_press_register pause (.T(PAUSE_BTN), .S(1'b0), .R(1'b0), .clk(clk), .Q(t10));
    button_press_register mode (.T(MODE_BTN), .S(1'b0), .R(1'b0), .clk(clk), .Q(t11));
    stateRegister stateReg (.clk(t1), .D(t2), .savedState(t12), .reset(1'b0));

endmodule
