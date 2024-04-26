module EvenParityGenerator(
    input [4:0] data_in,
    output parity
);

wire [4:0] xor_out;
wire [2:0] xor_tree_out;

assign xor_out[0] = data_in[0] ^ data_in[1];
assign xor_out[1] = xor_out[0] ^ data_in[2];
assign xor_out[2] = xor_out[1] ^ data_in[3];
assign xor_out[3] = xor_out[2] ^ data_in[4];

assign xor_tree_out[0] = xor_out[0] ^ xor_out[1];
assign xor_tree_out[1] = xor_out[2] ^ xor_out[3];
assign xor_tree_out[2] = xor_tree_out[0] ^ xor_tree_out[1];

assign parity = xor_tree_out[2];

endmodule
