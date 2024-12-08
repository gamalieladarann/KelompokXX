module neuron_out(
    input wire signed [19:0] N1_1, N1_2, // Inputs from both hidden neurons
    input wire signed [19:0] Wn_1, Wn_2, // Corresponding weights for each input
    input wire signed [19:0] B_neuron, // Bias for output neuron

    output wire signed [19:0] N2_out
);
 
    wire signed [39:0] temp_mult1, temp_mult2;
    
    assign temp_mult1 = (N1_1 * Wn_1) >>> 15;
    assign temp_mult2 = (N1_2 * Wn_2) >>> 15;
    
    assign N2_out = temp_mult1[19:0] + temp_mult2[19:0] + B_neuron;

endmodule
