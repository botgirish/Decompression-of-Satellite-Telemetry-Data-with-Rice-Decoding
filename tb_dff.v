`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk1,clk2;
    reg reset,first,start,stop,wren,rden;
    reg [31:0] data;
    reg datavalid;
    reg [4:0] n,j,k;

    // Outputs
    wire [9:0] symbol;
    wire [4:0] fscodes,kcodes;
  
  
    preprocessing pp1 (
        .clk1(clk1),
        .clk2(clk2),
        .first(first),
        .start(start),
        .stop(stop),
        .wren(wren),
        .rden(rden),
        .n(n),
        .k(k),
        .j(j),
        .reset(reset),
        .data(data),
        .symbol(symbol),
        .fscodes(fscodes),
        .kcodes(kcodes),
        .datavalid(datavalid)
    );

    // Clock generation
    initial begin
        clk1 = 0;
        forever #10 clk1 = ~clk1;
    end
    
        initial begin
        clk2 = 0;
        forever #10 clk2 = ~clk2;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        start = 1;
        stop = 0;
        wren = 1;
        rden = 1;
        first =1;
        n = 5'b01000;
        j = 5'b01010;
        k = 5'b00001;
        datavalid = 0;
        data = 32'b00001010000100001000001010000001;
        #9 reset = 0;
        data = 32'd1234598765;
        #10 data = 32'd567785432;
        #10 datavalid =1 ; first = 1;
      data = 32'd123456789;
        #10 data = 32'd91892345;
        #10 data = 32'd678965432;
        #10 data = 32'd123456780;
        #10 data = 32'd122256780;
        #10 data = 32'd123451180;
        #10 data = 32'd1238765780;


        repeat (50) #10;


        $finish;
    end

endmodule
