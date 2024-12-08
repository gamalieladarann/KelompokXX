module neuron_hidden(
    input signed wire [19:0] C_out, // Input from mean module
    input signed wire [19:0] D_out, // Input from dev module

    output signed wire [19:0] n1_out
);

    assign n1_out = C_out + D_out;

endmodule
