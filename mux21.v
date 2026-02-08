`timescale 1ns / 1ps

//module mux21(
//input [63:0] in1,in2,
//input sel,
//output reg [63:0] out
//    );
   
//    always@(*)
//    begin
//    case(sel)
//    0: out= in1;
//    1: out= in2;
//    endcase
   
   
//    end
//endmodule

module mux21(
    input  [63:0] in1,
    input  [63:0] in2,
    input         sel,
    output [63:0] out
);
    assign out = sel ? in2 : in1;
endmodule
