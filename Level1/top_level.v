`include "mean.v"
`include "var.v"
`include "dev.v"
`include "sigmoid.v"
`include "softplus.v"
`include "neuron_hidden.v"
`include "neuron_out.v"

module top_level (
    input [8:0] X, // Input pixel, 9 bit
    output signed [19:0] output_0, // Output sigmoid 0
    output signed [19:0] output_1, // Output sigmoid 1
    output signed [19:0] output_2, // Output sigmoid 2
    output signed [19:0] output_3, // Output sigmoid 3
    output signed [19:0] output_4, // Output sigmoid 4
    output signed [19:0] output_5, // Output sigmoid 5
    output signed [19:0] output_6, // Output sigmoid 6
    output signed [19:0] output_7, // Output sigmoid 7
    output signed [19:0] output_8  // Output sigmoid 8
);
    // Parameter untuk Weight dan Bias Mean
    parameter signed [19:0] Wm_0 = 20'shFFFF3, Wm_1 = 20'shFFFA5, Wm_2 = 20'shFFFF3;
    parameter signed [19:0] Wm_3 = 20'shFFFD9, Wm_4 = 20'sh0004E, Wm_5 = 20'shFFF8B;
    parameter signed [19:0] Wm_6 = 20'shFE82E, Wm_7 = 20'sh09BF7, Wm_8 = 20'sh03109;
    parameter signed [19:0] Wm_9 = 20'shFFF91, Wm_10 = 20'sh0007C, Wm_11 = 20'shFFF98;
    parameter signed [19:0] Wm_12 = 20'sh0006F, Wm_13 = 20'shFFF49, Wm_14 = 20'sh00075;
    parameter signed [19:0] Wm_15 = 20'sh03E90, Wm_16 = 20'shFC35E, Wm_17 = 20'sh050F2;

    parameter signed [19:0] Bm_0 = 20'shFA2D8;
    parameter signed [19:0] Bm_1 = 20'shF9C13;

    // Parameter untuk Weight dan Bias Variance
    parameter signed [19:0] Wv_0 = 20'shF8A86, Wv_1 = 20'shFEDA2, Wv_2 = 20'shF9C05;
    parameter signed [19:0] Wv_3 = 20'sh00951, Wv_4 = 20'shFCB0C, Wv_5 = 20'shFB4E1;
    parameter signed [19:0] Wv_6 = 20'shF6A9A, Wv_7 = 20'shFD997, Wv_8 = 20'shF49BB;
    parameter signed [19:0] Wv_9 = 20'shF719D, Wv_10 = 20'sh00491, Wv_11 = 20'shF650C;
    parameter signed [19:0] Wv_12 = 20'shFFFF0, Wv_13 = 20'shFDE49, Wv_14 = 20'shF97B5;
    parameter signed [19:0] Wv_15 = 20'shFA8C5, Wv_16 = 20'shFF92B, Wv_17 = 20'shF4E4D;

    parameter signed [19:0] Bv_0 = 20'shF011A;
    parameter signed [19:0] Bv_1 = 20'shEE9EF;

    // Parameter untuk Weight dan Bias Output Neuron
    parameter signed [19:0] Wn1_0 = 20'sh0A1C4, Wn1_1 = 20'sh2D0AB, Wn1_2 = 20'sh09DCB;
    parameter signed [19:0] Wn1_3 = 20'sh2CAC8, Wn1_4 = 20'shD656D, Wn1_5 = 20'sh2D5EF;
    parameter signed [19:0] Wn1_6 = 20'sh0A82D, Wn1_7 = 20'sh2CE81, Wn1_8 = 20'sh096AE;

    parameter signed [19:0] Wn2_0 = 20'sh165EE, Wn2_1 = 20'shF1FBB, Wn2_2 = 20'sh15212;
    parameter signed [19:0] Wn2_3 = 20'shF12E7, Wn2_4 = 20'sh15EA0, Wn2_5 = 20'shF2E17;
    parameter signed [19:0] Wn2_6 = 20'sh171F5, Wn2_7 = 20'shF197E, Wn2_8 = 20'sh14663;

    parameter signed [19:0] Bn_0 = 20'sh21DD0, Bn_1 = 20'shFDA10, Bn_2 = 20'sh222D7;
    parameter signed [19:0] Bn_3 = 20'shFDCBE, Bn_4 = 20'sh00CBD, Bn_5 = 20'shFD764;
    parameter signed [19:0] Bn_6 = 20'sh21ADF, Bn_7 = 20'shFDB31, Bn_8 = 20'sh225A6;
    // Output modul mean
    wire signed [19:0] C_out1, C_out2;
    // Output modul var
    wire signed [19:0] V_out1, V_out2;
    // Output softplus
    wire signed [19:0] S_out1, S_out2;
    // Output dev
    wire signed [19:0] D_out1, D_out2;
    // Output neuron hidden
    wire signed [19:0] N1_out1, N1_out2;
   // Output neuron dan sigmoid
    wire signed [19:0] N2_out_0, N2_out_1, N2_out_2, N2_out_3, N2_out_4;
    wire signed [19:0] N2_out_5, N2_out_6, N2_out_7, N2_out_8;
    wire signed [19:0] sigmoid_out_0, sigmoid_out_1, sigmoid_out_2, sigmoid_out_3;
    wire signed [19:0] sigmoid_out_4, sigmoid_out_5, sigmoid_out_6, sigmoid_out_7, sigmoid_out_8;


    // Modul Mean
    mean mean1 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wm_0(Wm_0), .Wm_1(Wm_1), .Wm_2(Wm_2),
        .Wm_3(Wm_3), .Wm_4(Wm_4), .Wm_5(Wm_5),
        .Wm_6(Wm_6), .Wm_7(Wm_7), .Wm_8(Wm_8),
        .B_mean(Bm_0),
        .C_out(C_out1)
    );

    mean mean2 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wm_0(Wm_9), .Wm_1(Wm_10), .Wm_2(Wm_11),
        .Wm_3(Wm_12), .Wm_4(Wm_13), .Wm_5(Wm_14),
        .Wm_6(Wm_15), .Wm_7(Wm_16), .Wm_8(Wm_17),
        .B_mean(Bm_1),
        .C_out(C_out2)
    );

    // Modul Variance
    var var1 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wv_0(Wv_0), .Wv_1(Wv_1), .Wv_2(Wv_2),
        .Wv_3(Wv_3), .Wv_4(Wv_4), .Wv_5(Wv_5),
        .Wv_6(Wv_6), .Wv_7(Wv_7), .Wv_8(Wv_8),
        .B_var(Bv_0),
        .V_out(V_out1)
    );

    var var2 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wv_0(Wv_9), .Wv_1(Wv_10), .Wv_2(Wv_11),
        .Wv_3(Wv_12), .Wv_4(Wv_13), .Wv_5(Wv_14),
        .Wv_6(Wv_15), .Wv_7(Wv_16), .Wv_8(Wv_17),
        .B_var(Bv_1),
        .V_out(V_out2)
    );

    // Modul Softplus
    softplus sp1 (.x_in(C_out1), .y_out(S_out1));
    softplus sp2 (.x_in(C_out2), .y_out(S_out2));

    // Modul Dev
    dev dev1 (.SP_out(S_out1), .D_out(D_out1));
    dev dev2 (.SP_out(S_out2), .D_out(D_out2));

    // Modul Hidden Neuron
    neuron_hidden hidden1 (
        .C_out(C_out1),
        .D_out(D_out1),
        .N1_out(N1_out1)
    );

    neuron_hidden hidden2 (
        .C_out(C_out2),
        .D_out(D_out2),
        .N1_out(N1_out2)
    );

    // Modul Output Neuron
    neuron_out n_out0 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_0), .Wn_2(Wn2_0), .B_neuron(Bn_0), .N2_out(N2_out_0));
    neuron_out n_out1 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_1), .Wn_2(Wn2_1), .B_neuron(Bn_1), .N2_out(N2_out_1));
    neuron_out n_out2 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_2), .Wn_2(Wn2_2), .B_neuron(Bn_2), .N2_out(N2_out_2));
    neuron_out n_out3 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_3), .Wn_2(Wn2_3), .B_neuron(Bn_3), .N2_out(N2_out_3));
    neuron_out n_out4 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_4), .Wn_2(Wn2_4), .B_neuron(Bn_4), .N2_out(N2_out_4));
    neuron_out n_out5 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_5), .Wn_2(Wn2_5), .B_neuron(Bn_5), .N2_out(N2_out_5));
    neuron_out n_out6 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_6), .Wn_2(Wn2_6), .B_neuron(Bn_6), .N2_out(N2_out_6));
    neuron_out n_out7 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_7), .Wn_2(Wn2_7), .B_neuron(Bn_7), .N2_out(N2_out_7));
    neuron_out n_out8 (.N1_1(N1_out1), .N1_2(N1_out2), .Wn_1(Wn1_8), .Wn_2(Wn2_8), .B_neuron(Bn_8), .N2_out(N2_out_8));

    // Modul Sigmoid Activation
    sigmoid sig0 (.x_in(N2_out_0), .y_out(sigmoid_out_0));
    sigmoid sig1 (.x_in(N2_out_1), .y_out(sigmoid_out_1));
    sigmoid sig2 (.x_in(N2_out_2), .y_out(sigmoid_out_2));
    sigmoid sig3 (.x_in(N2_out_3), .y_out(sigmoid_out_3));
    sigmoid sig4 (.x_in(N2_out_4), .y_out(sigmoid_out_4));
    sigmoid sig5 (.x_in(N2_out_5), .y_out(sigmoid_out_5));
    sigmoid sig6 (.x_in(N2_out_6), .y_out(sigmoid_out_6));
    sigmoid sig7 (.x_in(N2_out_7), .y_out(sigmoid_out_7));
    sigmoid sig8 (.x_in(N2_out_8), .y_out(sigmoid_out_8));

    // Assign output
    assign output_0 = sigmoid_out_0;
    assign output_1 = sigmoid_out_1;
    assign output_2 = sigmoid_out_2;
    assign output_3 = sigmoid_out_3;
    assign output_4 = sigmoid_out_4;
    assign output_5 = sigmoid_out_5;
    assign output_6 = sigmoid_out_6;
    assign output_7 = sigmoid_out_7;
    assign output_8 = sigmoid_out_8;

endmodule
