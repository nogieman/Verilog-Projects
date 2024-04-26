`timescale 1ns / 1ps

module mux_4x1(
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
