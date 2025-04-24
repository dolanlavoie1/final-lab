module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

//    ones_compliment adder(
//        .A(A),
//        .B(B),
//        .Y(AplusB)
//    );
    
//    ones_compliment subtract(
//        .A(A),
//        .B(~B),
//        .Y(AminusB)
//    );

assign AplusB = A + B;

assign AminusB = A + (~B) + 4'b0001;

endmodule