`timescale 1ns / 1ps

module Full(
    input a,b,c,
    output s,ca
    );
    
    assign s = a^b^c;
    assign ca = a&b | c&(a^b);
endmodule

module Rip_Ca(
    input [3:0] a,b,
    output [3:0] q,
    output carry
    );
    wire [3:0] c;
    Full A1(a[0],b[0],0,q[0],c[0]);
    Full A2(a[1],b[1],c[0],q[1],c[1]);
    Full A3(a[2],b[2],c[1],q[2],c[2]);
    Full A4(a[3],b[3],c[2],q[3],c[3]);
    assign carry  = c[3];
endmodule

module Rip_Ca_tb;
reg [3:0] a,b;
wire [3:0] q;
wire carry;

Rip_Ca Adder1(a,b,q,carry);
initial
begin
a = 4'b0110;
b = 4'b1110;


end
endmodule