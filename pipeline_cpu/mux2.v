`timescale 1ns/1ns

module mux2( sel, a, b, y );

    input sel;
    input  [31:0] a, b;
    output [31:0] y;

    assign y = sel ? a : b ;

endmodule
