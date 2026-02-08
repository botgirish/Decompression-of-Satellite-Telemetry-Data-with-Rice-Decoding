`timescale 1ns / 1ps

module tb_cp;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg stop;
    reg [5:0] j;
    reg [4:0] k;
    reg c1zero;
    reg c2zero;
    reg cout;

    // Outputs
    wire ldin;
    wire ldor;
    wire peen;

    // Instantiate the Unit Under Test (UUT)
    controlpath uut (
        .start(start),
        .clk(clk),
        .stop(stop),
        .reset(reset),
        .j(j),
        .k(k),
        .c1zero(c1zero),
        .c2zero(c2zero),
        .cout(cout),
        .ldin(ldin),
        .ldor(ldor),
        .peen(peen)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Stimulus
    initial begin
        // Initialize all inputs
        reset = 1;
        start = 0;
        stop = 0;
        j = 6'd3;
        k = 5'd3;
        c1zero = 0;
        c2zero = 0;
        cout = 0;

        // Hold reset for some time
        #12;
        reset = 0;

        // Start sequence
        #2;
        start = 1;

        // Simulate transitions
        #30;
        c1zero = 1; cout = 0; // transition to s6
        #50;
        c2zero = 1; cout = 1; // transition in s6
        #2000;
        stop = 1; // move to s8
        #10;
        stop = 0;

        #50;
        $finish;
    end

endmodule
