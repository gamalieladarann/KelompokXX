module dev(
    input wire signed [19:0] SP_out, // Input from softplus module
    
    output wire signed [19:0] D_out // Output from dev module
);

    // Linear approximation parameters (y = Mx + C)

        // Region 0: 0             < SP_out ≤ 2^-15         ; M = 192 = 2^7 + 2^6       ; C = 20'sh00000
        // Region 1: 2^-15         < SP_out ≤ 2^-13 + 2^-14 ; M = 48  = 2^5 + 2^4       ; C = 20'sh000A7
        // Region 2: 2^-13 + 2^-14 < SP_out ≤ 2^-12 + 2^-14 ; M = 32  = 2^5             ; C = 20'sh00105
        // Region 3: 2^-12 + 2^-14 < SP_out ≤ 2^-11         ; M = 26  = 2^4 + 2^3 + 2^1 ; C = 20'sh00140
        // Region 4: 2^-11         < SP_out ≤ 2^-11 + 2^-12 ; M = 20  = 2^4 + 2^2       ; C = 20'sh001A0
        // Region 5: 2^-11 + 2^-12 < SP_out ≤ 2^-10 + 2^-12 ; M = 16  = 2^4             ; C = 20'sh00200
        // Region 6: 2^-10 + 2^-12 < SP_out ≤ 2^-9  + 2^-12 ; M = 12  = 2^3 + 2^2       ; C = 20'sh002A0
        // Region 7: 2^-9  + 2^-12 < SP_out < INF           ; M = 10  = 2^3 + 2^1       ; C = 20'sh00330 (accurate up to 0.003)
    
    assign D_out = (SP_out <= 20'sh00001) ? (SP_out << 7) + (SP_out << 6)                              : // Region 0
                   (SP_out <= 20'sh00006) ? (SP_out << 5) + (SP_out << 4) + 20'sh000A7                 : // Region 1
                   (SP_out <= 20'sh0000A) ? (SP_out << 5) + 20'sh00105                                 : // Region 2
                   (SP_out <= 20'sh00010) ? (SP_out << 4) + (SP_out << 3) + (SP_out << 1) + 20'sh00140 : // Region 3
                   (SP_out <= 20'sh00018) ? (SP_out << 4) + (SP_out << 2) + 20'sh001A0                 : // Region 4
                   (SP_out <= 20'sh00028) ? (SP_out << 4) + 20'sh00200                                 : // Region 5
                   (SP_out <= 20'sh00048) ? (SP_out << 3) + (SP_out << 2) + 20'sh002A0                 : // Region 6
                                            (SP_out << 3) + (SP_out << 1) + 20'sh00330;                  // Region 7

endmodule
