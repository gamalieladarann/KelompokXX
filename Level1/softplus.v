module softplus(
    input wire signed [19:0] V_out, // Input from var module

    output wire signed [19:0] SP_out
);

    // Linear approximation parameters (y = Mx + C)

        // Region 0: -INF  < V_out ≤ -3    ; M = 0                   ; C = 20'sh00000 = 0
        // Region 1: -3    < V_out ≤ -1.5  ; M = 0.125 = 2^-3        ; C = 20'sh03000 = 0.375
        // Region 2: -1.5  < V_out ≤ -0.5  ; M = 0.25  = 2^-2        ; C = 20'sh04800 = 0.5625
        // Region 3: -0.5  < V_out ≤  0.5  ; M = 0.5   = 2^-1        ; C = 20'sh05800 = 0.6875
        // Region 4:  0.5  < V_out ≤  0.75 ; M = 0.625 = 2^-1 + 2^-3 ; C = 20'sh05000 = 0.625
        // Region 5:  0.75 < V_out ≤  1.5  ; M = 0.75  = 2^-1 + 2^-2 ; C = 20'sh04400 = 0.53125
        // Region 6:  1.5  < V_out ≤  2.75 ; M = 0.875 = 2^0  - 2^-3 ; C = 20'sh02C00 = 0.34375
        // Region 7:  2.75 < V_out <  INF  ; M = 1                   ; C = 20'sh00000 = 0

    assign SP_out = (V_out <= 20'shE8000) ? 20'sh00000                                 : // Region 0
                    (V_out <= 20'shF4000) ? (V_out >>> 3) + 20'sh03000                 : // Region 1
                    (V_out <= 20'shFC000) ? (V_out >>> 2) + 20'sh04800                 : // Region 2
                    (V_out <= 20'sh04000) ? (V_out >>> 1) + 20'sh05800                 : // Region 3
                    (V_out <= 20'sh06000) ? (V_out >>> 1) + (V_out >>> 3) + 20'sh05000 : // Region 4
                    (V_out <= 20'sh0C000) ? (V_out >>> 1) + (V_out >>> 2) + 20'sh04400 : // Region 5
                    (V_out <= 20'sh16000) ? V_out         - (V_out >>> 3) + 20'sh02C00 : // Region 6
                                            V_out;                                       // Region 7

endmodule
