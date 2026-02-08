`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 14:34:30
// Design Name: 
// Module Name: fifocheck
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifocheck(
  input rst,
  input wr_clk,
  input rd_clk,
  input [31:0]din,
  input wr_en,
  input rd_en,
  output [31:0]dout,
  output full,
  output empty,
  output [9:0]rd_data_count,
  output [9:0]wr_data_count,
  output wr_rst_busy,
  output rd_rst_busy
    );
    
     fifo_generator_0 f1 (
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
    
    
endmodule
