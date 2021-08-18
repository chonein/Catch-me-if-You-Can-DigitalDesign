`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Lab 4
//////////////////////////////////////////////////////////////////////////////////


module RC_Add_Sub(
    input [3:0] A,
    input [3:0] B,
    input Sub,
    output [6:0] seg,
    output [3:0] an,
    output neg
    );
    
    logic t7;
    logic [3:0] t1, t3,t4, t5;
    
    MUX_2_1#(3) MUX0 ( .zero(B), .one(~B), .SEL(Sub), .out(t1) );
    RCA_4_FA RCA1 ( .A(A), .B(t1), .Cin(Sub), .S(t3), .Co() );
    RCA_4_FA RCA2 ( .A(~t3), .B(4'b0000), .Cin(1'b1), .S(t4), .Co() );
    Validity Validity1 ( .A(A[3]), .B(t1[3]), .S(t3[3]), .Valid(t7) );
    assign neg = t3[3] & t7;
    MUX_2_1#(3) MUX1 ( .zero(t3), .one(t4), .SEL(neg), .out(t5) );
    MUX_2_1#(3) MUX2 ( .zero(4'b1111), .one(4'b1110), .SEL(t7), .out(an) );
    SevenSeg ssegdec1 ( .BCD(t5) , .seg(seg) );

    
    
endmodule
