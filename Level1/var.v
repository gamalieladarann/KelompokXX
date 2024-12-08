module var(
    input wire X_0, X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, // Input from individual pixels, either 0 or 1
    input wire signed [19:0] Wv_0, Wv_1, Wv_2, Wv_3, Wv_4, Wv_5, Wv_6, Wv_7, Wv_8, // Variance weights for each corresponding input, defined in top_level module
    input wire signed [19:0] B_var, // Bias for var module, defined in top_level module

    output wire signed [19:0] D_out // Output from var module
);