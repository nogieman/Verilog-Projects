`timescale 1ns / 1ps

module TFF(input clk,reset,T, output reg q, qb);
always@(posedge clk)
if(reset==0)
begin
    q <= 0;
    qb <= 1;
end
else
begin
    qb <= T;
    q <= ~T;
end
endmodule

module Counter(
    input clk, reset, output  [2:0] q,qb
    );
//wire w1;
//assign q[2] = w1;
TFF T2(clk, reset, 1, q[2],qb[2]);
TFF T1(q[2], reset, 1, q[1], qb[1]);
TFF T0(q[1], reset, 1, q[0], qb[0]);

endmodule

module counter_tb;
reg clk, reset;
wire [2:0] q,qb;
Counter C1(clk, reset, q, qb);
integer i=0;
initial
begin 
reset = 1; 

for(i=0; i<10; i=i+1)

#5 
clk = ~clk;
end
endmodule