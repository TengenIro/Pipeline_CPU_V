`timescale 1ns/1ns

module Divider( clk, dataA, dataB, Signal, dataOut, reset, enable );

	input clk, enable ;
	input reset ;
	input [31:0] dataA ;
	input [31:0] dataB ;
	input [5:0] Signal ;
	output [63:0] dataOut ;

	reg [63:0] temp ;
	reg [63:0] divisor ;
	reg [63:0] rem ;
	reg [31:0] quo ;
	parameter DIVU = 6'b011011;
	parameter OUT = 6'b111111;
/*
	always@( Signal ) begin

		if ( enable ) begin

			divisor[31:0] = 32'b0 ;
			rem[63:32] = 32'b0 ;
			quo = 32'b0 ;

			rem[31:0] = dataA ;
			divisor[63:32] = dataB ;

		$display( "%d, %d, quo, rem enable\n", quo, rem );

		end

	end
*/
	always@( posedge clk ) begin

		if ( reset ) begin

			temp = 64'b0 ;
			divisor = 64'b0 ;
			rem = 32'b0 ;
			quo = 32'b0 ;

		end
		
		else if ( enable ) begin

			divisor[31:0] = 32'b0 ;
			rem[63:32] = 32'b0 ;
			quo = 32'b0 ;

			rem[31:0] = dataA ;
			divisor[63:32] = dataB ;

		end

		else if ( Signal == DIVU && !enable ) begin

			rem = rem - divisor ;

			if ( rem[63] == 1'b1 ) begin

				rem = rem + divisor ;
				quo = quo << 1'b1 ;
				quo[0] = 1'b0 ;

			end

			else begin

				quo = quo << 1'b1 ;
				quo[0] = 1'b1 ;

			end

			divisor = divisor >> 1'b1 ;

		end

		else if ( Signal == OUT ) begin

			temp[63:32] = quo ;
			temp[31:0] = rem ;

		end

	end

	assign dataOut = temp ;

endmodule