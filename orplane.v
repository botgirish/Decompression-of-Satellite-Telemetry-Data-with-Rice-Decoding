//module orplane (
//    input clk,
//    input reset,             
//    input ldor,  
//    input peen,
////    input fsk,        
//    input cout,        
//    input [5:0] j,      // 6-bit for J=64
//    input [4:0] k,             
//    input [31:0] new_data_in,
//    input [31:0] ipplane, 
//    output [4:0] pencoderout,
//    output [4:0] pencoderlen,
//    output reg [31:0] do,
//    output reg [4:0][0:31] fsdecoded , // J=64 // [31:0]
//    output reg [4:0][0:31] kdecoded // [31:0]
//);



//reg [4:0] count1, count2;
//reg phase;
//wire [4:0] shift_amt = phase ? k : pencoderlen; 
//wire [31:0] orout = do;

//reg [31:0] shifted_k;

////pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(phase == 0));
//pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(peen),.clk(clk),.reset(reset));


//always @(posedge clk or posedge reset) begin
////orout <= do;
//    if (reset) begin
//        count1 <= j;
//        count2 <= j;
//        phase <= 0;
//        do <= 0;
////        fsdecoded <= 5'b00000;
//    end else if (ldor) begin
//        count1 <= j;
//        count2 <= j;
//        phase <= 0;
//        do <= new_data_in;
//    end else begin
//        if (!phase) begin
//            // FS Phase
//            do <= cout ? (do << pencoderlen) | ipplane : do << pencoderlen;
//            fsdecoded <= pencoderout;
//            count1 <= count1 - 1;
//            if (count1 == 0) begin phase <= 1; count1 <= j; end
//        end else begin
//            // Remainder Phase
//            shifted_k <= do >> (32 - k);
//    kdecoded <= (shifted_k & ((1 << k) - 1)) & 5'b11111;
//            do <= cout ? (do << k) | ipplane : do << k;
//            count2 <= count2 - 1;
//            if (count2 == 0) begin phase <= 0; count2 <= j;  end
//        end
//    end
////     count1 <= j;
////     count2 <= j;
//end
//endmodule

  /////////////***********Currently working on*****************************
//module orplane (
//    input clk,
//    input reset,             
//    input ldor,  
//    input peen,
////    input fsk,        
//    input cout,        
//    input [5:0] j,      // 6-bit for J=64
//    input [5:0] k,             
//    input [31:0] new_data_in,
//    input [63:0] ipplane, 
//    output [9:0] pencoderout,
//    output [5:0] pencoderlen,
//    output reg [63:0] do,
//    output reg phaseor,
//    output [319:0] fsdecoded,
//    output [319:0]kdecoded,
//    output reg valid
//);

//reg fsvalid, kvalid;
//wire validdup,fsvalid,kvalid;
//reg [319:0] fsone, kone;
//reg [1:0] ldcount;
//reg [5:0] count1, count2;
//reg phase;
//wire [5:0] shift_amt = phase ? k : pencoderlen; 
//wire [63:0] orout = do;

//reg [9:0] fsdecoded_arr [0:31];
//reg [9:0] kdecoded_arr [0:31];

//reg [63:0] shifted_k;
//reg [63:0] check;

//assign fsdecoded = {
//    fsdecoded_arr[0], fsdecoded_arr[1], fsdecoded_arr[2], fsdecoded_arr[3],
//    fsdecoded_arr[4], fsdecoded_arr[5], fsdecoded_arr[6], fsdecoded_arr[7],
//    fsdecoded_arr[8], fsdecoded_arr[9], fsdecoded_arr[10], fsdecoded_arr[11],
//    fsdecoded_arr[12], fsdecoded_arr[13], fsdecoded_arr[14], fsdecoded_arr[15],
//    fsdecoded_arr[16], fsdecoded_arr[17], fsdecoded_arr[18], fsdecoded_arr[19],
//    fsdecoded_arr[20], fsdecoded_arr[21], fsdecoded_arr[22], fsdecoded_arr[23],
//    fsdecoded_arr[24], fsdecoded_arr[25], fsdecoded_arr[26], fsdecoded_arr[27],
//    fsdecoded_arr[28], fsdecoded_arr[29], fsdecoded_arr[30], fsdecoded_arr[31]
//};

//assign kdecoded = {
//    kdecoded_arr[0], kdecoded_arr[1], kdecoded_arr[2], kdecoded_arr[3],
//    kdecoded_arr[4], kdecoded_arr[5], kdecoded_arr[6], kdecoded_arr[7],
//    kdecoded_arr[8], kdecoded_arr[9], kdecoded_arr[10], kdecoded_arr[11],
//    kdecoded_arr[12], kdecoded_arr[13], kdecoded_arr[14], kdecoded_arr[15],
//    kdecoded_arr[16], kdecoded_arr[17], kdecoded_arr[18], kdecoded_arr[19],
//    kdecoded_arr[20], kdecoded_arr[21], kdecoded_arr[22], kdecoded_arr[23],
//    kdecoded_arr[24], kdecoded_arr[25], kdecoded_arr[26], kdecoded_arr[27],
//    kdecoded_arr[28], kdecoded_arr[29], kdecoded_arr[30], kdecoded_arr[31]
//};


////pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(phase == 0));
////pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(peen),.clk(clk),.reset(reset));
//pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(~phase),.reset(reset));


//always @(posedge clk or posedge reset) begin
////orout <= do;
//    if (reset) begin
//        count1 <= j;
//        count2 <= j;
//        phase <= 0;
//        do <= 0;
//        check <= 0;
//        ldcount <= 0;
////        fsdecoded <= 5'b00000;
//    end else if (ldor && (ldcount==0)) begin
//        count1 <= j;
//        count2 <= j;
//        phase <= 0;
//        do[63:32] <= new_data_in;
//        check[63:32] <= new_data_in;
//        ldcount <= ldcount+1;
//    end 
//        else if(ldor && (ldcount==1)) begin
//         count1 <= j;
//        count2 <= j;
//        phase <= 0;
//        do[31:0] <= new_data_in;
//        check[31:0] <= new_data_in;
//        ldcount <= ldcount+1;           
//        end
//    else begin
//        if (!phase) begin
//            // FS Phase
//            do <= cout ? (do << pencoderlen) | ipplane : do << pencoderlen;
//            fsdecoded_arr[j-count1] <= pencoderout;
//            count1 <= count1 - 1;
//            fsvalid <= 0;
//            if (count1 == 1) begin phase <= 1; count1 <= j; fsvalid <= 1; end
//        end else begin
//            // Remainder Phase
//             do <= cout ? (do << k) | ipplane : do << k;
//            shifted_k <= do >> (64 - k);
//    kdecoded_arr[j-count2] <= (shifted_k & ((1 << k) - 1)) & 10'b1111111111;
//            count2 <= count2 - 1;
//            kvalid <= 0;
//            if (count2 == 1) begin phase <= 0; count2 <= j; kvalid <= 1;  end
//        end
//    end
////     count1 <= j;
////     count2 <= j;
//phaseor <= phase;
//end
//assign validdup = (fsvalid && kvalid);
//always @(posedge clk)
//    valid <= validdup;
//endmodule







//******************************************************************************************************************************************
module orplane (
    input clk,
    input reset,             
    input ldor,  
    input peen,
//    input fsk,        
    input cout,        
    input [5:0] j,      // 6-bit for J=64
    input [5:0] k,             
    input [31:0] new_data_in,
    input [63:0] ipplane, 
    output [9:0] pencoderout,
    output [5:0] pencoderlen,
    output reg [63:0] do,
    output reg phaseor,
    output [319:0] fsdecoded,
    output [319:0]kdecoded,
    output reg valid
);

reg fsvalid, kvalid,fsshow,kshow;
wire validdup;
reg [319:0] fsone, kone;
reg [1:0] ldcount;
reg [5:0] count1, count2;
reg phase;
wire [5:0] shift_amt = phase ? k : pencoderlen; 
wire [63:0] orout = do;

reg [9:0] fsdecoded_arr [0:31];
reg [9:0] kdecoded_arr [0:31];

reg [63:0] shifted_k;
reg [63:0] check;

assign fsdecoded = {
    fsdecoded_arr[0], fsdecoded_arr[1], fsdecoded_arr[2], fsdecoded_arr[3],
    fsdecoded_arr[4], fsdecoded_arr[5], fsdecoded_arr[6], fsdecoded_arr[7],
    fsdecoded_arr[8], fsdecoded_arr[9], fsdecoded_arr[10], fsdecoded_arr[11],
    fsdecoded_arr[12], fsdecoded_arr[13], fsdecoded_arr[14], fsdecoded_arr[15],
    fsdecoded_arr[16], fsdecoded_arr[17], fsdecoded_arr[18], fsdecoded_arr[19],
    fsdecoded_arr[20], fsdecoded_arr[21], fsdecoded_arr[22], fsdecoded_arr[23],
    fsdecoded_arr[24], fsdecoded_arr[25], fsdecoded_arr[26], fsdecoded_arr[27],
    fsdecoded_arr[28], fsdecoded_arr[29], fsdecoded_arr[30], fsdecoded_arr[31]
};

assign kdecoded = {
    kdecoded_arr[0], kdecoded_arr[1], kdecoded_arr[2], kdecoded_arr[3],
    kdecoded_arr[4], kdecoded_arr[5], kdecoded_arr[6], kdecoded_arr[7],
    kdecoded_arr[8], kdecoded_arr[9], kdecoded_arr[10], kdecoded_arr[11],
    kdecoded_arr[12], kdecoded_arr[13], kdecoded_arr[14], kdecoded_arr[15],
    kdecoded_arr[16], kdecoded_arr[17], kdecoded_arr[18], kdecoded_arr[19],
    kdecoded_arr[20], kdecoded_arr[21], kdecoded_arr[22], kdecoded_arr[23],
    kdecoded_arr[24], kdecoded_arr[25], kdecoded_arr[26], kdecoded_arr[27],
    kdecoded_arr[28], kdecoded_arr[29], kdecoded_arr[30], kdecoded_arr[31]
};


//pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(phase == 0));
//pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(peen),.clk(clk),.reset(reset));
pencoder pe(.in(orout), .out(pencoderout), .len(pencoderlen), .peen(~phase),.reset(reset));


always @(posedge clk or posedge reset) begin
//orout <= do;
    if (reset) begin
        count1 <= j;
        count2 <= j;
        phase <= 0;
        do <= 0;
        check <= 0;
        ldcount <= 0;
//        fsdecoded <= 5'b00000;
    end else if (ldor && (ldcount==0)) begin
        count1 <= j;
        count2 <= j;
        phase <= 0;
        do[63:32] <= new_data_in;
        check[63:32] <= new_data_in;
        ldcount <= ldcount+1;
    end 
        else if(ldor && (ldcount==1)) begin
         count1 <= j;
        count2 <= j;
        phase <= 0;
        do[31:0] <= new_data_in;
        check[31:0] <= new_data_in;
        ldcount <= ldcount+1;           
        end
    else begin
        if (!phase) begin
            // FS Phase
            do <= cout ? (do << pencoderlen) | ipplane : do << pencoderlen;
            fsdecoded_arr[j-count1] <= pencoderout;
            count1 <= count1 - 1;
            fsvalid <= 0;
            fsshow <= 0;
            if (count1 == 1) begin phase <= 1; count1 <= j; fsvalid <= 1; fsshow <= 1; end
        end else begin
            // Remainder Phase
             do <= cout ? (do << k) | ipplane : do << k;
            shifted_k <= do >> (64 - k);
    kdecoded_arr[j-count2] <= (shifted_k & ((1 << k) - 1)) & 10'b1111111111;
            count2 <= count2 - 1;
            kvalid <= 0;
            kshow <= 0;
            if (count2 == 1) begin phase <= 0; count2 <= j; kvalid <= 1; kshow <= 1; end
        end
    end
//     count1 <= j;
//     count2 <= j;
phaseor <= phase;
end
assign validdup = (fsvalid && kvalid);
always @(posedge clk)
    valid <= validdup;
    
always@(posedge clk) begin
    if(fsshow) begin
        fsone <= fsdecoded;
    end
    else if(kshow) begin
        kone <= kdecoded;
    end
end
endmodule





