//module cdsheader (
//    input        clk, first,
//    input        reset,
//    input        valid_in,
//    input [31:0] payload_in, 
//    input [4:0]  n,         

//    output reg [4:0] header_out, 
//    output reg [31:0] data_out,      
//    output reg        valid_out
//);

////reg c1,c2,c3;
//    reg [4:0] header_len;
//    reg [31:0] shifted_data;
//    always @(*) begin
//        if (n <= 4)         header_len = 2;
//        else if (n <= 8)    header_len = 3;
//        else if (n <= 16)   header_len = 4;
//        else if (n <= 32)   header_len = 5;
//        else                header_len = 0; 
//    end

//    always @(posedge clk or posedge reset) begin
//        if (reset) begin
////        c1 <= 1;
////        c2 <= 0;
////        c3 <= 0;
//            header_out <= 0;
//            data_out   <= 0;
//            valid_out  <= 0;
//        end else if (valid_in && first) begin
//            shifted_data = payload_in << 16;
//            valid_out  <= 1;
////            c1 <= 0;
//////        c2 <= 1;
////        c3 <= 0;
//           end
           
//           else if(valid_in && !first) begin
////           c1 <= 0;
////        c2 <= 0;
////        c3 <= 1;
//            case (header_len)
//                2: begin
//                    header_out <= shifted_data[31:30];
//                    data_out   <= shifted_data << 2;
//                end
//                3: begin
//                    header_out <= shifted_data[31:29];
//                    data_out   <= shifted_data << 3;
//                end
//                4: begin
//                    header_out <= shifted_data[31:28];
//                    data_out   <= shifted_data << 4;
//                end
//                5: begin
//                    header_out <= shifted_data[31:27];
//                    data_out   <= shifted_data << 5;
//                end
//                default: begin
//                    header_out <= 0;
//                    data_out   <= shifted_data;
//                end
//            endcase
//            valid_out <= 1;
//        end else begin
//            valid_out <= 0;
//        end
//    end

//endmodule



    module cdsheader (
    input        clk,
    input        reset,
    input        valid_in,
    input [31:0] payload_in, 
    input [4:0]  n,
    output reg [4:0] header_out, 
    output reg [31:0] data_out,      
    output reg        valid_out
);
    reg [4:0] header_len;
    reg [31:0] shifted_data;
    always @(*) begin
        if (n <= 4)         header_len = 2;
        else if (n <= 8)    header_len = 3;
        else if (n <= 16)   header_len = 4;
        else if (n <= 32)   header_len = 5;
        else                header_len = 0; 
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            header_out <= 0;
            data_out   <= 0;
            valid_out  <= 0;
        end 
           else if(valid_in) begin
            case (header_len)
                2: begin
                    header_out <= payload_in[31:30];
                    data_out   <= payload_in << 2;
                end
                3: begin
                    header_out <= payload_in[31:29];
                    data_out   <= payload_in << 3;
                end
                4: begin
                    header_out <= payload_in[31:28];
                    data_out   <= payload_in << 4;
                end
                5: begin
                    header_out <= payload_in[31:27];
                    data_out   <= payload_in << 5;
                end
                default: begin
                    header_out <= 0;
                    data_out   <= payload_in;
                end
            endcase
            valid_out <= 1;
        end else begin
            data_out <= payload_in;
        end
    end

endmodule

