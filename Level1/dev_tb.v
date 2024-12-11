`include "dev.v"

module dev_tb;

    reg signed [19:0] INPUT;

    wire signed [19:0] OUTPUT;

    dev dev1(
        .SP_out(INPUT),
        
        .D_out(OUTPUT)
    );
    
    initial begin
        $dumpfile("dev_tb.vcd");
        $dumpvars(0, dev_tb);

        INPUT = 20'sh00000;

        #7;

        repeat(96)
        begin
            INPUT += 20'sh00001;
            #7;
        end
    end

endmodule
