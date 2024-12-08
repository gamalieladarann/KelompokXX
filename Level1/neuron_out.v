// `include "neuron_hidden.v"

`include "sigmoid_8grad.v"

module neuron_out(
    input wire signed [19:0] a2_1,
    input wire signed [19:0] a2_2,

    // output wire signed [19:0] tes_weight311,
    // output wire signed [19:0] tes_weight321,
    // output wire signed [19:0] tes_weight331,
    // output wire signed [19:0] tes_weight341,
    // output wire signed [19:0] tes_weight351,
    // output wire signed [19:0] tes_weight361,
    // output wire signed [19:0] tes_weight371,
    // output wire signed [19:0] tes_weight381,
    // output wire signed [19:0] tes_weight391,

    // output wire signed [19:0] tes_weight312,
    // output wire signed [19:0] tes_weight322,
    // output wire signed [19:0] tes_weight332,
    // output wire signed [19:0] tes_weight342,
    // output wire signed [19:0] tes_weight352,
    // output wire signed [19:0] tes_weight362,
    // output wire signed [19:0] tes_weight372,
    // output wire signed [19:0] tes_weight382,
    // output wire signed [19:0] tes_weight392,

    // output wire signed [19:0] tes_bias1,
    // output wire signed [19:0] tes_bias2,
    // output wire signed [19:0] tes_bias3,
    // output wire signed [19:0] tes_bias4,
    // output wire signed [19:0] tes_bias5,
    // output wire signed [19:0] tes_bias6,
    // output wire signed [19:0] tes_bias7,
    // output wire signed [19:0] tes_bias8,
    // output wire signed [19:0] tes_bias9,

    output wire signed [19:0] a3_1,
    output wire signed [19:0] a3_2,
    output wire signed [19:0] a3_3,
    output wire signed [19:0] a3_4,
    output wire signed [19:0] a3_5,
    output wire signed [19:0] a3_6,
    output wire signed [19:0] a3_7,
    output wire signed [19:0] a3_8,
    output wire signed [19:0] a3_9
);

    // Placeholder 
    wire signed [39:0] z3_11;
    wire signed [39:0] z3_12;

    wire signed [39:0] z3_21;
    wire signed [39:0] z3_22;

    wire signed [39:0] z3_31;
    wire signed [39:0] z3_32;

    wire signed [39:0] z3_41;
    wire signed [39:0] z3_42;

    wire signed [39:0] z3_51;
    wire signed [39:0] z3_52;

    wire signed [39:0] z3_61;
    wire signed [39:0] z3_62;

    wire signed [39:0] z3_71;
    wire signed [39:0] z3_72;

    wire signed [39:0] z3_81;
    wire signed [39:0] z3_82;

    wire signed [39:0] z3_91;
    wire signed [39:0] z3_92;

    wire signed [19:0] z3_1;
    wire signed [19:0] z3_2;
    wire signed [19:0] z3_3;
    wire signed [19:0] z3_4;
    wire signed [19:0] z3_5;
    wire signed [19:0] z3_6;
    wire signed [19:0] z3_7;
    wire signed [19:0] z3_8;
    wire signed [19:0] z3_9;

    // Weight 1
    parameter signed [19:0] weight3_11 = 20'sh0A1C4;
    parameter signed [19:0] weight3_21 = 20'sh2D0AB;
    parameter signed [19:0] weight3_31 = 20'sh09DCB;
    parameter signed [19:0] weight3_41 = 20'sh2CAC8;
    parameter signed [19:0] weight3_51 = 20'shD656D;
    parameter signed [19:0] weight3_61 = 20'sh2D5EF;
    parameter signed [19:0] weight3_71 = 20'sh0A82D;
    parameter signed [19:0] weight3_81 = 20'sh2CE81;
    parameter signed [19:0] weight3_91 = 20'sh096AE;
 
    
    // Weight 2
    parameter signed [19:0] weight3_12 = 20'sh165EE;
    parameter signed [19:0] weight3_22 = 20'shF1FBB;
    parameter signed [19:0] weight3_32 = 20'sh15212;
    parameter signed [19:0] weight3_42 = 20'shF12E7;
    parameter signed [19:0] weight3_52 = 20'sh15EA0;
    parameter signed [19:0] weight3_62 = 20'shF2E17;
    parameter signed [19:0] weight3_72 = 20'sh171F5;
    parameter signed [19:0] weight3_82 = 20'shF197E;
    parameter signed [19:0] weight3_92 = 20'sh14663;

    // Bias
    parameter signed [19:0] bias3_1 = 20'sh21DD0;
    parameter signed [19:0] bias3_2 = 20'shFDA10;
    parameter signed [19:0] bias3_3 = 20'sh222D7;
    parameter signed [19:0] bias3_4 = 20'shFDCBE;
    parameter signed [19:0] bias3_5 = 20'sh00CBD;
    parameter signed [19:0] bias3_6 = 20'shFD764;
    parameter signed [19:0] bias3_7 = 20'sh21ADF;
    parameter signed [19:0] bias3_8 = 20'shFDB31;
    parameter signed [19:0] bias3_9 = 20'sh225A6;
    
    // assign tes_weight311 = weight3_11;
    // assign tes_weight321 = weight3_21;
    // assign tes_weight331 = weight3_31;
    // assign tes_weight341 = weight3_41;
    // assign tes_weight351 = weight3_51;
    // assign tes_weight361 = weight3_61;
    // assign tes_weight371 = weight3_71;
    // assign tes_weight381 = weight3_81;
    // assign tes_weight391 = weight3_91;

    // assign tes_weight312 = weight3_12;
    // assign tes_weight322 = weight3_22;
    // assign tes_weight332 = weight3_32;
    // assign tes_weight342 = weight3_42;
    // assign tes_weight352 = weight3_52;
    // assign tes_weight362 = weight3_62;
    // assign tes_weight372 = weight3_72;
    // assign tes_weight382 = weight3_82;
    // assign tes_weight392 = weight3_92;

    // assign tes_bias1 = bias3_1;
    // assign tes_bias2 = bias3_2;
    // assign tes_bias3 = bias3_3;
    // assign tes_bias4 = bias3_4;
    // assign tes_bias5 = bias3_5;
    // assign tes_bias6 = bias3_6;
    // assign tes_bias7 = bias3_7;
    // assign tes_bias8 = bias3_8;
    // assign tes_bias9 = bias3_9;

    assign z3_11 = (weight3_11 * a2_1) >>> 15;
    assign z3_12 = (weight3_12 * a2_2) >>> 15;

    assign z3_21 = (weight3_21 * a2_1) >>> 15;
    assign z3_22 = (weight3_22 * a2_2) >>> 15;

    assign z3_31 = (weight3_31 * a2_1) >>> 15;
    assign z3_32 = (weight3_32 * a2_2) >>> 15;

    assign z3_41 = (weight3_41 * a2_1) >>> 15;
    assign z3_42 = (weight3_42 * a2_2) >>> 15;

    assign z3_51 = (weight3_51 * a2_1) >>> 15;
    assign z3_52 = (weight3_52 * a2_2) >>> 15;

    assign z3_61 = (weight3_61 * a2_1) >>> 15;
    assign z3_62 = (weight3_62 * a2_2) >>> 15;

    assign z3_71 = (weight3_71 * a2_1) >>> 15;
    assign z3_72 = (weight3_72 * a2_2) >>> 15;

    assign z3_81 = (weight3_81 * a2_1) >>> 15;
    assign z3_82 = (weight3_82 * a2_2) >>> 15;

    assign z3_91 = (weight3_91 * a2_1) >>> 15;
    assign z3_92 = (weight3_92 * a2_2) >>> 15;
    
    assign z3_1 = z3_11[19:0] + z3_12[19:0] + bias3_1;
    assign z3_2 = z3_21[19:0] + z3_22[19:0] + bias3_2;
    assign z3_3 = z3_31[19:0] + z3_32[19:0] + bias3_3;
    assign z3_4 = z3_41[19:0] + z3_42[19:0] + bias3_4;
    assign z3_5 = z3_51[19:0] + z3_52[19:0] + bias3_5;
    assign z3_6 = z3_61[19:0] + z3_62[19:0] + bias3_6;
    assign z3_7 = z3_71[19:0] + z3_72[19:0] + bias3_7;
    assign z3_8 = z3_81[19:0] + z3_82[19:0] + bias3_8;
    assign z3_9 = z3_91[19:0] + z3_92[19:0] + bias3_9;

    sigmoid_8grad n1(.x_in(z3_1), .y_out(a3_1));
    sigmoid_8grad n2(.x_in(z3_2), .y_out(a3_2));
    sigmoid_8grad n3(.x_in(z3_3), .y_out(a3_3));
    sigmoid_8grad n4(.x_in(z3_4), .y_out(a3_4));
    sigmoid_8grad n5(.x_in(z3_5), .y_out(a3_5));
    sigmoid_8grad n6(.x_in(z3_6), .y_out(a3_6));
    sigmoid_8grad n7(.x_in(z3_7), .y_out(a3_7));
    sigmoid_8grad n8(.x_in(z3_8), .y_out(a3_8));
    sigmoid_8grad n9(.x_in(z3_9), .y_out(a3_9));

endmodule