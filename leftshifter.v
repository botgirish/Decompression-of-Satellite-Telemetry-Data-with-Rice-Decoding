`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 10:18:58 AM
// Design Name: 
// Module Name: leftshifter
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

module leftshifter(
    input [31:0] in,
    input [4:0] shamt,
    output reg [31:0] out
);
    always @(*) begin
        out = (in << shamt);
    end
endmodule