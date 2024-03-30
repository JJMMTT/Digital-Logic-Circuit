module counter(
    input a, b, c,
    output y,z
);
    assign y = (~a&b&c) | (a&~b&c) | (a&b);
    assign z = (~a&~b&c) | (~a&b&~c) | (a&~b&~c)|(a&b&c);
endmodule