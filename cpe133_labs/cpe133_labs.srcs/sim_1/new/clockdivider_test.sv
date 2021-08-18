`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 02:14:59 PM
// Design Name: 
// Module Name: clockdivider_test
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


module clockdivider_test();

    logic sclk, clk;
    logic [29:0] M;
    
    clock_divider clock_divider_inst ( .clk(clk), .MAX_COUNT(M), .sclk(sclk) );
    
    always
    begin
        clk=1;
        #5;
        clk=0;
        #5;
    end
    
    initial
    begin
        M = 3;
        #30
        
        M = 2;
        #30
        
        M = 1;
        #30
        
        $display("Finished");
    end
    
endmodule
