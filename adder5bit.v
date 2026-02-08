`timescale 1ns / 1ps
//Original

//module adder5bit(
//input [4:0] in1,in2,
//output [4:0] out
//    );
//    assign out = in1+in2;
//endmodule

module adder5bit(
input [5:0] in1,in2,
output [5:0] out
    );
    assign out = in1+in2;
endmodule