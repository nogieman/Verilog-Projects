`timescale 1ns / 1ps

module reg_4bit(
    input wire clk,    // Clock input
    input wire load,   // Load input
    input wire [3:0] data_in,  // Data input (4-bit)
    output [7:0] data_out // Data output (8-bit)
);

// Internal register to store the current value
reg [3:0] reg_value;
reg lo;
always @(posedge clk) begin
    lo <=load;
    if (lo) begin
            reg_value <= data_in;
            //lo <= load;
        end
        else 
             lo = lo + 1;
            
    end


// Assign the output data
assign data_out = {4'b0000, reg_value};

endmodule