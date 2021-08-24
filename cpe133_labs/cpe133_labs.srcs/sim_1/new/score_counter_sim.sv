`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/18/2021 04:31:24 PM
// Module Name: score_counter_sim
// Description: Simulation file
//////////////////////////////////////////////////////////////////////////////////


module score_counter_sim();

    logic clk, EN, R, at_max;
    logic [6:0] count;
    
    
    score_counter score_counter_inst ( .clk(clk), .reset(R), .EN(EN), .count(count), .at_max(at_max) );
    
    always
    begin
        clk=1;
        #3;
        clk=0;
        #3;
    end
    
    initial
    begin
        R = 0;
        EN = 1;
        #30
        
        R = 0;
        EN = 0;
        #20
        
        R = 1;
        EN = 0;
        #10
        
        
        $display("Finished");
    end
    
endmodule
