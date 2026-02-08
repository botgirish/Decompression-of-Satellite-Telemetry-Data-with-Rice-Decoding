`timescale 1ns / 1ps
//Original

//module dff5bit(
//input ld,
//input clk,
//input reset,
//input [5:0] in,
//output reg [5:0] out
//    );
   
//   always@(posedge clk)
//   begin
//        out <= in;
//   end

//endmodule

module dff5bit(
input ld,
input clk,
input reset,
input [5:0] in,
output reg [5:0] out
    );
   
   always@(posedge clk)
   begin
        out <= in;
   end

endmodule