`timescale 1ns / 1ps

module Register(
    input reset, clk, mode,
    input [3:0] in,
    output reg o
    );
reg [3:0] data;
integer i =0;
always@(posedge clk)
if(reset == 1'b1) begin
    o<=1'b0;
    data <= 4'b0000;
end
else if(mode == 1'b1) begin
    data <= in;
    //Register_4bit ( in, data);
end
else if(mode == 1'b0)begin
    for(i = 0; i <= 3; i=i+1) begin
        o <= data[0];
        data[0] <= data[i];
    end
end
endmodule

module  Register_tb;
reg clk, reset, mode;
reg [3:0] in;
wire out;
integer i =0;
Register R1(reset, clk, mode, in, out);

initial
begin
    in = 4'b1011;
    mode =1'b1; 
    clk = 1;
    reset = 1'b1; #5
    clk = 0;
    reset = 1'b0; 
    #5 mode = 1'b0;    
    for(i=0; i<= 10; i=i+1) #2 clk = ~clk;

    #40 $finish;
    
    
end
endmodule
//module Register_4bit(
//    input [3:0] in, output [3:0] q
//    );
//DFF d1( in[3], q[3]);
//DFF d2(in[2], q[2]);
//DFF d3(in[1], q[1]);
//DFF d4(in[0], q[0]);

//endmodule