`timescale 1ns / 1ps

module sr(s,r,q,qn,clk,rst );
input s,r,clk,rst;
output reg q,qn;
always@(posedge clk)
begin 
if(rst==1)
begin q<=0; qn<=1; end
else begin
case({s,r})
2'b00 : begin q=0; qn=~q;end
2'b01 : begin q=0; qn=0;end
2'b10 : begin q=1; qn=1;end
2'b11 : begin q=0; qn=0;end
endcase
end
end
endmodule


module sr_tb;
reg s,r,clk,rst;
wire q,qn;
sr uut(s,r,q,qn,clk,rst );
initial begin 
clk=0;
rst=1;
#100
clk=1;
rst=0;
s=0;r=0;#10; 
s=0;r=1;#10; 
s=1;r=0;#10; 
s=1;r=1;#10;
end
always #5 clk=~clk;
endmodule
