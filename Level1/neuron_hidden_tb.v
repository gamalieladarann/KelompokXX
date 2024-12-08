`include "neuron_hidden.v"

module neuron_hidden_tb();
    reg signed [19:0] mean;
    reg signed [19:0] dev;

    wire signed [19:0] a2;

    neuron_hidden dut(
        .mean(mean),
        .dev(dev),

        .a2(a2)
    );

    initial begin
        $dumpfile("neuron_hidden_tb.vcd");
        $dumpvars(0, neuron_hidden_tb);

        mean = 20'sh04200;
        dev = 20'sh04100;
        #10;    
        
        $finish;
    end

endmodule