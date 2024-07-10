`timescale 1ns/1ns

module mux2S5( sel, a, b, y );

    input sel;
    input  [4:0] a, b;
    output [4:0] y;

    assign y = sel ? a : b ;

endmodule
