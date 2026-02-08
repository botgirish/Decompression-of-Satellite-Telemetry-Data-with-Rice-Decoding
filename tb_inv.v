`timescale 1ns / 1ps

module tb_inv;

    // Parameters
    reg clk;
    reg reset;
    reg [5:0] j;
    reg [9:0] xref;
    reg [319:0] symbol;
    wire [319:0] xout;
    
    wire [5:0] c;

    // Instantiate the Unit Under Test (UUT)
    invpre uut (
        .clk(clk),
        .reset(reset),
        .j(j),
        .xref(xref),
        .symbol(symbol),
        .xout(xout)
    );

assign c = uut.count;
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end

    // Test vector
    initial begin
        // Initialize
        reset = 1;
        j = 6'd32;             // 10 symbols to decode
        xref = 10'd512;        // Reference sample (mid-range)
        symbol = 320'd0;       // Set symbol to zero initially

        // Wait some time
        #12;
        reset = 0;

        // Apply test symbol values
        // Example: alternating small deltas
        symbol = 320'hABBECEEADFFBAECBA7C3F91D4E8B20FA13C6D4B78E2095B1CF3478A2B5D9E0C7163A4F29DE7BC815;


        // Wait for decoding
        #200;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0dns, xout = %h", $time, xout);
    end

endmodule
