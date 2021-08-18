`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2021 06:07:04 PM
// Design Name: 
// Module Name: Lab7
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


module Lab7(
    input CLK,
    input [7:0] SWITCHES,
    input BT0,
    output [7:0] seg,
    output [3:0] an,
    output [7:0] LEDS
    );
    logic S_CLK, t1, t2;
    
    clk_div2 CLK_DIV_2 ( .clk(CLK), .sclk(S_CLK) );
    seq_dvr SEQ_DVR ( .CLK(S_CLK), .SWITCHES(SWITCHES), .LEDS(LEDS), .X(t1) );
    FSM_011101_011001 fsm ( .clk(S_CLK), .X(t1), .BT0(BT0), .reset(0), .Z(t2) );
    BC_DEC bc_dec ( .CLK(CLK), .Z(t2), .SEGMENTS(seg), .DISP_EN(an) );    
    
endmodule
