`timescale 1ns / 1ps

module mux_beh(i,s,y);

input wire [3:0] i;
input [1:0] s;
output reg y;
always @(s)
if(s[0] == 0 && s[1] ==0)
    begin
        y=i[0];
    end
    
else if(s[0] == 1 && s[1] ==0)
    begin
        y=i[1];
    end        
else if(s[0] == 0 && s[1] ==1)
    begin
        y=i[2];
    end 
else if(s[0] == 1 && s[1] ==1)
    begin
        y=i[3];
    end     
endmodule

module mux_beh_tb;
reg [3:0] I;
reg [1:0] S;
wire y;
mux_beh mux1(.i(I),.s(S),.y(y));

integer i=0;
initial
begin
I = 1010;
for(i=0;i<4;i=i+1)
    #10 S = i;
end
endmodule