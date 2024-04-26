`timescale 1ns / 1ps
    
module Bin_to_Gray(
    input [3:0] a,
    output [3:0] o
    );
    
    xor x1(o[0], a[0],a[1]);
    xor x2(o[1], a[1],a[2]);
    xor x3(o[2],a[2],a[3]);
    assign o[3] = a[3];
endmodule
module BintoG_tb;
reg [3:0] a;
wire [3:0] o;
Bin_to_Gray Binary_TO_Gray(a,o);
initial begin
a = 4'b0100; #10
a = 4'b1101; #10
$finish;
end
endmodule
