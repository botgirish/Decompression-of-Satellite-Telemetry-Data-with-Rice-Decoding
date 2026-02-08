`timescale 1ns / 1ps

module tb_cg;

    // Inputs
    reg clk;
    reg reset;
    reg [4:0] pencoderlen;
    reg ldor;

    // Outputs
    wire cout;
    wire [4:0] remlendup;
  

    carrygenerator cg1 (
        .clk(clk),
        .reset(reset),
        .ldor(ldor),
        .pencoderlen(pencoderlen),
        .cout(cout),
        .remlendup(remlendup)
    );
//          wire [4:0] remlen1,codlen1,remlendup1;
//    assign remlen1 = cg1.dcrl.out;
//     assign codlen1 = cg1.a1.in2;
//     assign remlendup1 = cg1.a1.out;
        
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        pencoderlen = 5'b00011;
        ldor = 0;

        // Apply rese
        #10 reset = 0;
 #20 ldor = 1;
         #17 ldor = 0;
        // Load initial input and OR plane data

        // Run simulation for a while
        repeat (50) #10;

     
//        assign msb = dut.sb1.result;

        $finish;
    end

endmodule
