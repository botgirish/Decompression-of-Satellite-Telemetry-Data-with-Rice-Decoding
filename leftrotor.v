`timescale 1ns / 1ps

//module leftrotor(
//    input clk,
//    input en,
//    input [63:0] in,
//    input [5:0] shamt,
//    output reg [63:0] out
//);
//    always @(posedge clk) begin
//    if(en)
//        out <= (in << shamt) | (in >> (64 - shamt));
//    end

//endmodule

module leftrotor(
    input [63:0] in,
    input [5:0] shamt,
    output [63:0] out
);

      assign  out =  (in << shamt) | (in >> (64 - shamt));

endmodule