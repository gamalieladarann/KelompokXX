`include "mean.v"
`include "var.v"
`include "softplus.v"
`include "dev.v"
`include "neuron_hidden.v"
`include "neuron_out.v"
`include "sigmoid.v"

module top_level(
    input wire [8:0] X,
    
    output wire signed [19:0] Y_0, Y_1, Y_2, Y_3, Y_4, Y_5, Y_6, Y_7, Y_8
);

    // Layer 1
        // Neuron 1

        wire signed [19:0] C0_out;
        wire signed [19:0] V0_out;
        wire signed [19:0] SP0_out;
        wire signed [19:0] D0_out;
        wire signed [19:0] N10_out;

        mean C0(
            .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
            .Wm_0(20'shFFFF3), .Wm_1(20'shFFFA5), .Wm_2(20'shFFFF3), .Wm_3(20'shFFFD9), .Wm_4(20'sh0004E), .Wm_5(20'shFFF8B), .Wm_6(20'shFE82E), .Wm_7(20'sh09BF7), .Wm_8(20'sh03109),
            .B_mean(20'shFA2D8),

            .C_out(C0_out)
        );

        var V0(
            .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
            .Wv_0(20'shF8A86), .Wv_1(20'shFEDA2), .Wv_2(20'shF9C05), .Wv_3(20'sh00951), .Wv_4(20'shFCB0C), .Wv_5(20'shFB4E1), .Wv_6(20'shF6A9A), .Wv_7(20'shFD997), .Wv_8(20'shF49BB),
            .B_var(20'shF011A),

            .V_out(V0_out)
        );

        softplus SP0(
            .V_out(V0_out),
            .SP_out(SP0_out)
        );

        dev D0(
            .SP_out(SP0_out),
            .D_out(D0_out)
        );

        neuron_hidden N10(
            .C_out(C0_out),
            .D_out(D0_out),

            .N1_out(N10_out)
        );

        // Neuron 2

        wire signed [19:0] C1_out;
        wire signed [19:0] V1_out;
        wire signed [19:0] SP1_out;
        wire signed [19:0] D1_out;
        wire signed [19:0] N11_out;

        mean C1(
            .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
            .Wm_0(20'shFFF91), .Wm_1(20'sh0007C), .Wm_2(20'shFFF98), .Wm_3(20'sh0006F), .Wm_4(20'shFFF49), .Wm_5(20'sh00075), .Wm_6(20'sh03E90), .Wm_7(20'shFC35E), .Wm_8(20'sh050F2),
            .B_mean(20'shF9C13),

            .C_out(C1_out)
        );

        var V1(
            .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
            .Wv_0(20'shF719D), .Wv_1(20'sh00491), .Wv_2(20'shF650C), .Wv_3(20'shFFFF0), .Wv_4(20'shFDE49), .Wv_5(20'shF97B5), .Wv_6(20'shFA8C5), .Wv_7(20'shFF92B), .Wv_8(20'shF4E4D),
            .B_var(20'shEE9EF),

            .V_out(V1_out)
        );

        softplus SP1(
            .V_out(V1_out),
            .SP_out(SP1_out)
        );

        dev D1(
            .SP_out(SP1_out),
            .D_out(D1_out)
        );

        neuron_hidden N11(
            .C_out(C1_out),
            .D_out(D1_out),

            .N1_out(N11_out)
        );
    
    // Layer 2
        // Neuron stage

        wire signed [19:0] N20_out, N21_out, N22_out, N23_out, N24_out, N25_out, N26_out, N27_out, N28_out;

        neuron_out N20(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh0A1C4), .Wn_2(20'sh165EE),
            .B_neuron(20'sh21DD0),

            .N2_out(N20_out)
        );

        neuron_out N21(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh2D0AB), .Wn_2(20'shF1FBB),
            .B_neuron(20'shFDA10),

            .N2_out(N21_out)
        );

        neuron_out N22(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh09DCB), .Wn_2(20'sh15212),
            .B_neuron(20'sh222D7),

            .N2_out(N22_out)
        );

        neuron_out N23(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh2CAC8), .Wn_2(20'shF12E7),
            .B_neuron(20'shFDCBE),

            .N2_out(N23_out)
        );

        neuron_out N24(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'shD656D), .Wn_2(20'sh15EA0),
            .B_neuron(20'sh00CBD),

            .N2_out(N24_out)
        );

        neuron_out N25(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh2D5EF), .Wn_2(20'shF2E17),
            .B_neuron(20'shFD764),

            .N2_out(N25_out)
        );

        neuron_out N26(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh0A82D), .Wn_2(20'sh171F5),
            .B_neuron(20'sh21ADF),

            .N2_out(N26_out)
        );

        neuron_out N27(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh2CE81), .Wn_2(20'shF197E),
            .B_neuron(20'shFDB31),

            .N2_out(N27_out)
        );

        neuron_out N28(
            .N1_1(N10_out), .N1_2(N11_out),
            .Wn_1(20'sh096AE), .Wn_2(20'sh14663),
            .B_neuron(20'sh225A6),

            .N2_out(N28_out)
        );

        // Sigmoid stage

        sigmoid SIG0(
            .N2_out(N20_out),
            .SIG_out(Y_0)
        );

        sigmoid SIG1(
            .N2_out(N21_out),
            .SIG_out(Y_1)
        );

        sigmoid SIG2(
            .N2_out(N22_out),
            .SIG_out(Y_2)
        );

        sigmoid SIG3(
            .N2_out(N23_out),
            .SIG_out(Y_3)
        );

        sigmoid SIG4(
            .N2_out(N24_out),
            .SIG_out(Y_4)
        );

        sigmoid SIG5(
            .N2_out(N25_out),
            .SIG_out(Y_5)
        );

        sigmoid SIG6(
            .N2_out(N26_out),
            .SIG_out(Y_6)
        );

        sigmoid SIG7(
            .N2_out(N27_out),
            .SIG_out(Y_7)
        );

        sigmoid SIG8(
            .N2_out(N28_out),
            .SIG_out(Y_8)
        );

endmodule
