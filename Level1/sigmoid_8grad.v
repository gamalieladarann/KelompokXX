module sigmoid_8grad(
    input wire signed [19:0] x_in, // 1 sign bit, 4 decimal bits, 15 fraction bits
    
    output wire signed [19:0] y_out
);

    // Linear approximation parameters (y = Mx + C)

        // Region 0: -INF   < x_in < -5     ; M = 0              ; C = 20'sh00000 = 0
        // Region 1: -5     ≤ x_in < -2.375 ; M = 0.03125 = 2^-5 ; C = 20'sh01400 = 0.15625
        // Region 2: -2.375 ≤ x_in < -1     ; M = 0.125   = 2^-3 ; C = 20'sh03000 = 0.375
        // Region 3: -1     ≤ x_in ≤  1     ; M = 0.25    = 2^-2 ; C = 20'sh04000 = 0.5
        // Region 4:  1     < x_in ≤  2.375 ; M = 0.125   = 2^-3 ; C = 20'sh05000 = 0.625
        // Region 5:  2.375 < x_in ≤  5     ; M = 0.03125 = 2^-5 ; C = 20'sh06C00 = 0.84375
        // Region 6:  5     < x_in < INF    ; M = 0              ; C = 20'sh08000 = 1

    assign y_out =  (x_in <  20'shD8000) ? 20'sh00000                : // Region 0
                    (x_in <  20'shED000) ? (x_in >>> 5) + 20'sh01400 : // Region 1
                    (x_in <  20'shF8000) ? (x_in >>> 3) + 20'sh03000 : // Region 2
                    (x_in <= 20'sh08000) ? (x_in >>> 2) + 20'sh04000 : // Region 3
                    (x_in <= 20'sh13000) ? (x_in >>> 3) + 20'sh05000 : // Region 4
                    (x_in <= 20'sh28000) ? (x_in >>> 5) + 20'sh06C00 : // Region 5
                                           20'sh08000;                 // Region 6

endmodule