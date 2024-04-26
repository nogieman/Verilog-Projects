module alu_4bit (
    input [3:0] a,
    input [3:0] b,
    input [1:0] op, // 00: addition, 01: subtraction, 10: multiplication, 11: division
    output reg [3:0] result,
    output reg zero_flag
);

always @(*)
begin
    case(op)
        2'b00: result = a + b; // Addition
        2'b01: result = a - b; // Subtraction
        2'b10: result = a * b; // Multiplication
        2'b11: begin             // Division
                    if (b == 0)
                        result = 4'bXXXX; // Undefined value for division by zero
                    else
                        result = a / b;
               end
        default: result = 4'bXXXX; // Undefined operation
    endcase
end

always @(*)
begin
    zero_flag = (result == 4'b0000) ? 1'b1 : 1'b0; // Set zero flag if result is zero
end

endmodule


module alu_4bit_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg [3:0] a, b;
reg [1:0] op;
wire [3:0] result;
wire zero_flag;

// Instantiate ALU
alu_4bit dut (
    .a(a),
    .b(b),  
    .op(op),
    .result(result),
    .zero_flag(zero_flag)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD / 2)) clk = ~clk;

// Stimulus
initial begin
    // Test addition
    op = 2'b00; // Addition
    a = 4'b0010;
    b = 4'b0001;
    #10;
    // Test subtraction
    op = 2'b01; // Subtraction
    a = 4'b0110;
    b = 4'b0101;
    #10;
    // Test multiplication
    op = 2'b10; // Multiplication
    a = 4'b0101;
    b = 4'b0011;
    #10;
    // Test division
    op = 2'b11; // Division
    a = 4'b1000;
    b = 4'b0010;
    #10;
    // Test division by zero
    op = 2'b11; // Division
    a = 4'b1111;
    b = 4'b0000;
    #10;
    // End simulation
    $finish;
end

endmodule
