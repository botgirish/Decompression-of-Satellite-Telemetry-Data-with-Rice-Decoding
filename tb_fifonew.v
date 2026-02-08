`timescale 1ns / 1ps

module tb_fifonew;

  // Inputs
  reg rd_clk,wr_clk;
  reg rst;
  reg wr_en;
  reg rd_en;
  reg [31:0] din;

  // Outputs
  wire [31:0] dout;
  wire full;
  wire empty;

  // Instantiate FIFO
  fifonew uut (
    .rd_clk(rd_clk),
    .wr_clk(wr_clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
  );


        initial begin
        rd_clk = 0;
        forever begin
            #10 rd_clk = ~rd_clk;  // 100MHz
        end
    end
    
       initial begin
        wr_clk = 0;
        forever begin
            #5 wr_clk = ~wr_clk;  // 100MHz
        end
    end
    

  initial begin

    rst = 1;
    wr_en = 0;
    rd_en = 0;
    din = 32'd0001010101010;

    // Reset FIFO
    #2 rst = 0;
    #150;

    // Write 5 values to FIFO
    @(posedge rd_clk);
    repeat (5) begin
      @(posedge rd_clk);
      wr_en = 1;
      din = din + 32'd1;
    end

    @(posedge rd_clk);
    wr_en = 0;

    // Read 5 values from FIFO
    @(posedge rd_clk);
    repeat (5) begin
      @(posedge rd_clk);
      rd_en = 1;
    end

    @(posedge rd_clk);
    rd_en = 0;

    // Finish
    #50;
    $finish;
  end

endmodule
