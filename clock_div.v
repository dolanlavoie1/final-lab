module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);

    wire [DIVIDE_BY:0] out, NotQ;
    integer i;
    
    dff dff1(
            .Default(0),
            .D(NotQ[0]),
            .clk(clock),
            .reset(reset),
            .Q(out[0]),
            .NotQ(NotQ[0])
    );
    
    initial begin
        for (i = 1; i < DIVIDE_BY; i = i + 1) begin
            dff dff(
                .Default(0),
                .D(NotQ[i]),
                .clk(out[i - 1]),
                .reset(reset),
                .Q(out[i]),
                .NotQ(NotQ[i])
            );
        end
    end

endmodule