module FullAdder(
    input A,    // 첫 번째 입력 비트
    input B,    // 두 번째 입력 비트
    input Cin,  // 이전 자리로부터의 올림수(carry in)
    output Sum, // 합 결과
    output Cout // 올림수 결과(carry out)
);

assign Sum = A ^ B ^ Cin;          // XOR 연산을 통해 합 계산
assign Cout = (A & B) | (B & Cin) | (Cin & A);  // OR 연산을 통해 올림수 계산

endmodule
