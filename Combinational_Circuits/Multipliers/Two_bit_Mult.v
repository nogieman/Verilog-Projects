`timescale 1ns / 1ps

module HA(
    input a,b,
    output s,c
    );
    
    xor x1(s,a,b);
    and a1(c,a,b);
    
endmodule

`timescale 1ns / 1ps

module Two_bit_Mult(
    a0,a1,b0,b1,q0,q1,q2,q3
    );
    input a0,a1,b0,b1;
    output q0,q1,q2,q3;
    
    wire w0,w1,w2,w3,c1,c2;
    
    and A0(w0,a0,b0);
    and A1(w1,a1,b0);
    and A2(w2,a0,b1);
    and A3(w3,a1,b1);
    
    assign q0 = w0;
    HA ha1(w1,w2,q1,c1);
    HA ha2(w3,c1,q2,q3);
    
endmodule

`timescale 1ns / 1ps
module Two_bit_mult_tb;

reg A0,A1,B0,B1;
wire Q0,Q1,Q2,Q3;

Two_bit_Mult one(
    A0,A1,B0,B1,Q0,Q1,Q2,Q3
    );
    
initial
begin

#10
A1 = 0; A0 = 0; B1 = 0; B0 = 0;
#10
A1 = 0; A0 = 0; B1 = 0; B0 = 1;
#10
A1 = 0; A0 = 0; B1 = 1; B0 = 0;
#10
A1 = 0; A0 = 0; B1 = 1; B0 = 1;
#10
A1 = 0; A0 = 1; B1 = 0; B0 = 0;
#10
A1 = 0; A0 = 1; B1 = 0; B0 = 1;
#10
A1 = 0; A0 = 1; B1 = 1; B0 = 0;
#10
A1 = 0; A0 = 1; B1 = 1; B0 = 1;
#10
A1 = 1; A0 = 0; B1 = 0; B0 = 0;
#10
A1 = 1; A0 = 0; B1 = 0; B0 = 1;
#10
A1 = 1; A0 = 0; B1 = 1; B0 = 0;
#10
A1 = 1; A0 = 0; B1 = 1; B0 = 1;
#10
A1 = 1; A0 = 1; B1 = 0; B0 = 0;
#10
A1 = 1; A0 = 1; B1 = 0; B0 = 1;
#10
A1 = 1; A0 = 1; B1 = 1; B0 = 0;
#10
A1 = 1; A0 = 1; B1 = 1; B0 = 1;

#10 $finish;

end
    
endmodule

