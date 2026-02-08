//`timescale 1ns / 1ps


////module fifonew(
////    input rst,clk,wr_en,rd_en,full,empty,
////    input [31:0] din,
////    output [31:0] dout
////    );
    
////fifo_generator_0 your_instance_name (
////  .clk(clk),      // input wire clk
////  .srst(rst),    // input wire srst
////  .din(din),      // input wire [31 : 0] din
////  .wr_en(wr_en),  // input wire wr_en
////  .rd_en(rd_en),  // input wire rd_en
////  .dout(dout),    // output wire [31 : 0] dout
////  .full(full),    // output wire full
////  .empty(empty)  // output wire empty
////);

////endmodule

//module fifonew(
//    input rst,rd_clk, wr_clk,wr_en,rd_en,full,empty,
//    input [31:0] din,
//    output [15:0] dout
//    );
    
//fifo_generator_0 your_instance_name (
//  .rst(rst),        // input wire rst
//  .wr_clk(wr_clk),  // input wire wr_clk
//  .rd_clk(rd_clk),  // input wire rd_clk
//  .din(din),        // input wire [31 : 0] din
//  .wr_en(wr_en),    // input wire wr_en
//  .rd_en(rd_en),    // input wire rd_en
//  .dout(dout),      // output wire [15 : 0] dout
//  .full(full),      // output wire full
//  .empty(empty)    // output wire empty
//);

//endmodule


`timescale 1ns / 1ps

module fifonew (
    input wire rd_clk,wr_clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [31:0] din,
    output wire [31:0] dout,
    output wire full,
    output wire empty
);

  // Instantiate FIFO IP core
  // Replace fifo_ip with the actual name of your FIFO IP module
fifo_generator_1 your_instance_name (
  .rst(rst),        // input wire rst
  .wr_clk(wr_clk),  // input wire wr_clk
  .rd_clk(rd_clk),  // input wire rd_clk
  .din(din),        // input wire [31 : 0] din
  .wr_en(wr_en),    // input wire wr_en
  .rd_en(rd_en),    // input wire rd_en
  .dout(dout),      // output wire [31 : 0] dout
  .full(full),      // output wire full
  .empty(empty)    // output wire empty
);

endmodule