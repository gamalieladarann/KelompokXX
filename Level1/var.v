module var(
    input wire X_0, X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, // Input from individual pixels, either 0 or 1
    input wire signed [19:0] Wv_0, Wv_1, Wv_2, Wv_3, Wv_4, Wv_5, Wv_6, Wv_7, Wv_8, // Variance weights for each corresponding input, defined in top_level module
    input wire signed [19:0] B_var, // Bias for var module, defined in top_level module

    output wire signed [19:0] V_out // Output from var module
);

    assign V_out = ((X_0) ? Wv_0 : 0) + // Simple conditional check whether each pixel is 1 or 0
                   ((X_1) ? Wv_1 : 0) +
                   ((X_2) ? Wv_2 : 0) +
                   ((X_3) ? Wv_3 : 0) +
                   ((X_4) ? Wv_4 : 0) +
                   ((X_5) ? Wv_5 : 0) +
                   ((X_6) ? Wv_6 : 0) +
                   ((X_7) ? Wv_7 : 0) +
                   ((X_8) ? Wv_8 : 0) + B_var;

endmodule
