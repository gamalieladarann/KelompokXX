`timescale 1ns / 1ps
`include "top_level.v"


module top_level_tb;
    reg [8:0] X; // Input pixel
    wire signed [19:0] output_0, output_1, output_2;
    wire signed [19:0] output_3, output_4, output_5;
    wire signed [19:0] output_6, output_7, output_8;
    
    top_level uut (
        .X(X),
        .output_0(output_0),
        .output_1(output_1),
        .output_2(output_2),
        .output_3(output_3),
        .output_4(output_4),
        .output_5(output_5),
        .output_6(output_6),
        .output_7(output_7),
        .output_8(output_8)
    );

    // Testbench 
    initial begin
        // GTKWave dump
        $dumpfile("top_level_tb.vcd");
        $dumpvars(0, top_level_tb);


        X = 9'b101010101; 
        #100;
        X = 9'b001010100; 
        #100;
        $finish;
    end

    initial begin
        $monitor("Time=%0t X=%b -> Output_0=%d, Output_1=%d, Output_2=%d, Output_3=%d, Output_4=%d, Output_5=%d, Output_6=%d, Output_7=%d, Output_8=%d",
                 $time, X, output_0, output_1, output_2, output_3, output_4, output_5, output_6, output_7, output_8);
    end

endmodule

