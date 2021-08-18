`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 01:41:50 PM
// Design Name: 
// Module Name: RC_Add_Sub_Univ_SSeg
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


module RC_Add_Sub_Univ_SSeg(
    input [3:0] A,
    input [3:0] B,
    input Sub,
    input CLR,
    input clk,
    input enter,
    output [7:0] seg,
    output [3:0] an
    );

    logic t6, t7, t9, t10;
    logic [3:0] t1, t3,t4, t5, t8;
    
    MUX_2_1#(3) MUX0 ( .zero(B), .one(~B), .SEL(Sub), .out(t1) );
    RCA_4_FA RCA1 ( .A(A), .B(t1), .Cin(Sub), .S(t3), .Co() );
    RCA_4_FA RCA2 ( .A(~t3), .B(4'b0000), .Cin(1'b1), .S(t4), .Co() );
    Validity Validity1 ( .A(A[3]), .B(t1[3]), .S(t3[3]), .Valid(t7) );
    assign t6 = t3[3] & t7;
    MUX_2_1#(3) MUX1 ( .zero(t3), .one(t4), .SEL(t6), .out(t5) );
    
    n_bit_register#(3) number( .clk(clk), .enter(enter), .CLR(CLR), .D(t5), .set(1'b0), .Q(t8) );
    n_bit_register sign( .clk(clk), .enter(enter), .CLR(CLR), .D(t6), .set(1'b0), .Q(t9) );
    n_bit_register valid( .clk(clk), .enter(enter), .CLR(1'b0), .D(t7), .set(CLR), .Q(t10) );
    
    univ_sseg s_seg( .clk(clk), .cnt1({10'b0, t8}), .cnt2(1'b0), .dp_en(1'b0), .dp_sel(2'b0), .mod_sel(2'b0), .sign(t9), .valid(t10), .ssegs(seg), .disp_en(an) );

endmodule
