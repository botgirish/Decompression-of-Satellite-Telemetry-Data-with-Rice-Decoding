module symbol(
    input clk,reset,ldor,valid,
    input [319:0] fsdecoded,
    input [319:0] kdecoded,
    input [5:0] j,n,k,
    output reg [319:0] symbol
    );
    reg [9:0]symbol_reg[0:31];
    wire [319:0] symbolout;  
 wire [9:0] fsd [0:31];
assign fsd[0]  = fsdecoded[319:310];
assign fsd[1]  = fsdecoded[309:300];
assign fsd[2]  = fsdecoded[299:290];
assign fsd[3]  = fsdecoded[289:280];
assign fsd[4]  = fsdecoded[279:270];
assign fsd[5]  = fsdecoded[269:260];
assign fsd[6]  = fsdecoded[259:250];
assign fsd[7]  = fsdecoded[249:240];
assign fsd[8]  = fsdecoded[239:230];
assign fsd[9]  = fsdecoded[229:220];
assign fsd[10] = fsdecoded[219:210];
assign fsd[11] = fsdecoded[209:200];
assign fsd[12] = fsdecoded[199:190];
assign fsd[13] = fsdecoded[189:180];
assign fsd[14] = fsdecoded[179:170];
assign fsd[15] = fsdecoded[169:160];
assign fsd[16] = fsdecoded[159:150];
assign fsd[17] = fsdecoded[149:140];
assign fsd[18] = fsdecoded[139:130];
assign fsd[19] = fsdecoded[129:120];
assign fsd[20] = fsdecoded[119:110];
assign fsd[21] = fsdecoded[109:100];
assign fsd[22] = fsdecoded[99:90];
assign fsd[23] = fsdecoded[89:80];
assign fsd[24] = fsdecoded[79:70];
assign fsd[25] = fsdecoded[69:60];
assign fsd[26] = fsdecoded[59:50];
assign fsd[27] = fsdecoded[49:40];
assign fsd[28] = fsdecoded[39:30];
assign fsd[29] = fsdecoded[29:20];
assign fsd[30] = fsdecoded[19:10];
assign fsd[31] = fsdecoded[9:0];
wire [9:0] kd [0:31];
assign kd[0]  = kdecoded[319:310];
assign kd[1]  = kdecoded[309:300];
assign kd[2]  = kdecoded[299:290];
assign kd[3]  = kdecoded[289:280];
assign kd[4]  = kdecoded[279:270];
assign kd[5]  = kdecoded[269:260];
assign kd[6]  = kdecoded[259:250];
assign kd[7]  = kdecoded[249:240];
assign kd[8]  = kdecoded[239:230];
assign kd[9]  = kdecoded[229:220];
assign kd[10] = kdecoded[219:210];
assign kd[11] = kdecoded[209:200];
assign kd[12] = kdecoded[199:190];
assign kd[13] = kdecoded[189:180];
assign kd[14] = kdecoded[179:170];
assign kd[15] = kdecoded[169:160];
assign kd[16] = kdecoded[159:150];
assign kd[17] = kdecoded[149:140];
assign kd[18] = kdecoded[139:130];
assign kd[19] = kdecoded[129:120];
assign kd[20] = kdecoded[119:110];
assign kd[21] = kdecoded[109:100];
assign kd[22] = kdecoded[99:90];
assign kd[23] = kdecoded[89:80];
assign kd[24] = kdecoded[79:70];
assign kd[25] = kdecoded[69:60];
assign kd[26] = kdecoded[59:50];
assign kd[27] = kdecoded[49:40];
assign kd[28] = kdecoded[39:30];
assign kd[29] = kdecoded[29:20];
assign kd[30] = kdecoded[19:10];
assign kd[31] = kdecoded[9:0];
  assign  symbolout = {
        symbol_reg[0], symbol_reg[1], symbol_reg[2], symbol_reg[3],
        symbol_reg[4], symbol_reg[5], symbol_reg[6], symbol_reg[7],
        symbol_reg[8], symbol_reg[9], symbol_reg[10], symbol_reg[11],
        symbol_reg[12], symbol_reg[13], symbol_reg[14], symbol_reg[15],
        symbol_reg[16], symbol_reg[17], symbol_reg[18], symbol_reg[19],
        symbol_reg[20], symbol_reg[21], symbol_reg[22], symbol_reg[23],
        symbol_reg[24], symbol_reg[25], symbol_reg[26], symbol_reg[27],
        symbol_reg[28], symbol_reg[29], symbol_reg[30], symbol_reg[31]
    }; 
   reg [5:0] count;
    integer i;
always @(posedge clk) begin
    if (reset || ldor) begin
        for (i = 0; i < j; i = i + 1)
            symbol_reg[i] <= 10'd0;
        count <= j;
    end
        else  begin
    symbol_reg[j-count] <= (fsd[j-count]<<k)| kd[j-count];
    count <= count-1;
        if(count == 1) begin  count <= j; end
        if(valid) symbol <= symbolout;
        end
    end
endmodule
