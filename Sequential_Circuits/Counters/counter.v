`timescale 1ns / 1ps

module DFF(
    input clk, reset, D,
    output reg q, qb
    );
always@(posedge clk)
if(reset==0)
begin
    q<=0;
    qb<=1;
end
else begin
    q<=D;
    qb<= ~D;
    end
endmodule

module counterr(
    input clk, reset,
    output [2:0] q,qb
);
wire a,b,c;
assign q = 000;
DFF D2(clk, reset, a, q[2],qb[2]);
DFF D1(clk, reset, b, q[1], qb[1]);
DFF D0(clk, reset, c, q[0], qb[0]);
assign a = (qb[1]&qb[0] + q[2]&q[0]);
assign b = (q[2]&qb[1]&qb[0] + q[2]&q[1]&q[0]);
assign c = qb[1]&qb[2];


endmodule

