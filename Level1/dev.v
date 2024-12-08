module dev(
    input wire signed [19:0] SP_out, // Input from softplus module
    output reg signed [19:0] D_out // Output from dev module
);

    reg [19:0] epsilon;
    reg [39:0] temp_mult;

    reg [39:0] scaled_SP;
    reg [19:0] min, max, mid;
    reg [39:0] mid_squared;

    always @ (*)
    begin
        epsilon = $urandom_range(0, 32767); // Generate a random unsigned number from 0 to 32767 (2^15 - 1)

        if (SP_out[19] == 1)
            D_out = 20'd0; // Return 0 for negative input
        
        else
        begin
            scaled_SP = SP_out << 15; // Shift left by 15 bits to create input with 30 fraction bits instead of 15

            min = 0;
            max = 20'shFFFFF; // Initialize max based on scaled value

            while (min < max)
            begin
                mid = (min + max) >> 1; // Average between min and max
                mid_squared = mid * mid;

                if (mid_squared == scaled_SP)
                begin
                    min = mid;
                    max = mid;
                end

                else if (mid_squared < scaled_SP)
                    min = mid + 1;
                
                else
                    max = mid - 1;
            end

            temp_mult = (min * epsilon) >>> 15;
            D_out = temp_mult[19:0];
        end
    end

endmodule
