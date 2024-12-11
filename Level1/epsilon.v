module epsilon(
    input wire clk,                   // Global clock
    input wire reset,                 // Reset signal to initialize epsilon
    input wire signed [19:0] D_out,   // Input from dev module

    output wire signed [19:0] E_out   // Output from epsilon module
);

    reg signed [19:0] epsilon; // Pseudorandomly-generated number
    wire feedback;

    assign feedback = epsilon[14] ^ !epsilon[9] ^ epsilon[5] ^ !epsilon[2] ^ epsilon[0] ^ !D_out[1] ^ D_out[4] ^ !D_out[8] ^ D_out[13];

    always @ (posedge clk or posedge reset)
    begin
        if (reset)
            epsilon <= 20'sh02E92; // Non-zero initial state for epsilon
        else
            epsilon <= {5'b0, epsilon[4:0], ~epsilon[14:13], feedback, ~epsilon[12:8], epsilon[6:5]};
    end

    wire signed [39:0] temp_mult;

    assign temp_mult = (D_out * epsilon) >>> 15;
    assign E_out = temp_mult[19:0];

endmodule