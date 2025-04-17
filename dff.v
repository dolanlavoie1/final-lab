module dff(
    input Default,
    input D,
    input clk,
    input reset,
    output reg Q,
    output NotQ
);

    assign NotQ = ~Q;

    initial begin
        Q <= Default;
    end

    always @(posedge clk, posedge reset) begin
        if (reset)
            Q <= Default;
        else
            Q <= D;
    end

endmodule