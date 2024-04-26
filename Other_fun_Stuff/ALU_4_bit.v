`timescale 1ns / 1ps


module ALU_4_bit(
    input [2:0] s,
    input [3:0] a,b,
    output reg [7:0] out
    
    );
    
    always@(*)
    case(s)
        3'b000: out <= a + b;
        3'b001: out <= a - b;
        3'b010: out <= a * b;
        3'b011: out <= a / b;
        3'b100: out <= a & b;
        3'b101: out <= a ^ b;
        3'b110: out <= a | b;
        3'b111: out <= a << b;
        endcase
     
        
    
endmodule

module ALU_tb;
reg [2:0] s;
reg [3:0] a,b;
wire [7:0] out;
integer i=0;
ALU_4_bit al(s,a,b,out);
initial begin
a = 15; b = 9; s =0;
for(i=0; i<8; i=i+1)
    #5 s = i;

end




endmodule
