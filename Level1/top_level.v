`include "mean.v"
`include "var.v"
`include "epsilon.v"
`include "neuron_hidden.v"
`include "neuron_out.v"

module top_level(
    input wire x1,
    input wire x2,
    input wire x3,
    input wire x4,
    input wire x5,
    input wire x6,
    input wire x7,
    input wire x8,
    input wire x9,

    output wire y1,
    output wire y2,
    output wire y3,
    output wire y4,
    output wire y5,
    output wire y6,
    output wire y7,
    output wire y8,
    output wire y9
);

    mean mean1();
    var var1();
    epsilon epsilon1();

    mean mean2();
    var var2();
    epsilon epsilon2();

    neuron_hidden neuron_hidden();

    neuron_out neuron_out();

endmodule