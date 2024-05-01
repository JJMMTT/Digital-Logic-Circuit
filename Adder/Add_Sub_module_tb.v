`timescale 1ns/100ps
module twos_adder_tb;
  parameter N = 4;
  reg [N-1:0] a, b;
  reg c_in;
  wire [N-1:0] sum;
  wire c_out;

  twos_adder Adder (.A(a), .B(b), .c_in(c_in), .sum(sum), .c_out(c_out));

  initial begin
    a = 0;  b = 0;  c_in = 0;
    #20 a = 1;  b = 0;
    #20 a = 3;  b = 0;
    #20 a = 5;  b = 5;
    #20 a = 7;  b = 3;
    #20 a = 9;  b = 6;
    #20 a = 11; b = 5;
    #20 a = 0;  b = 0;  c_in = 1;
    #20 a = 1;  b = 0;
    #20 a = 3;  b = 0;
    #20 a = 5;  b = 5;
    #20 a = 7;  b = 3;
    #20 a = 9;  b = 6;
    #20 a = 11; b = 12;
    #20 $finish;
  end
  initial begin
    $monitor("시간=%g, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b", $time, a, b, c_in, sum, c_out);
  end
endmodule
