module controlpath(
       input start,
       input clk,
       input stop,
       input reset,
       input [5:0] j,
       input [5:0] k,
       input c1zero,
       input c2zero,
       input cout,
       output reg ldin,
       output reg ldor,
       output reg peen 
    );
    reg [3:0] state;
    parameter s0= 4'b0000, s1= 4'b0001, s2= 4'b0010, s3= 4'b0011, s4= 4'b0100, s5= 4'b0101, s6= 4'b0110, s7= 4'b0111, s8= 4'b1000;
    reg newor, newin;
    reg done;
   reg [1:0] ldcount;
    always@(posedge clk) begin
    if(reset) begin
        newor <= 1; newin <= 1;
        peen <= 0; done <= 0;
        state <= s0; ldin <= 0;
        ldor <= 0; ldcount <= 0;
    end
    else begin
        case(state)
        s0: if(start) begin  
        if(ldcount==0) begin 
        state <= s0; 
            if(newor) ldor <= 1; 
            else ldor <= 0; 
        end 
        else begin state <= s1; end
        ldcount <= ldcount+1;
        end
        s1: begin state <= s2; if(newin) ldin <= 1; else ldin <= 0; ldor <= 0; newor <= 0; end
        s2: begin state <= s3; peen <= 1; ldin <= 0;  end
        s3: begin  state <= s4;  end
        s4: if      ((c1zero==0) && (cout==0)) begin state<= s3; peen <=1; end
            else if ((c1zero==1) && (cout==0)) begin state <= s6; peen <= 0; end
            else if ((c1zero==1) && (cout==1)) begin state <= s7; peen <= 0;  end
            else if ((c1zero==0) && (cout==1)) begin state <= s5; peen <= 1; end
            else if (stop) begin state <= s8; end
        s5: begin state <= s0;  newin <= 1; peen <= 1; end
        s6: if      ((c2zero==0) && (cout==0)) begin state<= s0; peen <=0; newin <= 0; end //newor <= 0;
            else if ((c2zero==1) && (cout==0)) begin state <= s0; peen <= 1; end
            else if ((c2zero==1) && (cout==1)) begin state <= s0; peen <= 1; newin <= 1;  end
            else if ((c2zero==0) && (cout==1)) begin state <= s0; peen <= 0; newin <= 1; end
            else if (stop) begin state <= s8; end
        s7 : begin state <= s0; peen <= 0; newin <= 1; end
        s8: done <= 1;
       
       
           
        endcase
        end
    end
endmodule



