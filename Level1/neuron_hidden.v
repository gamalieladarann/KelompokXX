module neuron_hidden(
    input wire [19:0] mean,    // Mean pertama
    input wire [19:0] epsilon,    // Noise pertama
    input wire [19:0] softplus,

    output wire [19:0] a2,    // Latent variable pertama
);
    // Reparameterization trick: a2 = mean + (softplus * epsilon)
    assign a2 = mean + (softplus * epsilon);
endmodule
