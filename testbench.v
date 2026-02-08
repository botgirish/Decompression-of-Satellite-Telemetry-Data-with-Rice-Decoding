`timescale 1ns / 1ps

module top_tb;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg stop;
    reg [15:0] ipdata;
    reg [31:0] ordata;
    reg [4:0] k;
    reg ldin;
    reg ldor;
    reg j;

    // Outputs
    wire [15:0] symbol; // [31:0]
    wire carry;
    wire c1zero;
    wire c2zero;
//    wire msb;
     wire [31:0] pein1,out1;
     wire [4:0] crl1;
     wire ldindup,ldordup;

//     assign ldindup = ldin;
//     assign ldordup = ldor;
     
     
      assign pein1 = dut.ip.lr1.in;
      assign crl1 = dut.ip.crl;
      assign out1 = dut.ip.out;


    // Instantiate the DUT (Device Under Test)
    topmodule dut (
        .clk(clk),
        .start(start),
        .stop(stop),
        .reset(reset),
        .ipdata(ipdata),
        .ordata(ordata),
        .k(k),
        .ldin(ldin),
        .ldor(ldor),
        .j(j),
        .symbol(symbol),
        .carry(carry),
        .c1zero(c1zero),
        .c2zero(c2zero)
    );

controlpath cp1(.start(start),.stop(stop),.reset(reset),.j(j),.k(k),.c1zero(c1zero),.c2zero(c2zero),.cout(carry),.ldin(ldindup),.ldor(ldordup),.peen(peen));
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        start = 1;
        stop = 0;
        ldin = 0;
        ldor = 0;
        j = 1'b1;
        k = 5'd3;
        ipdata = 16'b0000001111001101;
        ordata = 32'b00000011110011010000001111001101;

        // Apply reset
        #10 reset = 0;

        // Start signal
        #8 start = 1;

        // Load initial input and OR plane data
        #10 ldor = 1; ldin = 1;
        #10 ldor = 0; ldin = 0;

        // Activate priority encoder enable



        // Run simulation for a while
        repeat (50) #10;
        
     
//        assign msb = dut.sb1.result;

        $finish;
    end

endmodule
