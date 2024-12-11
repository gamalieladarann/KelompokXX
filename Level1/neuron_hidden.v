module neuron_hidden(
    input wire signed [19:0] C_out, // Input from mean module
    input wire signed [19:0] E_out, // Input from epsilon module

    output wire signed [19:0] N1_out
);

    assign N1_out = C_out + E_out;

endmodule
