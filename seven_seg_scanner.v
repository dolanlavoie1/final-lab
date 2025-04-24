module seven_seg_scanner(
    input clk,
    input reset,
    output [3:0] anode
);

    wire Lnext, LCnext, RCnext, Rnext;
    wire L, LC, RC, R;

    dff Ldff(
        .Default(1'b0),
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
        .Default(1'b1),
        .D(Rnext),
        .clk(clk),
        .Q(R),
        .reset(reset)
    );
    assign RCnext = R;
    assign LCnext = RC;
    assign Lnext = LC;
    assign Rnext = L;
    
//    wire [3:0] nextS;
//    assign nextS= {L,LC,RC,R};
    
    //$display(" The current state %b",nextS); 
    
    assign anode[0] = ~R;
    assign anode[1] = ~RC;
    assign anode[2] = ~LC;
    assign anode[3] = ~L;

endmodule