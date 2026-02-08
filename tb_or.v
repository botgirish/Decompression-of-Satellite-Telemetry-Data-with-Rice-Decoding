`timescale 1ns / 1ps

module tb_or;

    reg [31:0] in;
    reg clk, reset, cout, ldin,ldor;
    reg [5:0] shamt, crl, k, j;
    wire [63:0] ipout;
    wire c1zero, c2zero;
    wire [5:0] c1,c2,p1;
    assign c1 = uut.fs_count;
    assign c2 = uut.rem_count;
    assign p1 = uut.phase;
    

    // Instantiate the module
    inputplane uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .shamt(shamt),
        .k(k),
        .j(j),
        .cout(cout),
        .crl(crl),
        .ldor(ldor),
        .ldin(ldin),
        .ipout(ipout),
        .c1zero(c1zero),
        .c2zero(c2zero)
    );
    wire [63:0] aligned,rot,dff;
    assign aligned = uut.aligned_input;
    assign rot = uut.rotated;
    assign dff = uut.dff_out;
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Stimulus
    initial begin
        // Initialize inputs
        in = 32'hABACDAEF;
        shamt = 6'd3;
        k = 6'd2;
        j = 6'd4;
        crl = 6'd16;
        cout = 0;
        reset = 1;
        ldin = 0;
        ldor = 1;

        // Hold reset
        #10;
        reset = 0;
        ldin = 1;

        // Hold ldin for 1 cycle
        #10;
        ldin = 0;
        cout = 1;
        #10;
        cout = 0;

        // Run for multiple cycles to observe phase toggling
        repeat (20) begin
            #10;
            in = in + 1;  // Change input for visibility
        end

        $finish;
    end

endmodule
