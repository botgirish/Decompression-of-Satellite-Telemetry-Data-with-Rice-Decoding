`timescale 1ns / 1ps
//Original

//module subtractor_5bit (
//    input  [4:0] A,
//    input  [4:0] B,
//    output [4:0] result
//);
//assign result = A-B;

//endmodule

module subtractor_5bit (
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] result
);
assign result = A-B;

endmodule