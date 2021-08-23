`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly
// Engineer: Alex Elliott
// 
// Create Date: 08/18/2021 04:59:08 PM
// Design Name: CatchMeFSM
// Module Name: CatchMeFSM
// Project Name: Catch Me If You Can
// Target Devices: Basys 3 Board
// Additional Comments: This is the primary FSM which runs the Catch Me If You Can game.
//                      The module handles the switching of LEDs in two different ways depending on the mode.
// 
//////////////////////////////////////////////////////////////////////////////////


module CatchMeFSM(
    input clk, reset, mode, pause, // mode 0 = normal, mode 1 = random
    input [4:0] switch,
    input [4:0] prevState,
    output logic scoreEN, healthEN, //MEALY, active high
    output logic [4:0] led //MOORE
    );
    
    //create randomness generation signals
    logic randA, randB, randC, randD;
    
    //assign bit values to your states
    parameter [4:0] START = 5'b10000, PAUSE = 5'b11111, LED0 = 5'h0, LED1 = 5'h1, LED2 = 5'h2, LED3 = 5'h3, LED4 = 5'h4, LED5 = 5'h5, LED6 = 5'h6, LED7 = 5'h7, LED8 = 5'h8, LED9 = 5'h9, LED10 = 5'hA, LED11 = 5'hB, LED12 = 5'hC, LED13 = 5'hD, LED14 = 5'hE, LED15 = 5'hF;
    
    //declare present state (PS) and next state (NS) variables
    //initialize PS to the beginning state
    logic [4:0] NS;
    logic [4:0] PS = START;
    
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
        if (reset)
        begin
            PS = START;
        end
        else if (pause)
        begin
            PS = PAUSE;
        end
        else
        begin
            PS = NS;
        end
    end
    
    //combinatorial logic 
    always_comb 
    begin
    //initialze all outputs to zero equivalent
    led = 5'b10000;
    scoreEN = 0;
    healthEN = 0;
    case (PS)
         START:
         begin
            scoreEN = 0;
            healthEN = 0;
            led = 5'b10000;
            NS = LED0;
         end
         
         PAUSE:
         begin
            scoreEN = 0;
            healthEN = 0;
            NS = prevState;
            led = 5'b10000;
            // don't need to set a new NS bcs it should revert back to the previous one
         end
         
         LED0:
         begin
            led = 0;
            if (mode == 1)
            begin
                randA = ~randA;
                randC = ~randC;
                NS = {1'b0,randA,randB,randC,randD};
            end
            else
            begin
                NS = LED1;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED1:
         begin
            led = 1;
            if (mode == 1)
            begin
                randA = ~randA;
                randD = ~randD;
                NS = {1'b0,randD,randB,randC,randA};
            end
            else
            begin
                NS = LED2;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED2:
         begin
            led = 2;
            if (mode == 1)
            begin
                randA = ~randA;
                randB = ~randB;
                NS = {1'b0,randA,randC,randB,randD};
            end
            else
            begin
                NS = LED3;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED3:
         begin
            led = 3;
            if (mode == 1)
            begin
                randB = ~randB;
                randC = ~randC;
                NS = {1'b0,randD,randC,randB,randA};
            end
            else
            begin
                NS = LED4;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED4:
         begin
            led = 4;
            if (mode == 1)
            begin
                randB = ~randB;
                randA = ~randA;
                NS = {1'b0,randA,randB,randC,randD};
            end
            else
            begin
                NS = LED5;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED5:
         begin
            led = 5;
            if (mode == 1)
            begin
                randB = ~randB;
                randD = ~randD;
                NS = {1'b0,randD,randB,randC,randA};
            end
            else
            begin
                NS = LED6;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED6:
         begin
            led = 6;
            if (mode == 1)
            begin
                randC = ~randC;
                randB = ~randB;
                NS = {1'b0,randA,randC,randB,randD};
            end
            else
            begin
                NS = LED7;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED7:
         begin
            led = 7;
            if (mode == 1)
            begin
                randC = ~randC;
                randA = ~randA;
                NS = {1'b0,randD,randC,randB,randA};
            end
            else
            begin
                NS = LED8;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED8:
         begin
            led = 8;
            if (mode == 1)
            begin
                randC = ~randC;
                randD = ~randD;
                NS = {1'b0,randA,randB,randC,randD};
            end
            else
            begin
                NS = LED9;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED9:
         begin
            led = 9;
            if (mode == 1)
            begin
                randD = ~randD;
                randA = ~randA;
                NS = {1'b0,randD,randB,randC,randA};
            end
            else
            begin
                NS = LED10;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED10:
         begin
            led = 10;
            if (mode == 1)
            begin
                randD = ~randD;
                randC = ~randC;
                NS = {1'b0,randA,randC,randB,randD};
            end
            else
            begin
                NS = LED11;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED11:
         begin
            led = 11;
            if (mode == 1)
            begin
                randD = ~randD;
                randB = ~randB;
                NS = {1'b0,randD,randC,randB,randA};
            end
            else
            begin
                NS = LED12;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED12:
         begin
            led = 12;
            if (mode == 1)
            begin
                randA = ~randB;
                randC = ~randD;
                NS = {1'b0,randA,randB,randC,randD};
            end
            else
            begin
                NS = LED13;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED13:
         begin
            led = 13;
            if (mode == 1)
            begin
                randB = ~randC;
                randD = ~randA;
                NS = {1'b0,randD,randB,randC,randA};
            end
            else
            begin
                NS = LED14;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED14:
         begin
            led = 14;
            if (mode == 1)
            begin
                randA = ~randD;
                randC = ~randB;
                NS = {1'b0,randA,randC,randB,randD};
            end
            else
            begin
                NS = LED15;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED15:
         begin
            led = 15;
            if (mode == 1)
            begin
                randB = ~randA;
                randD = ~randC;
                NS = {1'b0,randD,randC,randB,randA};
            end
            else
            begin
                NS = LED0;
            end
            if (switch == led)
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         default:
         begin
            scoreEN = 0;
            healthEN = 0;
            led = 5'b10000;
            NS = LED0;
         end
    endcase
    end
endmodule
