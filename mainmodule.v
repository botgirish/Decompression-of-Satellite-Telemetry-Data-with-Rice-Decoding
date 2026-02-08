`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 15:35:16
// Design Name: 
// Module Name: mainmodule
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


    module mainmodule(
    input clk1, clk2, reset, go,
    input [31:0] data,
    input [5:0] n,j,k,
    output [319:0] symbol,
    output [319:0] fscodes,kcodes
    );
    
    preprocessing pp(.data(data),.clk1(clk1),.clk2(clk2),.reset(reset),.datavalid(datavalid),.cdsdatavalid(cdsdatavalid),.start(start),.stop(stop),.wren(wren),.n(n),.j(j),.k(k),.fscodes(fscodes),.kcodes(kcodes),.symbol(symbol));
    cppreprocessor cppp1(.clk(clk2),.reset(reset),.go(go),.datavalid(datavalid),.cdsdatavalid(cdsdatavalid),.wren(wren),.start(start));
endmodule
