`timescale 1ns / 1ps

module HA(
    input a,b,
    output s,c
    );
    
    xor x1(s,a,b);
    and a1(c,a,b);
    
endmodule

module FA_Using_HA(
    input A,B,C,
    output Sum,Carry
    );
    wire s1,c1,c2;
    
    HA h1(A,B,s1,c1);
    HA h2(s1,C,Sum,c2);
    
    assign Carry = c1 | c2;

endmodule

`timescale 1ns / 1ps


