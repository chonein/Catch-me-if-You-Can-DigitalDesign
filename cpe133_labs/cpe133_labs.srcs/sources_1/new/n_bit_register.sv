`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module n_bit_register#(parameter WIDTH=0)(
    input clk,
    input enter,
    input CLR,
    input [WIDTH:0] D,
    input set,
    output logic [WIDTH:0] Q = 0
    );
    
    always_ff @ (posedge clk)
    begin
        if (CLR)
            Q = '0;
        else if (set)
            Q = '1;
        else if (enter)
            Q = D;            
    end
endmodule
