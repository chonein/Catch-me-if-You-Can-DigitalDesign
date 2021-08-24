`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 08/18/2021 01:06:01 PM
// Module Name: button_press_register_sim
// Description: Simulation file
//////////////////////////////////////////////////////////////////////////////////


module button_press_register_sim();
    logic T, R, S, Q, clk;
    
    button_press_register button_press_sim ( .T(T), .R(R), .S(S), .clk(clk), .Q(Q) );
    
    always
    begin
        clk=1;
        #7;
        clk=0;
        #7;
    end
    
    initial
        begin
            T = 0;
            R = 0;
            S = 0;
            #10
            
            T = 0;
            R = 0;
            S = 0;
            #10
            
            T = 1;
            R = 0;
            S = 0;
            #10
            
            T = 0;
            R = 0;
            S = 0;
            #10
            
            T = 1;
            R = 0;
            S = 0;
            #10
            
            T = 1;
            R = 0;
            S = 0;
            #10
            
            T = 0;
            R = 1;
            S = 0;
            #10
            
            T = 0;
            R = 0;
            S = 0;
            #10
            
            T = 0;
            R = 0;
            S = 1;
            #10
        
            $display("Finished");    
        end
    

endmodule
