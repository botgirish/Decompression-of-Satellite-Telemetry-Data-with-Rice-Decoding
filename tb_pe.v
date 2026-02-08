`timescale 1ns / 1ps

module tb_pe;

    // Inputs
    reg clk;
    reg peen;
    reg reset;
    reg [31:0] in;
    wire [4:0] out,len;

//    wire msb;
//     wire [31:0] pein1,out1;
//     wire [4:0] crl1;
     
     
//      assign pein1 = dut.ip.lr1.in;
//      assign crl1 = dut.ip.crl;
//      assign out1 = dut.ip.out;


    // Instantiate the DUT (Device Under Test)
    pencoder pe1 (
        .clk(clk),
        .reset(reset),
        .peen(peen),
        .in(in),
        .out(out),
        .len(len)

    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        peen = 1;
        reset = 1;
        #10 reset = 0;
       #10 in = 32'b00001010000100001000001010000001;
      #10  in = 32'b10001010000100001000001010000001;
      #10  in = 32'b01001010000100001000001010000001;


        // Apply rese
        
       #1 peen = 1;
       
        #90 peen = 1;


        // Run simulation for a while
        repeat (50) #10;
        
     
//        assign msb = dut.sb1.result;

        $finish;
    end

endmodule
