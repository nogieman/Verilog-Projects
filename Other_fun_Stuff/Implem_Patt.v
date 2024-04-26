`timescale 1ns / 1ps

module mux(
    input [3:0] in,
    input [1:0] s,
    output reg y
    );
    always@(*)
    case(s)
    2'b00: y<=in[0];
    2'b01: y<=in[1];
    2'b10: y<=in[2];
    2'b11: y<=in[3];
    default: y<= 0;
    endcase
endmodule


module DFF(input clk, reset, in,
    output reg o
     );
     always@(posedge clk) begin
     if(reset) o <= 0;
     else o <= in;
     
     end
endmodule

module Implem_Patt(
    input in, clk, reset,
    output dec
    );
    wire ap,bp,a,b;
    
    mux M1({0,!in,in,0},{a,b},ap);
    mux M2({in,1,0,in},{a,b},bp);
    mux M3({0,0,0,1},{a,b},dec);
    
    DFF d1(clk, reset, ap,a);
    DFF d2(clk, reset, bp,b);
endmodule

module Implem_Patt_tb;
reg clk, reset, x;
wire z;
reg [9:0] r = 10'b1111111000;

Implem_Patt im1(x, clk, reset, z);
initial
begin
clk =0;
reset =1; x=0;
#5
reset =0;
#10 x = 1; 
#10 x = 1; 
#10 x = 1; 
#10 x = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
#10 x = 1; 
# 100 $finish;
end
always #5 clk = !clk;
endmodule