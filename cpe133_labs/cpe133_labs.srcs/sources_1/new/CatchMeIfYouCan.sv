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
    
    logic t1, t6, t7, t8, t9, t10, t11, t13; //clock1, healthEN, scoreEN, at_max, counter_zero, PAUSE, MODE, clock2
    logic [4:0] t2, t3, t12; //led number, switch number, previous state
    logic [6:0] t4, t5; //health, score
    logic [29:0] t14; //clock max_count
    logic [3:0] t15; //disp_en
    
    univ_sseg s_seg( .clk(clk), .cnt1({t4}), .cnt2(t5), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b01), .sign(1'b0), .valid('b1), .ssegs(SEGMENTS), .disp_en(t15) );
    CatchMeFSM catchme (.clk(t1), .reset(t9), .mode(t11), .pause(t10), .switch(t3), .scoreEN(t7), .healthEN(t6), .led(t2), .prevState(t12));
    clock_divider clkDiv (.clk(clk), .MAX_COUNT(t14), .sclk(t1));
    LEDS_DECODER leds (.LED_NUM(t2), .LEDS_DECODED(LEDS));
    switches_encoder switches (.SWITCHES(SWITCHES), .ENCODED_SWITCHES(t3));
    health_counter health (.clk(t1), .UP(t8), .reset(t9), .EN(t6 & ~t10), .count(t4), .counter_zero(t9));
    score_counter score (.clk(t1), .reset(t9), .EN(t7 & ~t10), .count(t5), .at_max(t8));
    clock_divider clkDiv2 (.clk(clk), .MAX_COUNT(7000000), .sclk(t13));
    button_press_register pause (.T(PAUSE_BTN), .S(1'b0), .R(1'b0), .clk(t13), .Q(t10));
    button_press_register mode (.T(MODE_BTN), .S(1'b0), .R(1'b0), .clk(t13), .Q(t11));
    stateRegister stateReg (.clk(t1), .D(t2), .savedState(t12), .reset(1'b0));
    Mux2to1 # (3) mux1 ( .ZERO(t15), .ONE(4'b1111), .SEL(t1 & t10), .OUT(DISP_EN) );
    Accumulator # (29) clkSpeedAccum (.clk(t1), .reset(t9), .en(~t10), .sub(1'b1), .startValue(75000000), .inputValue(750000), .limitValue(25000000), .sum(t14));

endmodule
