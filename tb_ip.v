`timescale 1ns / 1ps

module tb_ip;

    // Inputs
    reg clk,cout;
    reg reset;
    reg [31:0] ipplane,new_data_in;
    reg [4:0] k,j;
    reg ldor,peen;

    // Outputs
    wire [31:0] do; // [31:0]
    wire [4:0]  pencoderout, pencoderlen,fsdecoded,kdecoded;
    wire p1;
    wire [4:0] c1,c2;
    assign c1 = op1.count1;
   assign c2 = op1.count2; 
    assign p1 = op1.phase;
//    wire [31:0] inp;
//    assign inp = op1.pe.len;
//    wire msb;
//     wire [31:0] pein1,out1;
//     wire [4:0] crl1;
     
     
//      assign pein1 = dut.ip.lr1.in;
//      assign crl1 = dut.ip.crl;
//      assign out1 = dut.ip.out;


    // Instantiate the DUT (Device Under Test)
    orplane op1 (
        .clk(clk),
        .cout(cout),
        .reset(reset),
        .ipplane(ipplane),
        .new_data_in(new_data_in),
        .ldor(ldor),
        .j(j),
        .k(k),
        .peen(peen),
        .do(do),
        .pencoderout(pencoderout),
        .pencoderlen(pencoderlen),
        .fsdecoded(fsdecoded),
        .kdecoded(kdecoded)
     
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        peen = 0;

        ldor = 0;
        j = 5'b00011;
        k = 5'b00010;
         cout =0; 
        ipplane = 32'b00001010000100001000001010000001;
//        new_data_in = 32'b00000100001000000010100010000001;
        new_data_in = 32'b0011_0101_0011_0101_0101_0101_0101_0101;

        // Apply rese
        #10 reset = 0;
       #1 peen = 1; #2 ldor = 1;
         #17 ldor = 0;
        // Load initial input and OR plane data
        #100 peen = 0;
       
        #90 cout=0; peen = 1;
        #30 cout = 0; peen = 0;


        // Run simulation for a while
        repeat (50) #10;
        
     
//        assign msb = dut.sb1.result;

        $finish;
    end

endmodule
