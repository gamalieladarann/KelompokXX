module neuron_out(
    // Sinyal input dari hidden layer
    input wire signed [19:0] a2_1, a2_2,

    // Weight dan bias
    input wire signed [19:0] weight3_1, weight3_2,

    input wire signed [19:0] bias3,

    // Sinyal output
    output wire signed [19:0] z3
);

    // Intermediate variabel untuk menampung perhitungan 
    wire signed [39:0] z3_1; wire signed [39:0] z3_2;
    
    // Perkalian masing-masing input dan weight yang bersesuaian
    assign z3_1 = (weight3_1 * a2_1) >>> 15; assign z3_2 = (weight3_2 * a2_2) >>> 15;
    
    // Sinyal output
    assign z3 = z3_1[19:0] + z3_2[19:0] + bias3;

endmodule
