//module tb_preprocessing;

//    // Inputs
//    reg [31:0] data;
//    reg clk1,clk2, reset, datavalid, start, stop, wren, rden;
//    reg [4:0] n, j, k;

//    // Outputs
//    wire [9:0] symbol;
//    wire [4:0] fscodes, kcodes;

//    // Instantiate the Unit Under Test (UUT)
//    preprocessing uut (
//        .data(data),
//        .clk1(clk1),
//        .clk2(clk2),
//        .reset(reset),
//        .datavalid(datavalid),
//        .start(start),
//        .stop(stop),
//        .wren(wren),
//        .rden(rden),
//        .n(n),
//        .j(j),
//        .k(k),
//        .symbol(symbol),
//        .fscodes(fscodes),
//        .kcodes(kcodes)
//    );
////////////////////////////////////////////////

////    wire [31:0] w1,w3,w2;
////    wire [15:0] w4;
////    wire w5;
////    wire [4:0] reml1, plen1;
////    wire [3:0] s1;
    

////    assign w3 = uut.fcds.dout;
////    assign w2 = uut.tpm.op.new_data_in;
////    assign w1 = uut.tpm.do;
////    assign w4 = uut.tpm.ip.in;
////    assign w5 = uut.tpm.cg.cout;
////    assign reml1 = uut.tpm.cg.remlendup;
////    assign plen1 = uut.tpm.cg.pencoderlen;
////    assign li = uut.tpm.cg.ldin;
////    assign lo = uut.tpm.cg.ldor;
////    assign s1 = uut.tpm.cp.state;
//assign s =  uut.tpm.op.pe.peen;

//    ///////////////////////////////////////
//    // Clock generation
//    initial begin
//        clk1 = 0;
//        forever begin
//            #2 clk1 = ~clk1;  // 100MHz
//        end
//    end
    
//       initial begin
//        clk2 = 0;
//        forever begin
//            #5 clk2 = ~clk2;  // 100MHz
//        end
//    end
    
////        initial begin
////        clk = 0;
////        forever begin
////            #5 clk = ~clk;  // 100MHz
////        end
////    end
    

////    initial begin
////        forever begin
////            #7 clk = ~clk;  // ~71MHz
////        end
////    end

//    // Stimulus
//    initial begin
//        // Initialize
//        data = 0;
//        reset = 1;
//        datavalid = 0;
//        start = 0;
//        stop = 0;
//        wren = 0;
//        rden = 0;
//        n = 5'd10;
//        j = 5'd4;
//        k = 5'd2;

//        #20;
//        reset = 0;

//        // Simulate valid input packet
//        #10;
//        datavalid = 1;
//        data = 32'hDAADBAEF;
//        #150;
//        wren = 1;
//        #10;
//           #10 data = 32'hCAFEBABE;
//        #10 data = 32'hCAFEBABE;
//        #10 data = 32'hCAFAAABE;
//        #10 data = 32'hCAFBABBE;
//        #10 data = 32'hCAFCACBE;
//        #10 data = 32'hCAFDDABE;
//        #10 data = 32'hCAFADEBE;
//        data = 32'hCAFEBABE;
//        #10;
//        datavalid = 0;
//        wren = 0;

//        // Wait some time
//        #30;

//        // Start reading and processing
//        rden = 1;
//        start = 1;
//        #10;
     
//        start = 1;

//        #250;

//        // Simulate stop
//        stop = 1;
//        #10;
//        stop = 0;
//        rden = 0;

//        #100;
//        $finish;
//    end

//    // Monitor outputs
//    initial begin
//        $display("Time\tSymbol\tFSCodes\tKCodes");
//        $monitor("%0t\t%0d\t%0d\t%0d", $time, symbol, fscodes, kcodes);
//    end

//endmodule

module tb_preprocessing;

    // Inputs
    reg [31:0] data;
    reg [9:0] xref;
    reg clk1,clk2, reset, datavalid, start, stop, wren,cdsdatavalid;
    reg [5:0] n, j, k;

    // Outputs
    wire [319:0] symbol, xout;
    wire [319:0] fscodes, kcodes;

    // Instantiate the Unit Under Test (UUT)
    preprocessing uut (
        .data(data),
        .clk1(clk1),
        .clk2(clk2),
        .reset(reset),
        .datavalid(datavalid),
        .start(start),
        .stop(stop),
        .wren(wren),
        .xref(xref),
//        .rden(rden),
        .n(n),
        .j(j),
        .k(k),
        .symbol(symbol),
        .fscodes(fscodes),
        .kcodes(kcodes),
        .xout(xout),
        .cdsdatavalid(cdsdatavalid)
    );

wire [63:0] do,ipp;
wire [5:0] rle,cle;
//wire [5:0] ship,shcg,shipcarry,subout1,count_fs,countsy,count_k;
//wire [9:0] penc;
wire [31:0]packetdata;
wire [319:0]fsone,kone;
wire [47:0] packethead,buffer;

assign packethead = uut.ph.header;
assign buffer = uut.ph.buffer;
assign packetdata = uut.ph.packetdata;
assign do = uut.tpm.op.do;
assign ipp = uut.tpm.ip.mux_out;
assign carry = uut.tpm.cg.cout;
assign rle = uut.tpm.cg.remlendup;
assign cle = uut.tpm.cg.pencoderlen;
//assign ship = uut.tpm.ip.rotate;
//assign shcg = uut.tpm.cg.pencoderlen;
//assign shipcarry = uut.tpm.ip.bitalign;
//assign subout1 = uut.tpm.cg.subout;
//assign count_fs = uut.tpm.ip.fs_count;
//assign countsy = uut.tpm.sy.count;
//assign count_k = uut.tpm.ip.rem_count;
//assign penc = uut.tpm.op.pencoderlen;
//assign phop = uut.tpm.op.phase;
//assign peen1 = uut.tpm.op.peen;
//assign c2zeroo = uut.tpm.ip.c2zero;
//assign c1zeroo = uut.tpm.ip.c1zero;
assign syvalid = uut.tpm.op.valid;
assign ldin = uut.tpm.cp.ldin;
//assign dout = uut.fcds.dout;
assign fsone = uut.tpm.op.fsone;
assign kone = uut.tpm.op.kone;
//assign valid = uut.tpm.op.valid;
//assign fsvalid = uut.tpm.op.fsvalid;
//assign kvalid = uut.tpm.op.kvalid;
//assign fsshow = uut.tpm.op.fsshow;
//assign kshow = uut.tpm.op.kshow;
    // Clock generation
    initial begin
        clk1 = 0;
        forever begin
            #5 clk1 = ~clk1;  // 100MHz
        end
    end
    
       initial begin
        clk2 = 0;
        forever begin
            #10 clk2 = ~clk2;  // 100MHz
        end
    end

    // Stimulus
    initial begin
        // Initialize
        data = 0;
        reset = 1;
        datavalid = 0;
        cdsdatavalid = 0;
        start = 0;
        stop = 0;
        wren = 0;
        xref = 10'b0101110101;
//        rden = 0;
        n = 6'd10;
        j = 6'd32;
        k = 6'd2;

        #20;
        reset = 0;

        // Simulate valid input packet
        #10;
        wren = 1;
        data = 32'b10100101101010000101011001001101;
        #10 data = 32'b11100101101010000101011001000101;
        #10 data = 32'b11000101101010000101011001110101;
        #5 datavalid = 1;
        
        #5 cdsdatavalid = 1;
        #20 cdsdatavalid = 0;
        #150;
        wren = 1;
        #10;
//                data = 32'hDAADBAEF;
//           #10 data = 32'b00000100101010010001000001000001;
//        #10 data = 32'b00000100101010010001000001000001;
//        #10 data = 32'hCAFAAABE;
//        #10 data = 32'hCAFBABBE;
//        #10 data = 32'hCAFCACBE;
//        #10 data = 32'hCAFDDABE;
//        #10 data = 32'hCAFADEBE;
//        data = 32'hCAFEBABE;
//        #10 data = 32'hAFABCABE;
//        #10 data = 32'hCAEEEABE;
//        #10 data = 32'hCBACABBE;
//        #10 data = 32'hCDAFACBE;
//        #10 data = 32'hCAFDDABE;
//        #10 data = 32'hCAAADEBE;
//        data = 32'hCAFEBACC;
//        #10 data = 32'hCCAEBABE;
//        #10 data = 32'b10100100010000100000100000010001;
//        #10 data = 32'hCAFBACCE;
//        #10 data = 32'hCAFCADDE;
//        #10 data = 32'hCAFDDEEE;
//        #10 data = 32'hCAFADFFE;
//        data = 32'b00000100101010010001000001000001;
        #20;
        @(posedge clk2)
            data = 32'hCABDBAEF; 
        @(posedge clk2);
            data = 32'hCAADDAEF;
        @(posedge clk2);
        data = 32'hEAADBAEF;
        @(posedge clk2);
        data = 32'hFAADBAEF;
        @(posedge clk2);
        data = 32'hCAAABAEF;
        @(posedge clk2);
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
//        data = 32'hFAADBAEF;
        #10;
        datavalid = 1;
        wren = 0;

        // Wait some time
        #30;

//        // Start reading and processing
//        rden = 1;
        start = 1;
        #10;
     
        start = 1;

        #250;

        // Simulate stop
        stop = 0;
        #10;
        stop = 0;
//        rden = 0;

        #100;
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tSymbol\tFSCodes\tKCodes");
        $monitor("%0t\t%0d\t%0d\t%0d", $time, symbol, fscodes, kcodes);
    end

endmodule