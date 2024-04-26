`timescale 1ns / 1ps

module Full_Adder(input a,b,c, 
                  output s1,s2,
                  output c1,c2,c3
);

xor X1(s1,a,b);
xor X2(s2,s1,c);

and A1(c1,a,b);
and A2(c2,c,s1);
or O1(c3,c2,c1);


endmodule

`timescale 1ns / 1ps

module Full_Adder_tb;

reg a,b,c;
wire s,carr;

Full_Adder UUT(
    .a(a),
    .b(b),
    .c(c),
    .s2(s),
    .c3(carr)
    );

initial
begin

#10 
a = 0; b = 0; c = 0;    #10
a = 0; b = 0; c = 1;    #10
a = 0; b = 1; c = 0;    #10
a = 0; b = 1; c = 1;    #10
a = 1; b = 0; c = 0;    #10
a = 1; b = 0; c = 1;    #10
a = 1; b = 1; c = 0;    #10
a = 1; b = 1; c = 1;    #10

$finish;

end
endmodule