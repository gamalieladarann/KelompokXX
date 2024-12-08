module sigmoid(
    input wire signed [19:0] N2_out, // Input from output neuron (before activation)
    
    output wire signed [19:0] SIG_out
);

    // Linear approximation parameters (y = Mx + C)

        // Region 0: -INF   < N2_out < -5     ; M = 0              ; C = 20'sh00000 = 0
        // Region 1: -5     ≤ N2_out < -2.375 ; M = 0.03125 = 2^-5 ; C = 20'sh01400 = 0.15625
        // Region 2: -2.375 ≤ N2_out < -1     ; M = 0.125   = 2^-3 ; C = 20'sh03000 = 0.375
        // Region 3: -1     ≤ N2_out ≤  1     ; M = 0.25    = 2^-2 ; C = 20'sh04000 = 0.5
        // Region 4:  1     < N2_out ≤  2.375 ; M = 0.125   = 2^-3 ; C = 20'sh05000 = 0.625
        // Region 5:  2.375 < N2_out ≤  5     ; M = 0.03125 = 2^-5 ; C = 20'sh06C00 = 0.84375
        // Region 6:  5     < N2_out < INF    ; M = 0              ; C = 20'sh08000 = 1

    assign SIG_out =  (N2_out <  20'shD8000) ? 20'sh00000                  : // Region 0
                      (N2_out <  20'shED000) ? (N2_out >>> 5) + 20'sh01400 : // Region 1
                      (N2_out <  20'shF8000) ? (N2_out >>> 3) + 20'sh03000 : // Region 2
                      (N2_out <= 20'sh08000) ? (N2_out >>> 2) + 20'sh04000 : // Region 3
                      (N2_out <= 20'sh13000) ? (N2_out >>> 3) + 20'sh05000 : // Region 4
                      (N2_out <= 20'sh28000) ? (N2_out >>> 5) + 20'sh06C00 : // Region 5
                                               20'sh08000;                   // Region 6

endmodule
