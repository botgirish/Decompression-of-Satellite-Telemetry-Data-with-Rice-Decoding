`timescale 1ns / 1ps

module tb_dff48bit;

    // Inputs
    reg clk;
    reg reset,datavalid;
    reg [31:0] data;

    // Outputs
    wire [31:0] packetdata;
    wire pvalid;
  
  
    dff48bit d48b (
        .clk(clk),
        .reset(reset),
        .data(data),
        .packetdata(packetdata),
        .pvalid(pvalid),
        .datavalid(datavalid)
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
        datavalid = 0;
        data = 32'b00001010000100001000001010000001;
        #9 reset = 0;
        data = 32'd1234598765;
        #10 data = 32'd567785432;
        #10 datavalid =1 ;
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
