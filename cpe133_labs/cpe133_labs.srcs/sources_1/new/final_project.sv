`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 06:40:59 PM
// Design Name: 
// Module Name: final_project
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


module final_project(
    input [15:0] SWITCHES,
    input PAUSE_BTN,
    input MODE_BTN,
    input RESET_BTN,
    input clk,
    output [3:0] an,
    output [7:0] seg,
    output [15:0] LEDS
    );
    
    univ_sseg s_seg( .clk(clk), .cnt1({7'b0000011}), .cnt2(7'b1100010), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b01), .sign(1'b0), .valid('b1), .ssegs(seg), .disp_en(an) );

endmodule
