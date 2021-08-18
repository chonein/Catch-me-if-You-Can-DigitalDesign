`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Christian Honein
// 
// Create Date: 06/12/2021 08:38:23 PM
// Design Name: 
// Module Name: Lab0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module Lab0(
    input A,
    input B,
    input C,
    output Q
    );
    
    assign Q = ~(A | B) | (B & C);
endmodule
