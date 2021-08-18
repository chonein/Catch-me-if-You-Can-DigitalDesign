`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Christian Honein
// 
// Create Date: 06/12/2021 08:42:21 PM
//////////////////////////////////////////////////////////////////////////////////


module Lab1Sim;
    logic A, B, C, D; 
    logic F_SOP, F_POS, F_NORNOR;
    
    Lab1 Lab1_inst (  .A(A), .B(B), .C(C), .D(D), .F_SOP(F_SOP), .F_POS(F_POS), .F_NORNOR(F_NORNOR)  );
    
        //list your test cases
    initial 
        begin
        A = 0; B = 0; C = 0; D = 0; 
        #10
        
        A = 0; B = 0; C = 0; D = 1; 
        #10
        
        A = 0; B = 0; C = 1; D = 0; 
        #10
        
        A = 0; B = 0; C = 1; D = 1; 
        #10
        
        A = 0; B = 1; C = 0; D = 0; 
        #10
        
        A = 0; B = 1; C = 0; D = 1; 
        #10
        
        A = 0; B = 1; C = 1; D = 0; 
        #10
        
        A = 0; B = 1; C = 1; D = 1; 
        #10
        
        A = 1; B = 0; C = 0; D = 0; 
        #10
        
        A = 1; B = 0; C = 0; D = 1; 
        #10
        
        A = 1; B = 0; C = 1; D = 0; 
        #10
        
        A = 1; B = 0; C = 1; D = 1; 
        #10
        
        A = 1; B = 1; C = 0; D = 0; 
        #10
        
        A = 1; B = 1; C = 0; D = 1; 
        #10
        
        A = 1; B = 1; C = 1; D = 0; 
        #10
        
        A = 1; B = 1; C = 1; D = 1; 
        #10
        
        $display("Finished");  
      end                       
endmodule
