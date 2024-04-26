module bit_alu(
    input [1:0] operand1,
    input [1:0] operand2,
    input [2:0] opcode,
    output reg [1:0] result
);

always @(*)
begin
    case(opcode)
        3'b000: result = operand1 + operand2; // Addition
        3'b001: result = operand1 - operand2; // Subtraction
        3'b010: result = operand1 & operand2; // Bitwise AND
        3'b011: result = operand1 | operand2; // Bitwise OR
        3'b100: result = operand1 ^ operand2; // Bitwise XOR
        default: result = 2'b0; // Default case
    endcase
end

endmodule

module tb_2_bit_alu;

reg [1:0] operand1, operand2;
reg [2:0] opcode;
wire [1:0] result;

// Instantiate ALU
bit_alu alu(
    .operand1(operand1),
    .operand2(operand2),
    .opcode(opcode),
    .result(result)
);

// Stimulus
initial begin
    // Test case 1: Addition (00)
    operand1 = 2'b01;
    operand2 = 2'b01;
    opcode = 3'b000;
    #10;

    // Test case 2: Subtraction (01)
    operand1 = 2'b10;
    operand2 = 2'b01;
    opcode = 3'b001;
    #10;

    // Test case 3: Bitwise AND (10)
    operand1 = 2'b11;
    operand2 = 2'b10;
    opcode = 3'b010;
    #10;

    // Test case 4: Bitwise OR (11)
    operand1 = 2'b10;
    operand2 = 2'b01;
    opcode = 3'b011;
    #10;

    // Test case 5: Bitwise XOR (100)
    operand1 = 2'b11;
    operand2 = 2'b10;
    opcode = 3'b100;
    #10;

    // End simulation
    $finish;
end

endmodule
