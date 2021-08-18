`timescale 1ns / 1ps

module Lab1(
    input A,
    input B,
    input C,
    input D,
    output F_SOP,
    output F_POS,
    output F_NORNOR
    );
    
    assign F_SOP = (B&D) | (B&C) | (A&D) | (A&C);
    assign F_POS = (A|B) & (C|D);
    assign F_NORNOR = ~(~(A|B) | ~(C|D));
endmodule
