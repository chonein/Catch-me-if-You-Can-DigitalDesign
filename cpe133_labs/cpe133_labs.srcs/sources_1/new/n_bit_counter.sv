`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 04:10:19 PM
// Design Name: 
// Module Name: n_bit_counter
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


module n_bit_counter#(parameter WIDTH=0)(
    input clk,
    input UP,
    input reset,
    input EN,
    output logic [WIDTH:0] count
    );
    
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset)
            begin
                count = '0;
            end
        else if (EN)
            begin
                if (UP)
                    begin
                        count = count + 1;
                    end
                else
                    begin
                        count = count - 1;
                    end
            end
        else
            begin
                count = count;
            end
    end
endmodule
