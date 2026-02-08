`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 10:34:38
// Design Name: 
// Module Name: dff48bit
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


module dff48bit(
    input clk,reset,
    input [31:0] data,
    input datavalid,
    output reg [31:0] packetdata,
    output reg pvalid
//    output reg [47:0] packhead
    );
    
    reg [47:0] buffer;
    reg [47:0] header;
    always@(posedge clk) begin
        if(reset) begin
        buffer <= 48'b0;
        pvalid <= 0;
//        packhead <= 0;
        end
        else if(!datavalid) begin
        buffer = buffer<<32;
        buffer[31:0] = data;
        pvalid <= 0;
        header <= buffer;
//        packhead = packhead << 32;
//        packhead = buffer[31:0];
        end
        
        else if(datavalid) begin
          buffer = buffer<<32;
         buffer[31:0] = data;
        packetdata = buffer[47:16];
        pvalid <= 1;
        end
    end
endmodule
