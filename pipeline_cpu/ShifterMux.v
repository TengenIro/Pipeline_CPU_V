`timescale 1ns/1ns

module ShifterMux( out, a, b, sel );

	output out ;
	input a, b, sel ;

	assign out = ( sel ) ? b : a ;

endmodule