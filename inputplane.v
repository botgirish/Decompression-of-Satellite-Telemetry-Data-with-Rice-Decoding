/// *************************************original 64 bit
module inputplane(
    input [31:0] in,
    input clk,
    input reset, ldor,
    input [5:0] k,j,
    input cout,
    input [5:0] crl,shamt,
    input ldin,
    output [63:0] ipout,
    output reg c1zero, c2zero
);
wire [63:0] ipinput = {in, 32'b0};
wire [5:0] bitalign = 64 - crl;
wire [63:0] aligned_input, rotated, mux_out;
reg [63:0] dff_out;
reg [5:0] rotate,fs_count, rem_count;
reg phase;
leftrotor lr1 (.in(ipinput), .shamt(bitalign), .out(aligned_input));
leftrotor lr2 (.in(dff_out), .shamt(rotate), .out(rotated));
mux21 m1 (.in1(aligned_input), .in2(rotated), .sel(~cout), .out(mux_out)); //~cout
always @(posedge clk or posedge reset) begin
    if (reset) begin
        fs_count <= j; rem_count <= j;
        phase <= 0; rotate <= 0;
        dff_out <= 0;
        c1zero <= 0; c2zero <= 0;
    end else if (ldor) begin
        fs_count <= j; rem_count <= j;
        phase <= 0; rotate <= 0;
        c1zero <= 0; c2zero <= 0;
        dff_out <= ipinput;
    end else begin
        if (!phase) begin
            if (fs_count == 6'd1) begin
                phase <= ~phase;
                c1zero <= 1; c2zero <= 0;
                fs_count <= j;
            end else begin
                fs_count <= fs_count - 6'd1;
                c1zero <= 0; c2zero <= 0;
            end
            rotate <= shamt;
        end else if(phase) begin
            if (rem_count == 6'd1) begin
                phase <= ~phase;
                c1zero <= 0;
                c2zero <= 1;
                rem_count <= j;
            end else begin
                rem_count <= rem_count - 6'd1;
                c1zero <= 0;
                c2zero <= 0;
            end
            rotate <= k;
        end
        dff_out <= mux_out;
    end
end
assign ipout = dff_out;
endmodule

