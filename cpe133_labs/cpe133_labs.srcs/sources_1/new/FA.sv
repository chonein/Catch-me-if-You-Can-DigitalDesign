`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 07/04/2021 12:03:08 PM
// Design Name: 
// Module Name: FA
//////////////////////////////////////////////////////////////////////////////////


module FA(
    input A,
    input B,
    input C,
    output S,
    output Co
    );
    
    assign Co = (A & C) | (B & C) | (A & B);
    assign S = A ^ (B ^ C);
endmodule
