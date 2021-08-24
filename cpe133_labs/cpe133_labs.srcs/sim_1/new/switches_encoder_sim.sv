`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Honein
// Create Date: 08/17/2021 08:52:13 PM
// Module Name: switches_encoder_sim
// Description: Simulation file
//////////////////////////////////////////////////////////////////////////////////


module switches_encoder_sim();
    logic INVALID;
    logic [4:0] ENCODED_SWITCHES;
    logic [15:0] S;
    
    switches_encoder switches_encoder_inst ( .SWITCHES(S), .ENCODED_SWITCHES(ENCODED_SWITCHES) );
    
    initial
        begin
            
            S = 'b0;
            #10
            
            S = 16'b1111111111111111;
            #10
            
            S = 16'b0000000000000001;
            #10
            
            S = 16'b1000000000000000;
            #10
            
            S = 16'b0000000000010010;
            #10
            
            S = 16'b0000000000000010;
            #10
            
            S = 16'b0010000000000000;
            #10
            
            S = 16'b1010000000000001;
            #10
            
            
                                    
            $display("Finished");  
      end   
    
endmodule
