`timescale 1ns / 1ps

module Dff(input clk, reset, D, output reg q);

always@(posedge clk)
if(reset==0)
begin
    q <= 0;
    //qb <= 1;
end
else
begin
    q <= D;
    //qb <= ~D;
end
endmodule

module shift_reg(
    input clk, reset, in, output [3:0] q,qb
    );

Dff d0(clk, reset, q[1], q[0]);//, qb[0]);
Dff d1(clk, reset, q[2], q[1]);//, qb[1]);
Dff d2(clk, reset, q[3], q[2]);//, qb[2]);
Dff d3(clk, reset, in, q[3]);//, qb[3]);

endmodule

module shift_reg_tb;
reg clk, reset, in;
wire [3:0] q;//,qb;

shift_reg R1(clk, reset, in, q);//,qb);

integer i=0;
initial
begin 
clk =1;
reset = 0; #5
clk = 0; #5
clk=1;
reset =1;
in = 1;
for(i=0; i<10; i=i+1)
    #5 
    clk = ~clk;

$finish;
end
endmodule
