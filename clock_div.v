module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    wire [DIVIDE_BY:0] out, NotQ;
    genvar i;
    
    dff dff1(
            .Default(0),
            .D(NotQ[0]),
            .clk(clock),
            .reset(reset),
            .Q(out[0]),
            .NotQ(NotQ[0])
    );
    
    generate
        for (i = 1; i < DIVIDE_BY; i = i + 1) begin : dff_gen
            dff dff2(
                .Default(0),
                .D(NotQ[i]),
                .clk(out[i - 1]),
                .reset(reset),
                .Q(out[i]),
                .NotQ(NotQ[i])
            );
        end
    endgenerate
    
    assign div_clock = out[DIVIDE_BY - 1];

endmodule