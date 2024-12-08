`include "neuron_out.v"

module neuron_out_tb();

    // wire signed [19:0] tes_weight311;
    // wire signed [19:0] tes_weight321;
    // wire signed [19:0] tes_weight331;
    // wire signed [19:0] tes_weight341;
    // wire signed [19:0] tes_weight351;
    // wire signed [19:0] tes_weight361;
    // wire signed [19:0] tes_weight371;
    // wire signed [19:0] tes_weight381;
    // wire signed [19:0] tes_weight391;

    // wire signed [19:0] tes_weight312;
    // wire signed [19:0] tes_weight322;
    // wire signed [19:0] tes_weight332;
    // wire signed [19:0] tes_weight342;
    // wire signed [19:0] tes_weight352;
    // wire signed [19:0] tes_weight362;
    // wire signed [19:0] tes_weight372;
    // wire signed [19:0] tes_weight382;
    // wire signed [19:0] tes_weight392;

    // wire signed [19:0] tes_bias1;
    // wire signed [19:0] tes_bias2;
    // wire signed [19:0] tes_bias3;
    // wire signed [19:0] tes_bias4;
    // wire signed [19:0] tes_bias5;
    // wire signed [19:0] tes_bias6;
    // wire signed [19:0] tes_bias7;
    // wire signed [19:0] tes_bias8;
    // wire signed [19:0] tes_bias9;

    // wire signed [19:0] tes_mult;

    reg signed [19:0] a2_1;
    reg signed [19:0] a2_2;

    wire signed [19:0] a3_1;
    wire signed [19:0] a3_2;
    wire signed [19:0] a3_3;
    wire signed [19:0] a3_4;
    wire signed [19:0] a3_5;
    wire signed [19:0] a3_6;
    wire signed [19:0] a3_7;
    wire signed [19:0] a3_8;
    wire signed [19:0] a3_9;


    neuron_out dut(
        .a2_1(a2_1),
        .a2_2(a2_2),

        .a3_1(a3_1),
        .a3_2(a3_2),
        .a3_3(a3_3),
        .a3_4(a3_4),
        .a3_5(a3_5),
        .a3_6(a3_6),
        .a3_7(a3_7),
        .a3_8(a3_8),
        .a3_9(a3_9)

        // .tes_weight311(tes_weight311),
        // .tes_weight321(tes_weight321),
        // .tes_weight331(tes_weight331),
        // .tes_weight341(tes_weight341),
        // .tes_weight351(tes_weight351),
        // .tes_weight361(tes_weight361),
        // .tes_weight371(tes_weight371),
        // .tes_weight381(tes_weight381),
        // .tes_weight391(tes_weight391),

        // .tes_weight312(tes_weight312),
        // .tes_weight322(tes_weight322),
        // .tes_weight332(tes_weight332),
        // .tes_weight342(tes_weight342),
        // .tes_weight352(tes_weight352),
        // .tes_weight362(tes_weight362),
        // .tes_weight372(tes_weight372),
        // .tes_weight382(tes_weight382),
        // .tes_weight392(tes_weight392),

        // .tes_bias1(tes_bias1),
        // .tes_bias2(tes_bias2),
        // .tes_bias3(tes_bias3),
        // .tes_bias4(tes_bias4),
        // .tes_bias5(tes_bias5),
        // .tes_bias6(tes_bias6),
        // .tes_bias7(tes_bias7),
        // .tes_bias8(tes_bias8),
        // .tes_bias9(tes_bias9),

        // .tes_mult(tes_mult)
    );

    initial begin
        $dumpfile("neuron_out_tb.vcd");
        $dumpvars(0, neuron_out_tb);

        a2_1 = 20'sh05AF4;
        a2_2 = 20'shFED26;
        #10;    
        
        $finish;
    end

endmodule