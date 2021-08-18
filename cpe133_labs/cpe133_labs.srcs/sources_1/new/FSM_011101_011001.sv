`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2021 04:43:31 PM
// Design Name: 
// Module Name: FSM_011101_011001
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


module FSM_011101_011001(
    input clk,
    input X,
    input BT0,
    input reset,
    output logic Z
    );

    parameter [2:0]
    START = 3'b000,
    ST1 = 3'b001,
    ST2= 3'b010,
    ST3 = 3'b011,
    ST4 = 3'b100,
    ST5 = 3'b101,
    ST6= 3'b110,
    ST7 = 3'b111;

    logic [2:0] NS;
    logic [2:0] PS = START;
    
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
    if (reset)
        begin
            PS = START;
        end
        else
        begin
            PS = NS;
        end
    end
    
    //combinatorial logic 
    always_comb 
    begin
//    //initialze all outputs to zero
    Z = 0;
    case (PS)
        START:
        begin
            Z = 0; //moore outputs depend only on state
            if (X == 1)
            begin
                NS = START;
            end
            else
            begin
                NS = ST1;
            end
        end
        
         ST1:
         begin
            Z = 0;
            if (X == 0)
            begin
                NS = ST1;
            end
            else
            begin
                NS = ST2;
            end
         end
         
         ST2:
         begin
            Z = 0;
            if (X == 0)
            begin
                NS = ST1;
            end
            else
            begin
                NS = ST3;
            end
         end
         
         ST3:
         begin
            Z = 0;
            if (X == 0 && BT0 == 0)
            begin
                NS = ST5;
            end
            else if (X == 1 && BT0 == 1)
            begin
                NS = ST4;
            end
            else if (X == 0)
            begin
                NS = ST1;
            end
            else
            begin
                NS = START;
            end
         end
         
         ST4:
         begin
             if (X == 0 && BT0 == 1)
             begin
                NS = ST6;
             end
             else
             begin
                NS = START;
             end
         end
         
         ST5:
         begin
            if (X == 0 && BT0 == 0)
            begin
                NS = ST6;
            end
            else if (X == 1 && BT0 == 0)
            begin
                NS = ST6;
            end
            else
            begin
                NS = START;
            end
         end
         
         ST6:
         begin
            if (X == 1)
            begin
                NS = ST7;
            end
            else
            begin
                NS = ST1;
            end
         end
         
         ST7:
         begin
            Z = 1;
            if (X == 0)
            begin
                NS = ST1;
            end
            else
            begin
                NS = START;
            end
         end
         
         default:
            NS = START;
      endcase      
      end       
endmodule

