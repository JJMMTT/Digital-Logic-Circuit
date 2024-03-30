module counter(
    input a, b, c,
    output y,z
);
    assign y = (~a&b&c) | (a&~b&c) | (a&b);
    assign z = (~a&~b&c) | (~a&b&~c) | (a&~b&~c)|(a&b&c);
endmodule
`timescale 1ns/ 1ps
module counter_tb;
reg a;
reg b;
reg c;
wire y;
wire z;
counter instance_counter(
    .a(a),.b(b),.c(c),.y(y),.z(z)
);
initial begin
    a=0; b=0; c=0;
    #10;
    a=0; b=0; c=1;
    #10;
    a=0; b=1; c=0;
    #10;
    a=0; b=1; c=1;
    #10;
    a=1; b=0; c=0;
    #10;
    a=1; b=0; c=1;
    #10;
    a=1; b=1; c=0;
    #10;
    a=1; b=1; c=1;
    #10;
    $finish;
end
initial begin
    $monitor("시간=%t, a=%b, b=%b, c=%b, y=%b, z=%b", $time, a, b, c, y, z);
end
endmodule
