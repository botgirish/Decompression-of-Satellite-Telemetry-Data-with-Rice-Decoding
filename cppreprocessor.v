`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 15:11:02
// Design Name: 
// Module Name: cppreprocessor
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


module cppreprocessor(
    input clk,reset,go,
    output reg datavalid, cdsdatavalid,wren,start
    );
    
     reg [2:0] state;
    parameter s0= 3'b000, s1= 3'b001, s2= 3'b010, s3= 3'b011, s4 = 3'b100, s5 = 3'b101;
    
    always@(posedge clk) begin
        if(reset) begin
        state <= s0;
        datavalid <= 0;
        cdsdatavalid <= 0;
        wren <= 0;
        end
        
        else begin
            case(state)
            s0 : if(go) begin state <= s1;  end
            s1 : begin datavalid <= 1; state <= s5;   end
            s5: begin state <= s2; end
            s2 : begin  cdsdatavalid <= 1; state <= s3;  end
            s3: begin   cdsdatavalid <= 0; state <= s4;  end
            s4: begin  wren <= 1; start <= 1; end
        
        endcase
        
        end
    end
endmodule
