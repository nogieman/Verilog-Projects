`timescale 1ns / 1ps

module Decoder(
    input [2:0]in,
    output reg [7:0] out
    );
    always@(in)
    case(in)
    3'b000: out <= 8'b10000000;
    3'b001: out <= 8'b01000000;
    3'b010: out <= 8'b00100000;
    3'b011: out <= 8'b00010000;
    3'b100: out <= 8'b00001000;
    3'b101: out <= 8'b00000100;
    3'b110: out <= 8'b00000010;
    3'b111: out <= 8'b00000001;
    endcase
endmodule

module Decoder_tb;
reg [2:0] in;
wire [7:0] out;
integer i=0;
Decoder D_3x8(in,out);
initial begin
in = 3'b000;
for(i=0; i<8;i=i+1)
    #5 in=in+1;
$finish;

end
endmodule