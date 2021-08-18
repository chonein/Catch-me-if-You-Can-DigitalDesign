`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2021 06:51:46 PM
// Design Name: 
// Module Name: Lab3
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


module Lab3(
    input [3:0] A,
    input [3:0] B,
    output [6:0] seg,
    output [3:0] an
    );
    
    logic t2;
    logic [3:0] t1;
    
    Lab2 RCA0 (  .A(A), .B(B), .S(t1), .Co(t2) );
    SevenSeg sevenSeg ( .BCD(t1), .seg(seg) );
    MUX_2_1#(3) MUX0 ( .zero(4'b1110), .one(4'b1111), .SEL(t2), .out(an) );
    
endmodule
