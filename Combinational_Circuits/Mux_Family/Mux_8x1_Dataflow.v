`timescale 1ns / 1ps
module Mux_8x1_Dataflow(
input [7:0] I,
input [2:0] S, 
output Y
    );

assign Y = ~S[2]&~S[1]&~S[0]&I[0] + ~S[2]&~S[1]&S[0]&I[1] + ~S[2]&S[1]&~S[0]&I[2] + ~S[2]&S[1]&S[0]&I[3] + S[2]&~S[1]&~S[0]&I[4] + S[2]&~S[1]&S[0]&I[5] + S[2]&S[1]&~S[0]&I[6] + S[2]&S[1]&S[0]&I[7];
endmodule
