`include "top_level.v"

module top_level_tb;

    reg CLOCK, RESET;
    reg [8:0] X;

    wire signed [19:0] Y_0, Y_1, Y_2, Y_3, Y_4, Y_5, Y_6, Y_7, Y_8;

    top_level G0(
        .clk(CLOCK),
        .reset(RESET),
        .X(X),

        .Y_0(Y_0),
        .Y_1(Y_1),
        .Y_2(Y_2),
        .Y_3(Y_3),
        .Y_4(Y_4),
        .Y_5(Y_5),
        .Y_6(Y_6),
        .Y_7(Y_7),
        .Y_8(Y_8)
    );

    initial begin
        $dumpfile("top_level_tb.vcd");
        $dumpvars(0, top_level_tb);

        X = 9'b000000000;
        RESET = 1;
        CLOCK = 1;
        #7;

        CLOCK = !CLOCK;
        #7;

        RESET = 0;

        CLOCK = !CLOCK;
        X = 9'b111101111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b011101111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b101101111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b110101111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b111001111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b011111111;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b111100111;
        #7;
        CLOCK = !CLOCK;
        #7;

        CLOCK = !CLOCK;
        X = 9'b101010101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b001010101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b111010101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b100010101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b101110101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b101000101;
        #7;
        CLOCK = !CLOCK;
        #7;
        CLOCK = !CLOCK;
        X = 9'b101011101;
        #7;
        CLOCK = !CLOCK;
        #7;
    end

endmodule
