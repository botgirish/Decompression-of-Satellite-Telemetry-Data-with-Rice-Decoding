
// main tb
module topmodule_tb;

    // Inputs
    reg clk,start,stop;
    reg reset;
    reg [31:0] ordata;
    reg [31:0] ipdata;
    reg [5:0] k,j;
    // Outputs
    wire [63:0] do; // [31:0]
    wire [319:0] fscodes,kcodes;
    wire cout;
    wire [319:0] symbol;
    // Instantiate the DUT (Device Under Test)
    topmodule tp1 (
        .clk(clk),
        .start(start),
        .stop(stop),
        .reset(reset),
        .ipdata(ipdata),
        .ordata(ordata),
        .j(j),
        .k(k),
        .fscodes(fscodes),
        .kcodes(kcodes),
        .cout(cout),
        .symbol(symbol)
    );
    assign do = tp1.op.do;
wire [31:0] ipdata1;
wire [5:0] shamt1,crl1,c1;
assign shamt1 = tp1.ip.rotate;
assign crl1 = tp1.ip.crl;
wire [63:0] ipout1;
assign ipdata1 = tp1.ip.in;
assign ipout1 = tp1.ip.ipout;
wire ldin1;
assign ldin1 = tp1.ip.ldin;
assign p1 = tp1.ip.phase;
assign cout1 = tp1.cg.cout;
wire [9:0] fsd1;
assign fsd1 = tp1.sy.kd[0];
assign c1 = tp1.sy.count;
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus logic
    initial begin
        // Initialize inputs
        reset = 1;
        start=1;
        stop=0;

        j = 6'b100000;
        k = 6'b000010;
        ipdata = 32'b11110000111100001111000011110000;
        ordata = 32'b0011_0101_0011_0100_0101_0101_0101_0101;

        // Apply rese
        #10 reset = 0;
         ipdata = 32'b11110000111100001111000011110000;
        #7  ipdata = 32'b11110000111100001111000011110000;
        #10  ipdata = 32'b11110000111100001111000011110000;
         #10 ipdata = 32'b11110000111100001111000011110000;
        ipdata = 32'b11110000111100001111000011110000;

        // Apply rese

        #725 
               ipdata = 32'b11110000111100001111000011110000;
        ordata = 32'b0000_0101_1111_0000_0101_1011_0010_0001;

        repeat (5000) #10;
        stop = 1;
        
     
//        assign msb = dut.sb1.result;

        $finish;
    end

endmodule