module invpre (
    input clk,
    input reset,
    input [5:0] j,
    input [9:0] xref,
    input [319:0] symbol,
    output reg [319:0] xout
);

    reg [9:0] x_prev [0:31];
    reg signed [10:0] Delta [0:31];
    reg [9:0] theta [0:31];
    reg [5:0] count;

    reg [9:0] xoutreg [0:31];

    wire [9:0] symbolreg [0:31];
    wire signed [10:0] x_sum;
    wire [9:0] x_mod;
    wire [4:0] idx = j - count;

    genvar k;
    generate
        for (k = 0; k < 32; k = k + 1) begin : unpack_symbol
            assign symbolreg[k] = symbol[319 - 10*k -: 10];
        end
    endgenerate
    wire [9:0] theta_curr;
    assign theta_curr = (x_prev[idx] >= (1 << 9)) ?
                         x_prev[idx] :
                         ((1 << 10) - 1 - x_prev[idx]);
    wire signed [10:0] delta_val = (symbolreg[idx] <= 2 * theta_curr) ?
                                    (symbolreg[idx][0] ? 
                                        -((symbolreg[idx] + 1) >> 1) :
                                         (symbolreg[idx] >> 1)) :
                                    ((theta_curr == x_prev[idx]) ?
                                        (symbolreg[idx] - theta_curr) :
                                        (theta_curr - symbolreg[idx]));
    assign x_sum = x_prev[idx] + delta_val;
    assign x_mod = x_sum[9:0]; // 10-bit wrap-around
    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                x_prev[i]   <= 0;
                Delta[i]    <= 0;
                theta[i]    <= 0;
                xoutreg[i]  <= 0;
            end
            x_prev[31] <= xref;
            count <= j;
        end else if (count != 0) begin
            Delta[idx] <= delta_val;
            theta[idx] <= theta_curr;
            x_prev[idx] <= x_mod;
            xoutreg[idx] <= x_mod;
            count <= count - 1;
        end
    end

    always @(posedge clk) begin
        xout <= { xoutreg[0], xoutreg[1], xoutreg[2], xoutreg[3],
                  xoutreg[4], xoutreg[5], xoutreg[6], xoutreg[7],
                  xoutreg[8], xoutreg[9], xoutreg[10], xoutreg[11],
                  xoutreg[12], xoutreg[13], xoutreg[14], xoutreg[15],
                  xoutreg[16], xoutreg[17], xoutreg[18], xoutreg[19],
                  xoutreg[20], xoutreg[21], xoutreg[22], xoutreg[23],
                  xoutreg[24], xoutreg[25], xoutreg[26], xoutreg[27],
                  xoutreg[28], xoutreg[29], xoutreg[30], xoutreg[31] };
    end

endmodule
