module twos_adder(A, B, c_in, sum, c_out);
	parameter N=4;
  input    [N-1:0] A, B;
	input    c_in;
	output   [N-1:0] sum;
	output   c_out;
	wire     [N-1:0] t;

  assign t = B ^ {N{c_in}};            // c_in이 0이면 Add, 1이면 Sub
  assign {c_out, sum} = A + t + c_in;  // c_out이 0이면 덧셈 결과(양수), 1이면 뺄셈 결과(음수) >> 덧셈에서1, 뺄셈에서0이 나오면 Overflow발생
endmodule
