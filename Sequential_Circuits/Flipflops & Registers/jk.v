`timescale 1ns / 1ps

module jk(input j,k,clk,reset,
    output reg q,
    output qb);
    assign qb = !q;
always@(posedge clk)

if(reset)
        q<=0;
else begin
    case({j,k})
        2'b00: q <=q;
        2'b01: q<=0;
        2'b10: q<=1;
        2'b11: q <= !q;
    endcase
    end
endmodule

module jk_tb;
reg j,k,clk,reset;
wire q,qb;

jk uut( j,k,clk,reset,q,qb
);
integer i =0;
initial begin
reset = 1;
clk=0; #5
clk =1;
j=0;
k=0;
#5 reset =0;
j=1;
k=1;
clk=0;
for(i=0; i<=100; i=i+1)
    #5 clk = !clk;
$finish;
end
endmodule