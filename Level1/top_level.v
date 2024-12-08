module top_level (
    input wire [8:0] X, // Input pixel, 9 bit
    output wire signed [19:0] outputs[8:0] // Output dari sigmoid
);
    // Output modul mean
    wire signed [19:0] C_out1, C_out2;
    // Output modul var
    wire signed [19:0] V_out1, V_out2;
    // Output softplus
    wire signed [19:0] S_out1, S_out2;
    // Output dev
    wire signed [19:0] D_out1, D_out2;
    // Output neuron hidden
    wire signed [19:0] N_hidden_out1, N_hidden_out2;
    // Output neuron output layer
    wire signed [19:0] N_out[8:0];
    // Output setelah sigmoid
    wire signed [19:0] sigmoid_out[8:0];

    // Konstanta Weight dan Bias untuk Mean dan Variance
    parameter signed [19:0] weight2mean[17:0] = {
        20'shFFFF3, 20'shFFFA5, 20'shFFFF3, 20'shFFFD9, 20'sh0004E, 
        20'shFFF8B, 20'shFE82E, 20'sh09BF7, 20'sh03109,
        20'shFFF91, 20'sh0007C, 20'shFFF98, 20'sh0006F, 20'shFFF49,
        20'sh00075, 20'sh03E90, 20'shFC35E, 20'sh050F2
    };
    parameter signed [19:0] bias2mean[1:0] = {
        20'shFA2D8, 20'shF9C13
    };

    parameter signed [19:0] weight2var[17:0] = {
        20'shF8A86, 20'shFEDA2, 20'shF9C05, 20'sh00951, 20'shFCB0C,
        20'shFB4E1, 20'shF6A9A, 20'shFD997, 20'shF49BB,
        20'shF719D, 20'sh00491, 20'shF650C, 20'shFFFF0, 20'shFDE49,
        20'shF97B5, 20'shFA8C5, 20'shFF92B, 20'shF4E4D
    };
    parameter signed [19:0] bias2var[1:0] = {
        20'shF011A, 20'shEE9EF
    };
    parameter signed [19:0] weight3_1[8:0] = {
        20'sh0A1C4; 20'sh2D0AB; 20'sh09DCB; 20'sh2CAC8; 20'shD656D;
        20'sh2D5EF; 20'sh0A82D; 20'sh2CE81; 20'sh096AE
    };
    parameter signed [19:0] weight3_2[8:0] = {
        20'sh165EE; 20'shF1FBB; 20'sh15212; 20'shF12E7; 20'sh15EA0;
        20'shF2E17; 20'sh171F5; 20'shF197E; 20'sh14663
    };
    parameter signed [19:0] bias3[8:0] = {
        20'sh21DD0, 20'shFDA10, 20'sh222D7, 20'shFDCBE, 20'sh00CBD,
        20'shFD764, 20'sh21ADF, 20'shFDB31, 20'sh225A6
    };

    // Mean module instances
    mean mean1 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wm_0(weight2mean[0]), .Wm_1(weight2mean[1]), .Wm_2(weight2mean[2]),
        .Wm_3(weight2mean[3]), .Wm_4(weight2mean[4]), .Wm_5(weight2mean[5]),
        .Wm_6(weight2mean[6]), .Wm_7(weight2mean[7]), .Wm_8(weight2mean[8]),
        .B_mean(bias2mean[0]),
        .C_out(C_out1)
    );

    mean mean2 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wm_0(weight2mean[9]), .Wm_1(weight2mean[10]), .Wm_2(weight2mean[11]),
        .Wm_3(weight2mean[12]), .Wm_4(weight2mean[13]), .Wm_5(weight2mean[14]),
        .Wm_6(weight2mean[15]), .Wm_7(weight2mean[16]), .Wm_8(weight2mean[17]),
        .B_mean(bias2mean[1]),
        .C_out(C_out2)
    );

    // Variance module instances
    var var1 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wv_0(weight2var[0]), .Wv_1(weight2var[1]), .Wv_2(weight2var[2]),
        .Wv_3(weight2var[3]), .Wv_4(weight2var[4]), .Wv_5(weight2var[5]),
        .Wv_6(weight2var[6]), .Wv_7(weight2var[7]), .Wv_8(weight2var[8]),
        .B_var(bias2var[0]),
        .V_out(V_out1)
    );

    var var2 (
        .X_0(X[0]), .X_1(X[1]), .X_2(X[2]), .X_3(X[3]), .X_4(X[4]), 
        .X_5(X[5]), .X_6(X[6]), .X_7(X[7]), .X_8(X[8]),
        .Wv_0(weight2var[9]), .Wv_1(weight2var[10]), .Wv_2(weight2var[11]),
        .Wv_3(weight2var[12]), .Wv_4(weight2var[13]), .Wv_5(weight2var[14]),
        .Wv_6(weight2var[15]), .Wv_7(weight2var[16]), .Wv_8(weight2var[17]),
        .B_var(bias2var[1]),
        .V_out(V_out2)
    );

    // Softplus instances
    softplus sp1 (
        .x_in(V_out1),
        .y_out(S_out1)
    );

    softplus sp2 (
        .x_in(V_out2),
        .y_out(S_out2)
    );

    // Dev instances
    dev dev1 (
        .V_out(S_out1),
        .D_out(D_out1)
    );

    dev dev2 (
        .V_out(S_out2),
        .D_out(D_out2)
    );

    // Reparameterization trick (hidden neuron)
    neuron_hidden hidden1 (
        .mean(C_out1),
        .softplus(D_out1),
        .epsilon(epsilon),
        .a2(N_hidden_out1)
    );

    neuron_hidden hidden2 (
        .mean(C_out2),
        .softplus(D_out2),
        .epsilon(epsilon),
        .a2(N_hidden_out2)
    );


    // Output neuron instances
    genvar i;
    generate
        for (i = 0; i < 9; i = i + 1) begin : output_loop
            neuron_out n_out (
                .a2_1(N_hidden_out1),
                .a2_2(N_hidden_out2),
                .weight3_1(weight3_1[i]), 
                .weight3_2(weight3_2[i]), 
                .bias3(bias3[i]),
                .z3(N_out[i])
            );

            // Sigmoid Activation
            sigmoid sig (
                .in(N_out[i]),
                .out(sigmoid_out[i])
            );

            // Assign final output
            assign outputs[i] = sigmoid_out[i];
        end
    endgenerate
endmodule
