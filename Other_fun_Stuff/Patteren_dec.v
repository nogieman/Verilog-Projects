`timescale 1ns / 1ps

module Patteren_dec(
    input reset, clk, 
    input in,
    output reg dec
);
parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
reg [1:0] state; 

always @(posedge clk) begin
    if(reset) begin
        dec <= 1'b0;
        state <= s0;
    end
    else begin
        case(state)
            s0: begin
                dec <= 1'b0;
                state <= in ? s0 : s1;
            end
            
            s1: begin
                dec <= 1'b0;
                state <= in ? s2 : s1;
            end
            
            s2: begin
                dec <= 1'b1;
                state <= in ? s3 : s1;
            end
            
            s3: begin
                dec <= 1'b1;
                state <= in ? s0 : s1;
            end
        endcase
    end
end

endmodule

module Patteren_dec_tb;
    reg reset, clk;
    reg in;
    reg [19:0] r = 20'b10110101010101101100;
    wire dec;
    integer i = 0;
    Patteren_dec P1(reset, clk, in, dec);

    initial begin
        clk = 0; reset = 1; in = 0;
        #10 reset = 0;
        
        // Toggle 'in' every clock cycle
        for(i=0; i <20; i=1+1)
            #5 in = r[i];
            #5;
            $finish;
        end
    
    always #5 clk = ~clk;
endmodule








//`timescale 1ns / 1ps

//module Patteren_dec(
//    input reset, clk, 
//    input in,
//    output reg dec
//    );
//parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
//reg [1:0] state; 
//always@(posedge clk) begin
//if(reset) begin
//    dec <= 1'b0;
//    state <= s0;
//end
//else begin
//    case(state)
//        s0: begin
//            dec <= 1'b0;
//            if(in) state <= s0;
//            else state <= s1;
//        end
        
//        s1: begin
//            dec <= 1'b0;
//            if(in) state <= s2;
//            else state <= s1;
//        end
        
//        s2: begin
//            dec <= 1'b1;
//            if(in) state <= s3;
//            else state <= s1;
//        end
        
//        s3: begin
//            dec <= 1'b1;
//            state <= in ? s0 : s1;
//        end
//    endcase
//end
//end
//endmodule

//module Patteren_dec_tb;
//reg reset, clk;
//reg in;
//reg [19:0] r=20'b10110101010101101100;
//wire dec;
//integer i=0;
//Patteren_dec P1(reset, clk, in, dec);

//initial
//begin
//#20
//    in = 0;
    
//    reset =1;
//    #10
    
//     #5
//    #5
//    reset =0;
//    for(i=0; i<20; i=i+1)
//        #5 in = r[i];
//    $finish;
//end
//always #5 clk = !clk;
//endmodule