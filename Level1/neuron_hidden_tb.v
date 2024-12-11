`include "neuron_hidden.v"

module neuron_hidden_tb();
    reg signed [19:0] C_out;
    reg signed [19:0] E_out;

    wire signed [19:0] N0_out;

    neuron_hidden dut(
        .C_out(C_out),
        .E_out(E_out),

        .N1_out(N1_out)
    );

    initial begin
        $dumpfile("neuron_hidden_tb.vcd");
        $dumpvars(0, neuron_hidden_tb);

        C_out = 20'sh04200;
        E_out = 20'sh04100;
        #10;    
        
        $finish;
    end

endmodule
