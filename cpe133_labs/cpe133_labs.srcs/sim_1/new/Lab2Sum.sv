`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2021 05:53:47 PM
// Design Name: 
// Module Name: Lab2Sum
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


module Lab2Sum;
    logic [3:0] A, B, S;
    logic Co;
    
    Lab2 Lab2_inst (  .A(A), .B(B), .S(S), .Co(Co) );
    
    initial
        begin
            A = 0;
            B = 0;
            #10
            
            A = 0;
            B = 1;
            #10
            
            A = 1;
            B = 1;
            #10
            
            A = 1;
            B = 2;
            #10
            
            A = 2;
            B = 2;
            #10
            
            A = 2;
            B = 4;
            #10
            
            A = 4;
            B = 4;
            #10
            
            A = 4;
            B = 8;
            #10  
                 
            A = 8;
            B = 8;
            #10
            
            A = 15;
            B = 15;
            #10
                        
            $display("Finished");  
      end           
    
endmodule
