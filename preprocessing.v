//module preprocessing(
//        input [31:0] data,
//        input clk1,clk2, reset, datavalid,start,stop,wren,rden,
//        input [4:0] n,j,k,
//        output [9:0] symbol,
//        output [4:0] fscodes,kcodes
//    );
//    wire full,empty;
//    wire [31:0] pdata,cdsdata,alignedcds;
//    wire [47:0] cdsheaderout;
//    dff48bit ph(.clk(clk1),.reset(reset),.data(data),.datavalid(datavalid),.packetdata(pdata),.pvalid(pvalid));
//    cdsheader cdsh (.clk(clk1),.reset(reset),.valid_in(pvalid),.payload_in(pdata),.n(n),.header_out(cdsheaderout),.data_out(cdsdata),.valid_out(cdsvalid));
//    fifonew fcds(.rst(reset),.rd_clk(clk1),.wr_clk(clk2),.wr_en(wren),.rd_en(rden),.full(full),.empty(empty),.din(cdsdata),.dout(alignedcds));
//    topmodule tpm(.clk(clk1),.reset(reset),.start(start),.stop(stop),.reset(reset),.ipdata(alignedcds),.ordata(alignedcds),.j(j),.k(k),.fscodes(fscodes),.kcodes(kcodes),.symbol(symbol));
//endmodule


//********************Original***********************************


//module preprocessing(
//        input [31:0] data,
//        input clk1,clk2, reset, datavalid,start,stop,wren,rden,
//        input [5:0] n,j,k,
//        output [9:0] symbol,
//        output [9:0] fscodes,kcodes
//    );
//    wire full,empty;
//    wire [31:0] pdata,cdsdata,alignedcds;
//    wire [47:0] cdsheaderout;
//    dff48bit ph(.clk(clk1),.reset(reset),.data(data),.datavalid(datavalid),.packetdata(pdata),.pvalid(pvalid));
//    cdsheader cdsh (.clk(clk1),.reset(reset),.valid_in(pvalid),.payload_in(pdata),.n(n),.header_out(cdsheaderout),.data_out(cdsdata),.valid_out(cdsvalid));
//    fifonew fcds(.rst(reset),.rd_clk(clk1),.wr_clk(clk2),.wr_en(wren),.rd_en(rden),.full(full),.empty(empty),.din(cdsdata),.dout(alignedcds));
//    topmodule tpm(.clk(clk1),.reset(reset),.start(start),.stop(stop),.reset(reset),.ipdata(alignedcds),.ordata(alignedcds),.j(j),.k(k),.fscodes(fscodes),.kcodes(kcodes),.symbol(symbol));
//endmodule



module preprocessing(
        input [31:0] data,
        input clk1,clk2, reset, datavalid,start,stop,wren,cdsdatavalid,  //rden
        input [5:0] n,j,k,
        input [9:0] xref,
        output [319:0] symbol, xout,
        output [319:0] fscodes,kcodes
    );
    
    wire full,empty,ldin,cdsvalid,ldor;
    wire [31:0] alignedcds,pdata,cdsdata;
    wire [4:0] cdsheaderout;
    wire w1;
    assign w1 = ldin || ldor;
    dff48bit ph(.clk(clk1),.reset(reset),.data(data),.datavalid(datavalid),.packetdata(pdata),.pvalid(pvalid));
    cdsheader cdsh (.clk(clk1),.reset(reset),.valid_in(cdsdatavalid),.payload_in(pdata),.n(n),.header_out(cdsheaderout),.data_out(cdsdata),.valid_out(cdsvalid));
    fifonew fcds(.rst(reset),.rd_clk(clk1),.wr_clk(clk2),.wr_en(wren),.rd_en(w1),.full(full),.empty(empty),.din(cdsdata),.dout(alignedcds));
    topmodule tpm(.clk(clk2),.clkh(clk1),.reset(reset),.start(start),.stop(stop),.reset(reset),.ipdata(alignedcds),.ordata(alignedcds),.j(j),.k(k),.fscodes(fscodes),.kcodes(kcodes),.symbol(symbol),.ldin(ldin),.n(n),.ldor(ldor));
    invpre invp(.clk(clk1),.reset(reset),.xref(xref),.j(j),.symbol(symbol),.xout(xout));
endmodule