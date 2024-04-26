`timescale 1ns / 1ps


module Demux(
    input in,
    input [1:0] s,
    output [3:0] o
    );
assign o[3] = !s[0] & !s[1] & in;
assign o[2] = !s[0] & s[1] & in;
assign o[1] = s[0] & !s[1] & in;
assign o[0] = s[0] & s[1] & in;

endmodule

module Demux_tb;
reg in;
reg [1:0] s;
wire [3:0] o;

Demux D1(in, s, o);
initial begin
#5
in = 1;
#5 s = 2'b00;
#5 s = 2'b01;
#5 s = 2'b10;
#5 s = 2'b11;

end

endmodule
