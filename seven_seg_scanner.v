module seven_seg_scanner(
    input clk,
    input reset,
    output [3:0] anode
);

    wire Lnext, LCnext, RCnext, Rnext;
    wire L, LC, RC, R;

    dff Ldff(
        .Default(1'b1),
        .D(Lnext),
        .clk(clk),
        .Q(L),
        .reset(reset)
    );
    
    dff LCdff(
        .Default(1'b0),
        .D(LCnext),
        .clk(clk),
        .Q(LC),
        .reset(reset)
    );
    
    dff RCdff(
        .Default(1'b0),
        .D(RCnext),
        .clk(clk),
        .Q(RC),
        .reset(reset)
    );
    
    dff Rdff(
        .Default(1'b0),
        .D(Rnext),
        .clk(clk),
        .Q(R),
        .reset(reset)
    );
    
    assign Lnext = R;
    assign LCnext = L;
    assign RCnext = LC;
    assign Rnext = RC;
    
    assign anode[0] = ~L;
    assign anode[1] = ~LC;
    assign anode[2] = ~RC;
    assign anode[3] = ~R;

endmodule