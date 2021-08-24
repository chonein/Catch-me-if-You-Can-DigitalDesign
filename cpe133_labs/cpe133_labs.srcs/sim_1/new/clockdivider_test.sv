`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/18/2021 02:14:59 PM
// Module Name: clockdivider_test
// Description: Simulation file
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
