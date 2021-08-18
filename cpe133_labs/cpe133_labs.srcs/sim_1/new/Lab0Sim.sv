`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Christian Honein
// 
// Create Date: 06/12/2021 08:42:21 PM
//////////////////////////////////////////////////////////////////////////////////


module Lab0Sim;
    logic A, B, C; 
    logic Q;
    
    Lab0 Lab0_inst (  .A(A), .B(B), .C(C), .Q(Q)  );
    
        //list your test cases
    initial 
        begin
        //test 0
        A = 0; B = 0; C = 0;
        #10
        if (Q!==1) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 1
        A = 0; B = 0; C = 1;
        #10
        if (Q!==1) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 2
        A = 0; B = 1; C = 0;
        #10
        if (Q!==0) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 3
        A = 0; B = 1; C = 1;
        #10
        if (Q!==1) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 4
        A = 1; B = 0; C = 0;
        #10
        if (Q!==0) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 5
        A = 1; B = 0; C = 1;
        #10
        if (Q!==0) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 6
        A = 1; B = 1; C = 0;
        #10
        if (Q!==0) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        //test 7
        A = 1; B = 1; C = 1;
        #10
        if (Q!==1) $display("Error A:%b, B: %b, C: $b", A, B, C);
        
        $display("Finished");  
      end                       
endmodule
