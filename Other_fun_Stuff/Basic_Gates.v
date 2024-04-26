`timescale 1ns / 1ps
module Basic_Gates(
    input a,b,
    output  o0,o1,o2,o3,o4,o5,o6
    );
    
    assign o0 = !a;
    assign o1 = a | b;
    assign o2 = a & b;
    assign o3 = a ^ b;
    assign o4 = !(a^b);
    assign o5 = !(a | b);
    assign o6 = !(a&b);
    
endmodule
module bas_tb;
reg a,b;
wire o0,o1,o2,o3,o4,o5,o6;
Basic_Gates ba(a,b,o0,o1,o2,o3,o4,o5,o6);
initial 
begin

a=1;
b=0;
#5
a=1; b=1;
#5
$finish;
end
endmodule
