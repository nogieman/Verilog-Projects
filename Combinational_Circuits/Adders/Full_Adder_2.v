`timescale 1ns / 1ps

module Full_Adder_2(
    input a,b,c,
    output s,ca
    );
wire w1,w2,w3;
xor x1(w1,a,b);
xor x2(s,w1,c);
and a1(w2,a,b);
and a2(w3,w1,c);
or o1(ca,w2,w3);

endmodule

module Full_Adder2tb;
reg A,B,C;
wire S,CARRY;
Full_Adder_2 adder_(A,B,C,S,CARRY);
initial
begin
#10
A = 0; B = 0; C = 0;
#10
A = 0; B = 0; C = 1;
#10
A = 0; B = 1; C = 0;
#10
A = 0; B = 1; C = 1;
#10
A = 1; B = 0; C = 0;

end

endmodule