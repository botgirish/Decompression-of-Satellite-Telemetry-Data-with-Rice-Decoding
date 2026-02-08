`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 14:06:16
// Design Name: 
// Module Name: decompressor
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


module decompressor(
    input [31:0] data,
    input [15:0] data2,
    input clk,reset,valid_in,first,
    input [4:0] j,k,n,
    input [9:0] xref,
    output [9:0] xout
    );
    
    wire [47:0] packeth;
    wire headervalid,payloadvalid,validout;
    wire [31:0] packetdata,cdsdata;
    wire [4:0] cdsh,fscodes,kcodes;
    wire [9:0] symbol;
    pheader ph2(.clk(clk),.reset(reset),.valid_in(valid_in),.data_in(data),.header_out(packeth),.header_valid(headervalid),.payload_out(packetdata),.payload_valid(payloadvalid));
    cdsheader cds2(.clk(clk),.first(first),.reset(reset),.valid_in(payloadvalid),.payload_in(packetdata),.n(n),.header_out(cdsh),.data_out(cdsdata),.valid_out(validout));
    topmodule tp2(.clk(clk),.start(validout),.stop(~validout),.reset(reset),.ipdata(data2),.ordata(cdsdata),.j(j),.k(k),.fscodes(fscodes),.kcodes(kcodes),.symbol(symbol));
    invpre in2(.clk(clk),.reset(reset),.xref(xref),.delta(symbol),.xout(xout));
    
endmodule
