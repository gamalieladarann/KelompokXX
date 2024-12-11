`include "epsilon.v"

module epsilon_tb;

    reg CLOCK, RESET;
    reg signed [19:0] INPUT;

    wire signed [19:0] OUTPUT;

    epsilon G0(
        .clk(CLOCK),
        .reset(RESET),
        .D_out(INPUT),

        .E_out(OUTPUT)
    );

    initial begin
        $dumpfile("epsilon_tb.vcd");
        $dumpvars(0, epsilon_tb);

        CLOCK = 1;
        RESET = 1;

        INPUT = $urandom_range(0, 524287);

        #7;

        CLOCK = !CLOCK;

        #7;

        CLOCK = !CLOCK;
        RESET = 0;
        
        INPUT = $urandom_range(0, 524287);

        #7;

        repeat(1000)
        begin
            CLOCK = !CLOCK;

            #7;

            CLOCK = !CLOCK;
            
            INPUT = $urandom_range(0, 524287);

            #7;
        end
    end

endmodule