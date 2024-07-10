`timescale 1ns/1ns

module HiLo( clk, DivAns, HiOut, LoOut, reset, enable );

	input clk ;
	input reset, enable ;
	input [63:0] DivAns ;
	output [31:0] HiOut ;
	output [31:0] LoOut ;

	reg [63:0] HiLo ;

	always@( posedge clk or reset ) begin

		if ( reset )
			HiLo <= 64'b0 ;

		else if ( enable )
			HiLo <= DivAns ;

	end

	assign LoOut = HiLo[63:32] ;
	assign HiOut = HiLo[31:0] ;

endmodule