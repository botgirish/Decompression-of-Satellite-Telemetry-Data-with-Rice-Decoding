//*******************************************************************************************************************
module carrygenerator(
        input clk,reset,ldor, ldin,phase,
        input [5:0] pencoderlen,
        input [5:0] k,
        output cout,
        output [5:0] remlendup
    ); 
    wire [5:0] subout;
reg [5:0] remlen;
wire [5:0] w1;
wire [5:0] addout,codlen;
reg [5:0]  clength;
 wire [5:0] remainiglength = (ldor | reset) ? 6'b111111 : remlendup;
    dff5bit dcl(.in(pencoderlen),.clk(clk),.reset(reset),.out(codlen));
    subtractor_5bit sb1(.A(remainiglength),.B(clength),.result(subout));
    assign w1= {~subout[5],5'b0};
    adder5bit a1(.in1(w1),.in2(subout),.out(addout));
    dff5bit dcrl(.in(addout),.clk(clk),.reset(reset),.out(remlendup));
    assign cout = ~subout[5];
    
    always@(posedge clk) begin
        if(reset)
            clength <= 0;
        else if(phase) begin
            clength <= k;
        end
        else
            clength <= codlen ;
    end

endmodule

