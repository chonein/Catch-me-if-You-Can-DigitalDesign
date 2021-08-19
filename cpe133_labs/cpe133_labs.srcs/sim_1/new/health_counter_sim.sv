`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 06:28:10 PM
// Design Name: 
// Module Name: health_counter_sim
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


module health_counter_sim(

    );
    
    logic clk, EN, R, UP;
    logic [6:0] count;
    
    
    health_counter health_counter_inst ( .clk(clk), .reset(R), .EN(EN), .count(count), .UP(UP) );
    
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
        UP = 1;
        #30
        
        R = 0;
        EN = 1;
        UP = 0;
        #30
        
        R = 1;
        EN = 0;
        UP = 0;
        #30
        
        R = 0;
        EN = 0;
        UP = 0;
        #30        
        
        
        
        $display("Finished");
     end
endmodule
