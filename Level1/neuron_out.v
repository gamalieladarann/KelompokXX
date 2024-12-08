module neuron_out(
    // Sinyal input : a21 dan a22
    input wire signed [19:0] a2_1, a2_2,

    // Weight dan bias
    input wire signed [19:0] weight3_11, weight3_21, weight3_31, weight3_41, weight3_51, weight3_61, weight3_71, weight3_81, weight3_91,
    input wire signed [19:0] weight3_12, weight3_22, weight3_32, weight3_42, weight3_52, weight3_62, weight3_72, weight3_82, weight3_92,
    input wire signed [19:0] bias3_1, bias3_2, bias3_3, bias3_4, bias3_5, bias3_6, bias3_7, bias3_8, bias3_9,

    output wire signed [19:0] z3_1, z3_2, z3_3, z3_4, z3_5, z3_6, z3_7, z3_8, z3_9
);

    // Intermediate variabel untuk menampung perhitungan 
    wire signed [39:0] z3_11; wire signed [39:0] z3_12;

    wire signed [39:0] z3_21; wire signed [39:0] z3_22;

    wire signed [39:0] z3_31; wire signed [39:0] z3_32;

    wire signed [39:0] z3_41; wire signed [39:0] z3_42;

    wire signed [39:0] z3_51; wire signed [39:0] z3_52;

    wire signed [39:0] z3_61; wire signed [39:0] z3_62;

    wire signed [39:0] z3_71; wire signed [39:0] z3_72;

    wire signed [39:0] z3_81; wire signed [39:0] z3_82;

    wire signed [39:0] z3_91; wire signed [39:0] z3_92;
    
    assign z3_11 = (weight3_11 * a2_1) >>> 15; assign z3_12 = (weight3_12 * a2_2) >>> 15;

    assign z3_21 = (weight3_21 * a2_1) >>> 15; assign z3_22 = (weight3_22 * a2_2) >>> 15;

    assign z3_31 = (weight3_31 * a2_1) >>> 15; assign z3_32 = (weight3_32 * a2_2) >>> 15;

    assign z3_41 = (weight3_41 * a2_1) >>> 15; assign z3_42 = (weight3_42 * a2_2) >>> 15;

    assign z3_51 = (weight3_51 * a2_1) >>> 15; assign z3_52 = (weight3_52 * a2_2) >>> 15;

    assign z3_61 = (weight3_61 * a2_1) >>> 15; assign z3_62 = (weight3_62 * a2_2) >>> 15;

    assign z3_71 = (weight3_71 * a2_1) >>> 15; assign z3_72 = (weight3_72 * a2_2) >>> 15;

    assign z3_81 = (weight3_81 * a2_1) >>> 15; assign z3_82 = (weight3_82 * a2_2) >>> 15;

    assign z3_91 = (weight3_91 * a2_1) >>> 15; assign z3_92 = (weight3_92 * a2_2) >>> 15;
    
    assign z3_1 = z3_11[19:0] + z3_12[19:0] + bias3_1;
    assign z3_2 = z3_21[19:0] + z3_22[19:0] + bias3_2;
    assign z3_3 = z3_31[19:0] + z3_32[19:0] + bias3_3;
    assign z3_4 = z3_41[19:0] + z3_42[19:0] + bias3_4;
    assign z3_5 = z3_51[19:0] + z3_52[19:0] + bias3_5;
    assign z3_6 = z3_61[19:0] + z3_62[19:0] + bias3_6;
    assign z3_7 = z3_71[19:0] + z3_72[19:0] + bias3_7;
    assign z3_8 = z3_81[19:0] + z3_82[19:0] + bias3_8;
    assign z3_9 = z3_91[19:0] + z3_92[19:0] + bias3_9;

endmodule
