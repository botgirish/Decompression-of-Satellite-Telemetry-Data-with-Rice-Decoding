`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 15:23:48
// Design Name: 
// Module Name: tb_cppp
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


module tb_cppp();

reg clk,reset,go;
wire datavalid, cdsdatavalid, wren;

cppreprocessor cpp(.clk(clk),.reset(reset),.go(go),.datavalid(datavalid),.cdsdatavalid(cdsdatavalid),.wren(wren));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        go = 1;
        #10;
        reset = 0;
    end

endmodule
