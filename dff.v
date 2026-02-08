`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2025 10:18:58 AM
// Design Name: 
// Module Name: dff
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

module dff(
input clk,
input reset,
input [31:0] in,
output reg [31:0] out
    );
   
   always@(posedge clk)
   begin
   if(!reset)
   out <= in;
   
     else
   out <= 32'b0;
   end
   
 
endmodule