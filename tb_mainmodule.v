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

module tb_mainmodule;

    // Inputs
    reg [31:0] data;
    reg clk1,clk2, reset,go;
    reg [5:0] n, j, k;

    // Outputs
    wire [319:0] symbol;
    wire [319:0] fscodes, kcodes;

    // Instantiate the Unit Under Test (UUT)
    mainmodule mm (
        .data(data),
        .clk1(clk1),
        .clk2(clk2),
        .reset(reset),
        .go(go),
        .n(n),
        .j(j),
        .k(k),
        .symbol(symbol),
        .fscodes(fscodes),
        .kcodes(kcodes)
    );
    wire [31:0] ffout,inpin;
    wire [63:0] do,ipp,ipinput,dff_out,rotated;
    wire [5:0] rotate;
    assign ffout = mm.pp.fcds.dout;
    assign rd = mm.pp.fcds.rd_en;
    assign do = mm.pp.tpm.op.do;
    assign ipp = mm.pp.tpm.ip.mux_out;
    assign inpin = mm.pp.tpm.ip.in;
    assign ipinput = mm.pp.tpm.ip.ipinput;
    assign dff_out = mm.pp.tpm.ip.dff_out;
    assign rotated = mm.pp.tpm.ip.rotated;
    assign rotate = mm.pp.tpm.ip.rotate;

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
        go = 1;
        n = 6'd10;
        j = 6'd32;
        k = 6'd2;

        #20;
        reset = 0;

        // Simulate valid input packet
        #10;
        data = 32'hCAADBAEF;
        #150;
        #10;
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
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;
        data = 32'hCAADBAEF;



        // Wait some time
        #30;

        // Start reading and processing

        #10;
     


        #250;

        // Simulate stop

        #10;


        #100;
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tSymbol\tFSCodes\tKCodes");
        $monitor("%0t\t%0d\t%0d\t%0d", $time, symbol, fscodes, kcodes);
    end

endmodule