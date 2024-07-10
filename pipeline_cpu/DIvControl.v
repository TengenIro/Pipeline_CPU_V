`timescale 1ns/1ns

module DivControl( clk, Signal, SignaltoDIV, openHiLo, give );

	input clk ;
	input Signal ;

	output [5:0] SignaltoDIV ;
	output openHiLo, give ;

	reg [5:0] temp ;
	reg [6:0] counter ;
	reg openHiLo, give ;

	parameter DIVU= 6'b011011;
	parameter OUT= 6'b111111;

	always@( Signal ) begin

		if ( Signal ) begin

			counter = 0 ;
			openHiLo = 1'b0 ;
			give = 1'b1 ;

		end
    
	end

	always@( posedge clk ) begin

		temp = DIVU ;

		if ( Signal ) begin

			counter = counter + 1 ;

			if ( counter == 2 )
				give = 1'b0 ;

			if ( counter == 35 ) begin

				temp = OUT; // Open HiLo reg for Div
				openHiLo = 1'b1 ;

			end
			
			else if ( counter == 36 )
				counter = 0 ;


			else
				openHiLo = 1'b0 ;

		end

	end

	assign SignaltoDIV = temp ;

endmodule