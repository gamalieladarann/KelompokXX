`include "mean.v"

module mean_tb;

    reg X_0, X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8;

    reg signed [19:0] Wm_01, Wm_11, Wm_21, Wm_31, Wm_41, Wm_51, Wm_61, Wm_71, Wm_81;
    reg signed [19:0] B_mean1;

    reg signed [19:0] Wm_02, Wm_12, Wm_22, Wm_32, Wm_42, Wm_52, Wm_62, Wm_72, Wm_82;
    reg signed [19:0] B_mean2;

    wire signed [19:0] C_out1;
    wire signed [19:0] C_out2;

    mean C1(
        .X_0(X_0),
        .X_1(X_1),
        .X_2(X_2),
        .X_3(X_3),
        .X_4(X_4),
        .X_5(X_5),
        .X_6(X_6),
        .X_7(X_7),
        .X_8(X_8),

        .Wm_0(Wm_01),
        .Wm_1(Wm_11),
        .Wm_2(Wm_21),
        .Wm_3(Wm_31),
        .Wm_4(Wm_41),
        .Wm_5(Wm_51),
        .Wm_6(Wm_61),
        .Wm_7(Wm_71),
        .Wm_8(Wm_81),

        .B_mean(B_mean1),

        .C_out(C_out1)
    );

    mean C2(
        .X_0(X_0),
        .X_1(X_1),
        .X_2(X_2),
        .X_3(X_3),
        .X_4(X_4),
        .X_5(X_5),
        .X_6(X_6),
        .X_7(X_7),
        .X_8(X_8),

        .Wm_0(Wm_02),
        .Wm_1(Wm_12),
        .Wm_2(Wm_22),
        .Wm_3(Wm_32),
        .Wm_4(Wm_42),
        .Wm_5(Wm_52),
        .Wm_6(Wm_62),
        .Wm_7(Wm_72),
        .Wm_8(Wm_82),

        .B_mean(B_mean2),

        .C_out(C_out2)
    );

    initial begin
        $dumpfile("mean_tb.vcd");
        $dumpvars(0, mean_tb);

        X_0 = 1;
        X_1 = 1;
        X_2 = 1;
        X_3 = 1;
        X_4 = 0;
        X_5 = 1;
        X_6 = 1;
        X_7 = 1;
        X_8 = 1;

        Wm_01 = 20'shFFFF3;
        Wm_11 = 20'shFFFA5;
        Wm_21 = 20'shFFFF3;
        Wm_31 = 20'shFFFD9;
        Wm_41 = 20'sh0004E;
        Wm_51 = 20'shFFF8B;
        Wm_61 = 20'shFE82E;
        Wm_71 = 20'sh09BF7;
        Wm_81 = 20'sh03109;

        Wm_02 = 20'shFFF91;
        Wm_12 = 20'sh0007C;
        Wm_22 = 20'shFFF98;
        Wm_32 = 20'sh0006F;
        Wm_42 = 20'shFFF49;
        Wm_52 = 20'sh00075;
        Wm_62 = 20'sh03E90;
        Wm_72 = 20'shFC35E;
        Wm_82 = 20'sh050F2;

        B_mean1 = 20'shFA2D8;
        B_mean2 = 20'shF9C13;

        #7;

        X_0 = 1;
        X_1 = 0;
        X_2 = 1;
        X_3 = 0;
        X_4 = 1;
        X_5 = 0;
        X_6 = 1;
        X_7 = 0;
        X_8 = 1;

        #7;
    end

endmodule