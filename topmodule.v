module topmodule(
    input clk,clkh,start,stop,
    input reset,
    input [31:0] ipdata,  
    input [31:0] ordata,    
    input [5:0] k,            
    input [5:0] j,n,
    output cout,
    output [319:0] fscodes,
    output [319:0] kcodes,
    output [319:0] symbol,
    output ldin,ldor
);
wire [5:0] pencoderlen,remlendup;
wire [9:0] pencoderout;
wire c1zero,c2zero;
wire [63:0] ipout,do;
wire phaseor,valid;
inputplane ip (.in(ipdata),.clk(clk),.reset(reset),.shamt(pencoderlen),.cout(cout),.crl(remlendup),.ldin(ldin),.ipout(ipout),.j(j),.k(k), .c1zero(c1zero), .c2zero(c2zero),.ldor(ldor));
orplane op(.clk(clk),.reset(reset),.ldor(ldor),.pencoderlen(pencoderlen),.pencoderout(pencoderout) ,.cout(cout),.new_data_in(ordata),
.ipplane(ipout),.do(do),.j(j),.k(k),.fsdecoded(fscodes),.kdecoded(kcodes),.peen(peen),.phaseor(phaseor),.valid(valid));
controlpath cp(.start(start),.stop(stop),.reset(reset),.j(j),.k(k),.c1zero(c1zero),.c2zero(c2zero),
.cout(cout),.ldin(ldin),.ldor(ldor),.peen(peen),.clk(clk));
carrygenerator cg(.clk(clk),.reset(reset),.ldor(ldor),.pencoderlen(pencoderlen),.cout(cout),.remlendup(remlendup),.ldin(ldin),.k(k),.phase(phaseor));
symbol sy(.clk(clk),.reset(reset),.fsdecoded(fscodes),.kdecoded(kcodes),.symbol(symbol),.j(j),.n(n),.k(k),.ldor(ldor),.valid(valid));
endmodule
