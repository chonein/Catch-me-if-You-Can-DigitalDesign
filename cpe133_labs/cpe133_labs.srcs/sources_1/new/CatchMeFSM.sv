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
//                      The module handles the switching of LEDs in two different ways (sequentially or somewhat-randomly) depending on the mode.
// 
//////////////////////////////////////////////////////////////////////////////////


module CatchMeFSM(
    input clk, reset, mode, pause, // mode 0 = sequential, mode 1 = random
    input [4:0] switch, //if MSB is high, the switch input is invalid
    input [4:0] prevState, //stores the state that the FSM was in before entering the PAUSE state
    output logic scoreEN, healthEN, //MEALY outputs, active high
    output logic [4:0] led //MOORE output (MSB is active-low led enable)
    );
    
    //create randomness generation signals (correspond to a,b,c,d on the state diagram)
    logic randA = 0, randB = 0, randC = 0, randD = 0;
    
    /*  The randomness-generation signals are used to create the effect of a random sequence.
        Each LED state transitions to another state as determined by the arrangement of these single-bit variables.
        The four variables together form the 4-bit state ID that the FSM transitions to.
        Every time the FSM transitions to a new state, it toggles two of the four randomness variables.
        This means that every state is technically predictable, but it still appears random enough for this game. 
    */
    
    //assign bit values to the states (leds in hex for convenience)
    parameter [4:0] START = 5'b10000, PAUSE = 5'b11111, LED0 = 5'h0, LED1 = 5'h1, LED2 = 5'h2, LED3 = 5'h3, LED4 = 5'h4, LED5 = 5'h5, LED6 = 5'h6, LED7 = 5'h7, LED8 = 5'h8, LED9 = 5'h9, LED10 = 5'hA, LED11 = 5'hB, LED12 = 5'hC, LED13 = 5'hD, LED14 = 5'hE, LED15 = 5'hF;
    
    //declare present state (PS) and next state (NS) variables
    //initialize PS to the start state
    logic [4:0] NS;
    logic [4:0] PS = START;
    
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
        if (reset) // reset FSM to start state whenever reset is triggered
        begin
            PS = START;
        end
        else if (pause) // move to pause state as long as pause input is active
        begin
            PS = PAUSE;
        end
        else
        begin
            PS = NS; // otherwise, proceed to the designated next-state
        end
    end
    
    //combinatorial logic 
    always_comb 
    begin
    //initialze all outputs to their zero equivalents
    led = 5'b10000; //(this is zero since the MSB turns off the LEDs)
    scoreEN = 0;
    healthEN = 0;
    case (PS)
         START:
         begin
            scoreEN = 0; //keep score and health counters disabled
            healthEN = 0;
            led = 5'b10000; //keep LEDs off
            NS = LED0; //always move to LED0 state from the START state
         end
         
         PAUSE:
         begin
            scoreEN = 0; // keep score and health counters disabled
            healthEN = 0;
            NS = prevState; // revert back to previous state once unpaused
            led = 5'b10000; //keep LEDs off
         end
         
         LED0:      // NOTE: This is the only LED state I will add comments to, since the comments are the same for all 16 LED states.
         begin
            led = 0; // set led output
            if (mode == 1) // if in random mode, toggle two of the four randomness variables and assign a next state based on the four variables
            begin
                randA = ~randA;
                randC = ~randC;
                NS = {1'b0,randA,randB,randC,randD}; // (MSB must be 0 since this should go to an LED state)
            end
            else
            begin
                NS = LED1; // if in sequential mode, next state is always the next led
            end
            if (switch == led) // if the flipped switch is the same as the led (by the time of the next clock transition), enable the score counter
            begin
                scoreEN = 1;
                healthEN = 0;
            end
            else // otherwise, the wrong switch or an invalid switch was flipped, so enable the health counter to decrease the health
            begin
                scoreEN = 0;
                healthEN = 1;
            end
         end
         
         LED1: // ( see LED0 state for comments )
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
         
         LED2: // ( see LED0 state for comments )
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
         
         LED3: // ( see LED0 state for comments )
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
         
         LED4: // ( see LED0 state for comments )
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
         
         LED5: // ( see LED0 state for comments )
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
         
         LED6: // ( see LED0 state for comments )
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
         
         LED7: // ( see LED0 state for comments )
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
         
         LED8: // ( see LED0 state for comments )
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
         
         LED9: // ( see LED0 state for comments )
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
         
         LED10: // ( see LED0 state for comments )
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
         
         LED11: // ( see LED0 state for comments )
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
         
         LED12: // ( see LED0 state for comments )
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
         
         LED13: // ( see LED0 state for comments )
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
         
         LED14: // ( see LED0 state for comments )
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
         
         LED15: // ( see LED0 state for comments )
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
         
         default: // redirects any illegal states
         begin
            scoreEN = 0; // make sure both counters are disabled
            healthEN = 0;
            led = 5'b10000; // make sure LEDs are off
            NS = LED0; // redirect back to LED0 state
         end
    endcase
    end
endmodule
