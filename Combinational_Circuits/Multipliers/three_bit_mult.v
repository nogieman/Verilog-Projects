`timescale 1ns / 1ps

module Full_Adder(input a,b,c, 
                  output s2,
                  output c3
);
wire c1,c2,s1;
xor X1(s1,a,b);
xor X2(s2,s1,c);
and A1(c1,a,b);
and A2(c2,c,s1);
or O1(c3,c2,c1);
endmodule

module Half_Adder(
    input a,b,
    output s,c
    );
xor x1(s,a,b);
and a1(c,a,b);
endmodule
    
module three_bit_mult(
    input a2,a1,a0,b2,b1,b0,
    output q5,q4,q3,q2,q1,q0
    );
wire w0,w1,w2,w3,w4,w5,w6,w7,w8;
wire s1,s2,s3,s4,s5,sc,c1,c2,c3,c4,c5,c6,cc;

and and0(w0,a0,b0);
and and1(w1,a1,b0);
and and2(w2,b1,a0);
and and3(w3,a2,b0);
and and4(w4,a1,b1);
and and5(w5,a0,b2);
and and6(w6,b1,a2);
and and7(w7,a1,b2);
and and8(w8,a2,b2);

Half_Adder HA1(w1,w2,s1,c1);
Full_Adder FA1(c1,w3,w4,s2,c2);
Half_Adder HA2(s2,w5,s3,c3);
//or o1(c6,c3,c2);
Full_Adder FA2(c2,w6,w7,s4,c4);
Half_Adder HA_Tr(s4,c3,sc,cc);
Full_Adder FA3(c4,cc,w8,s5,c5);

assign q0 = w0;
assign q5 = c5;
assign q1 = s1;
assign q2 = s3;
assign q3 = sc;
assign q4 = s5;

endmodule

module three_bit_mult_tb;

reg a2,a1,a0,b2,b1,b0;
wire q5,q4,q3,q2,q1;

three_bit_mult Three_Bit_Multiplier(a2,a1,a0,b2,b1,b0,q5,q4,q3,q2,q1,q0);
integer i = 0;
initial
begin

for(i=0;i <64; i = i+1)
#10
{a2,a1,a0,b2,b1,b0}=i;

$finish;
end


endmodule