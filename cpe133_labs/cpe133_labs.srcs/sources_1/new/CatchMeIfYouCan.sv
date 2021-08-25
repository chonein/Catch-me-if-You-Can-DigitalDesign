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


module CatchMeIfYouCan (    // declare inputs and outputs of the top module
    input [15:0] SWITCHES,
    input PAUSE_BTN,
    input MODE_BTN,
    input clk,
    output [3:0] DISP_EN,
    output [7:0] SEGMENTS,
    output [15:0] LEDS
    );
    
    // declare intermediate logic signals (we needed A LOT of them)
    logic t1, t6, t7, t8, t9, t10, t11, t13; //clock1, healthEN, scoreEN, at_max, counter_zero, PAUSE, MODE, clock2
    logic [4:0] t2, t3, t12; //led number, switch number, previous state
    logic [6:0] t4, t5; //health, score
    logic [29:0] t14; //clock max_count
    logic [3:0] t15; //disp_en
    
    // instantiate lower-level modules and patch signals to their proper connections
    univ_sseg s_seg( .clk(clk), .cnt1({t4}), .cnt2(t5), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b01), .sign(1'b0), .valid('b1), .ssegs(SEGMENTS), .disp_en(t15) ); // Dr. Mealy's 7-seg decoder (with features)
    CatchMeFSM catchme (.clk(t1), .reset(t9), .mode(t11), .pause(t10), .switch(t3), .scoreEN(t7), .healthEN(t6), .led(t2), .prevState(t12)); // main FSM for the game
    clock_divider clkDiv (.clk(clk), .MAX_COUNT(t14), .sclk(t1)); // primary clock divider, receives MAX_COUNT value from the accumulator to gradually make the game run faster (gets reset when health == 0)
    LEDS_DECODER leds (.LED_NUM(t2), .LEDS_DECODED(LEDS)); // led decoder (4-bits to 16-bits), with an extra 5th-bit as an active-low enable
    switches_encoder switches (.SWITCHES(SWITCHES), .ENCODED_SWITCHES(t3)); // switch encoder (16-bits to 4-bits), with an extra 5th-bit to signal invalid input
    health_counter health (.clk(t1), .UP(t8), .reset(t9), .EN(t6 & ~t10), .count(t4), .counter_zero(t9)); // counter for the health value
    score_counter score (.clk(t1), .reset(t9), .EN(t7 & ~t10), .count(t5), .at_max(t8)); // counter for the score value
    clock_divider clkDiv2 (.clk(clk), .MAX_COUNT(7000000), .sclk(t13)); // secondary clock divider to run the button toggles at a different frequency to help them work better
    button_press_register pause (.T(PAUSE_BTN), .S(1'b0), .R(1'b0), .clk(t13), .Q(t10)); // t-flipflop for pause button (set and reset are unused)
    button_press_register mode (.T(MODE_BTN), .S(1'b0), .R(1'b0), .clk(t13), .Q(t11));  // t-flipflop for mode button (set and reset are unused)
    stateRegister stateReg (.clk(t1), .D(t2), .savedState(t12), .reset(1'b0)); // full 5-bit memory register to store the last LED state the FSM was in, to allow the FSM to return to this state once unpaused
    Mux2to1 # (3) mux1 ( .ZERO(t15), .ONE(4'b1111), .SEL(t1 & t10), .OUT(DISP_EN) ); // simple mux to turn on and off the display when paused
    Accumulator # (29) clkSpeedAccum (.clk(t1), .reset(t9), .en(~t10), .sub(1'b1), .startValue(75000000), .inputValue(750000), .limitValue(25000000), .sum(t14)); // accumulator to gradually decrease the primary clock divider's MAX_COUNT to make the game gradually run faster

endmodule
