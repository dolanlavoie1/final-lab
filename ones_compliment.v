module ones_compliment(
    input [3:0]A, B,
    output[3:0] Y
);

    wire carryVal1;
    wire carryVal2;
    wire carryVal3;
    wire carryVal4;
    wire carryVal5;
    wire carryVal6;
    wire carryVal7;
    wire carryVal8;
    wire out1;
    wire out2;
    wire out3;
    wire out4;
    
    full_adder full_adder_1(
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),
        .Cout(carryVal1),
        .Y(out1)
    );
    
    full_adder full_adder_2(
        .A(A[1]),
        .B(B[1]),
        .Cin(carryVal1),
        .Cout(carryVal2),
        .Y(out2)
    );
    
    full_adder full_adder_3(
        .A(A[2]),
        .B(B[2]),
        .Cin(carryVal2),
        .Cout(carryVal3),
        .Y(out3)
    );
    
    full_adder full_adder_4(
        .A(A[3]),
        .B(B[3]),
        .Cin(carryVal3),
        .Cout(carryVal4),
        .Y(out4)
    );
    
    full_adder full_adder_5(
        .A(out1),
        .B(1'b0),
        .Cin(carryVal4),
        .Cout(carryVal5),
        .Y(Y[0])
    );
    
    full_adder full_adder_6(
        .A(out2),
        .B(1'b0),
        .Cin(carryVal5),
        .Cout(carryVal6),
        .Y(Y[1])
    );
    
    full_adder full_adder_7(
        .A(out3),
        .B(1'b0),
        .Cin(carryVal6),
        .Cout(carryVal7),
        .Y(Y[2])
    );
    
    full_adder full_adder_8(
        .A(out4),
        .B(1'b0),
        .Cin(carryVal7),
        .Cout(carryVal8),
        .Y(Y[3])
    );
    
//    assign Y = A ^ B ^ Cin;
//    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule