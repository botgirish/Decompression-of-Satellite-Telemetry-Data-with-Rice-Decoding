`timescale 1ns / 1ps

module tb_dec;

    // Inputs
    reg clk,valid_in,first;
    reg reset;
    reg [31:0] data;
    reg [15:0] data2;
    reg [4:0] k,j,n;
    reg [9:0] xref;

    // Outputs
    wire [9:0] xout;
    
    
    
    
    /****************************************************////////////////////////////////////////////////////////////////// // [31:0]
//    wire [4:0] s1;
//    assign s1 = d1.cds2.header_out;
//    wire [31:0] p;
//    assign p = d1.cds2.shifted_data;

wire [4:0] f1,ph1;
assign f1 = d1.tp2.cg.codlen;
assign ph1 = d1.tp2.cg.subout;
wire peen1;
assign peen1 = d1.tp2.peen;




/////**************************************************************************************///////////////////////////////////////////////////////////////////////////
    decompressor d1 (
        .clk(clk),
        .first(first),
        .reset(reset),
        .data(data),
        .data2(data2),
        .j(j),
        .k(k),
        .n(n),
        .xref(xref),
        .xout(xout),
        .valid_in(valid_in)
     
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        first = 0;
        valid_in = 1;
        j = 5'b00011;
        k = 5'b00010;
        n = 5'b01010;

       data = 32'b0011_0101_0011_0101_0101_0101_0101_0101;
       xref = 10'b1010101110;

        // Apply rese
        #10 reset = 0;
        first = 1;
        data = 32'b1111_0100_1011_0111_0010_1101_0111_0101;
        data2 = 15'b010001010111010;
        #10 data = 32'b1001_0100_1011_0111_0110_1101_0111_1111;
        #45 first = 0;
        #10  data = 32'b1111_0100_1011_0111_1100_1111_0010_0101;
         data = 32'b1001_0100_1011_0111_0110_1101_0111_1111;
         
         #10  data = 32'b1111_0100_1011_0111_1100_1111_0010_0101;
         
         #10  data = ~(32'b1111_0100_1011_0111_1100_1111_1001_0101);
         #10  data = 32'b1111_0100_1011_0111_1100_1111_0010_0101;
         #10  data = 32'b1111_0100_1011_0111_1100_1111_0010_0101;
         #10  data = 32'b1111_0100_1011_0111_1010_1111_0010_0101;
         #10  data = 32'b1111_1111_1011_0111_1100_1111_0010_0101;#10  data = 32'b1111_0100_1011_0111_0011_1111_0010_0101;
         #10  data = 32'b1111_0100_1011_0000_1100_1111_0010_0101;
         #10  data = 32'b1111_0101_1011_0111_1100_1111_0010_0101;
         
         

        repeat (50) #10;
        
        


        $finish;
    end

endmodule
