`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 07/12/2021 06:42:43 PM
// Design Name: 
// Module Name: MUX
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////


module MUX_2_1#(parameter WIDTH=3)(
    input [WIDTH:0] zero,
    input [WIDTH:0] one,
    input SEL,
    output logic [WIDTH:0] out
    );
    
    always_comb
    
    begin
        if (SEL == 0)
            begin
                out = zero;
            end
        else
            begin
                out = one;
            end
    end     
endmodule
