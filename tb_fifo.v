`timescale 1ns / 1ps

module tb_fifo;

    // Inputs
    reg wr_clk,rd_clk,wr_en,rd_en;
    reg reset;
    reg [31:0] din;

    // Outputs
    wire [31:0] dout;
    wire wr_rst_busy,rd_rst_busy,full,empty;
    wire [9:0] rd_data_count,wr_data_count;
  
    fifocheck fc2 (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .rst(reset),
        .din(din),
        .dout(dout),
        .wr_rst_busy(wr_rst_busy),
        .rd_rst_busy(rd_rst_busy),
        .full(full),
        .empty(empty),
        .rd_data_count(rd_data_count),
        .wr_data_count(wr_data_count)
    );

    // Clock generation
    initial begin
        wr_clk = 0;
        forever #5 wr_clk = ~wr_clk;
    end
        initial begin
        rd_clk = 0;
        forever #5 rd_clk = ~rd_clk;
    end

    initial begin
        reset = 1;
        wr_en = 1;
        rd_en = 0;
        din = 32'd1234598765;
        #11 reset = 0;
        din = 32'd1232468965;
        wr_en = 0;
        rd_en = 1;
        #10 din = 32'd1234111765;
        wr_en = 1;
        rd_en = 0;
        #10 din = 32'd1234444765;
        #10 din = 32'd1123456765;
        wr_en = 0;
        rd_en = 1;
        #10 din = 32'd1234011265;
      

        repeat (50) #10;


        $finish;
    end

endmodule
