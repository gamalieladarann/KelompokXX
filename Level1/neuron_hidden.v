`include "mean.v"      // Modul untuk menghitung mean
`include "var.v"       // Modul untuk menghitung variance (softplus)
`include "epsilon.v"   // Modul untuk menghasilkan noise epsilon

module neuron_hidden(
    input wire [19:0] mean1,    // Mean pertama
    input wire [19:0] var1,     // Variance pertama
    input wire [19:0] epsilon1, // Noise pertama
    input wire [19:0] mean2,    // Mean kedua
    input wire [19:0] var2,     // Variance kedua
    input wire [19:0] epsilon2, // Noise kedua

    output wire [19:0] a2_1,    // Latent variable pertama
    output wire [19:0] a2_2     // Latent variable kedua
);

    // Internal wire untuk variance setelah softplus
    wire [19:0] softplus_var1;
    wire [19:0] softplus_var2;

    // Modul untuk menghitung variance dengan fungsi softplus
    var softplus_calc1 (
        .var_in(var1),
        .var_out(softplus_var1)
    );

    var softplus_calc2 (
        .var_in(var2),
        .var_out(softplus_var2)
    );

    // Reparameterization trick: a2 = mean + sqrt(variance) * epsilon
    assign a2_1 = mean1 + ($sqrt(softplus_var1) * epsilon1);
    assign a2_2 = mean2 + ($sqrt(softplus_var2) * epsilon2);

endmodule
