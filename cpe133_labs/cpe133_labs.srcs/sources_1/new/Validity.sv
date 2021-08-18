`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2021 02:21:58 PM
// Design Name: 
// Module Name: Validity
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


module Validity(
    input A,
    input B,
    input S,
    output logic Valid
    );
    
    always_comb
    
    begin
        if (A != B)
            begin
                Valid = 1;
            end
        else
            begin
            if (A!=S)
                begin
                    Valid = 0;
                end
            else
                begin
                    Valid = 1;
                end           
            end 
    end
    
    
endmodule
