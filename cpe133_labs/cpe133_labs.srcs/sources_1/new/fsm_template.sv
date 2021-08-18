`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/29/2018 07:31:15 PM
// Description: Shows how to write an FSM
//////////////////////////////////////////////////////////////////////////////////

module fsm_template(
    input clk,
    input reset,
    input x,
    output logic mealy, moore
    );
    
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
    logic [1:0] NS;
    logic [1:0] PS = START;
    
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [1:0] START = 2'b00, ST1 = 2'b01, ST2= 2'b10;
    
    //sequential logic to change states
    always_ff @ (posedge reset, posedge clk)
    begin
        if (reset) PS = START;
        else       PS = NS;
    end
    
    //combinatorial logic 
    always_comb 
    begin
    //initialze all outputs to zero
    mealy = 0; moore = 0;
    case (PS)
        START:
        begin
            moore = 1; //moore outputs depend only on state
            if (x == 1)
            begin
                mealy = 0; //mealy outputs depend on the input and state
                NS = ST1;
            end
            else
            begin
                mealy = 1;
                NS = ST2;
            end
         end
         
         ST1:
         begin
            moore = 0;
            mealy = 1;
            NS = ST2;
         end
         
         ST2:
         begin
            moore = 1;
            if (x == 1)
            begin
                mealy = 1;
                NS = ST1;
            end
            else
            begin
                mealy = 0;
                NS = START;
            end
         end
         
         default:
            NS = START;
      endcase      
      end       
endmodule
