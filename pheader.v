module pheader(
    input        clk,
    input        reset,
    input        valid_in,
    input [31:0] data_in,
    output reg [47:0] header_out,
    output reg        header_valid,
    output reg [31:0] payload_out,
    output reg        payload_valid
);
    reg [1:0] word_count;
    reg [31:0] header_temp;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            word_count     <= 0;
            header_out     <= 0;
            header_temp    <= 0;
            header_valid   <= 0;
            payload_out    <= 0;
            payload_valid  <= 0;
        end
        else if (valid_in) begin
            case (word_count)
                0: begin
                    header_temp <= data_in;
                    header_valid <= 0;
                    payload_valid <= 0;
                    word_count <= 1;
                end
                1: begin
                    header_out   <= {header_temp[31:0], data_in[31:16]};
                    header_valid <= 1;
                    payload_out  <= {16'b0, data_in[15:0]};
                    payload_valid <= 1;
                    word_count <= 2;
                end
                default: begin
                    header_valid  <= 0;
                    payload_out   <= data_in;
                    payload_valid <= 1;
                end
            endcase
        end else begin
            header_valid  <= 0;
            payload_valid <= 0;
        end
    end

endmodule
