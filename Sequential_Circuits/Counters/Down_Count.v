`timescale 1ns / 1ps
module UP_Down(
    input clk, reset, modd,
    output reg [3:0] out
    );
    
    always@(posedge clk) begin
    case({reset, modd})
    2'b00: out <= out+1;
    2'b01: out<= out-1;
    2'b10: out = 4'b0000;
    2'b11: out = 4'b1111;
    endcase
    end

endmodule
module Down_Count_tb;
reg clk, reset,mode;
wire [3:0] out;
UP_Down coun(clk, reset,mode, out);
initial begin
clk = 0; mode =1; #5 reset=1; #10 reset =0;
#100 clk = 1;
reset = 0;
mode = 0;
#100 mode = 1;

$finish;
end
always #5 clk = !clk;
endmodule
