`timescale 1ns/1ns

module ALU( Signal, dataA, dataB, dataOut, reset, isZero );

	input reset ;
	input [31:0] dataA ;
	input [31:0] dataB ;
	input [2:0] Signal ;
	output isZero ;
	output [31:0] dataOut ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42

	wire set, bin ;
	wire[31:0] c ;

	wire [31:0] temp ;

	parameter ADD = 3'b010;
	parameter SUB = 3'b110;
	parameter AND = 3'b000;
	parameter OR  = 3'b001;
	parameter SLT = 3'b111;

	assign bin = ( Signal == ADD ) ? 1'b0 : 1'b1 ;

	ALU_slice slice0( c[0], temp[0], bin, Signal, bin, dataA[0], dataB[0], set ) ;
	ALU_slice slice1( c[1], temp[1], c[0], Signal, bin, dataA[1], dataB[1], 1'b0 ) ;
	ALU_slice slice2( c[2], temp[2], c[1], Signal, bin, dataA[2], dataB[2], 1'b0 ) ;
	ALU_slice slice3( c[3], temp[3], c[2], Signal, bin, dataA[3], dataB[3], 1'b0 ) ;
	ALU_slice slice4( c[4], temp[4], c[3], Signal, bin, dataA[4], dataB[4], 1'b0 ) ;
	ALU_slice slice5( c[5], temp[5], c[4], Signal, bin, dataA[5], dataB[5], 1'b0 ) ;
	ALU_slice slice6( c[6], temp[6], c[5], Signal, bin, dataA[6], dataB[6], 1'b0 ) ;
	ALU_slice slice7( c[7], temp[7], c[6], Signal, bin, dataA[7], dataB[7], 1'b0 ) ;
	ALU_slice slice8( c[8], temp[8], c[7], Signal, bin, dataA[8], dataB[8], 1'b0 ) ;
	ALU_slice slice9( c[9], temp[9], c[8], Signal, bin, dataA[9], dataB[9], 1'b0 ) ;
	ALU_slice slice10( c[10], temp[10], c[9], Signal, bin, dataA[10], dataB[10], 1'b0 ) ;
	ALU_slice slice11( c[11], temp[11], c[10], Signal, bin, dataA[11], dataB[11], 1'b0 ) ;
	ALU_slice slice12( c[12], temp[12], c[11], Signal, bin, dataA[12], dataB[12], 1'b0 ) ;
	ALU_slice slice13( c[13], temp[13], c[12], Signal, bin, dataA[13], dataB[13], 1'b0 ) ;
	ALU_slice slice14( c[14], temp[14], c[13], Signal, bin, dataA[14], dataB[14], 1'b0 ) ;
	ALU_slice slice15( c[15], temp[15], c[14], Signal, bin, dataA[15], dataB[15], 1'b0 ) ;
	ALU_slice slice16( c[16], temp[16], c[15], Signal, bin, dataA[16], dataB[16], 1'b0 ) ;
	ALU_slice slice17( c[17], temp[17], c[16], Signal, bin, dataA[17], dataB[17], 1'b0 ) ;
	ALU_slice slice18( c[18], temp[18], c[17], Signal, bin, dataA[18], dataB[18], 1'b0 ) ;
	ALU_slice slice19( c[19], temp[19], c[18], Signal, bin, dataA[19], dataB[19], 1'b0 ) ;
	ALU_slice slice20( c[20], temp[20], c[19], Signal, bin, dataA[20], dataB[20], 1'b0 ) ;
	ALU_slice slice21( c[21], temp[21], c[20], Signal, bin, dataA[21], dataB[21], 1'b0 ) ;
	ALU_slice slice22( c[22], temp[22], c[21], Signal, bin, dataA[22], dataB[22], 1'b0 ) ;
	ALU_slice slice23( c[23], temp[23], c[22], Signal, bin, dataA[23], dataB[23], 1'b0 ) ;
	ALU_slice slice24( c[24], temp[24], c[23], Signal, bin, dataA[24], dataB[24], 1'b0 ) ;
	ALU_slice slice25( c[25], temp[25], c[24], Signal, bin, dataA[25], dataB[25], 1'b0 ) ;
	ALU_slice slice26( c[26], temp[26], c[25], Signal, bin, dataA[26], dataB[26], 1'b0 ) ;
	ALU_slice slice27( c[27], temp[27], c[26], Signal, bin, dataA[27], dataB[27], 1'b0 ) ;
	ALU_slice slice28( c[28], temp[28], c[27], Signal, bin, dataA[28], dataB[28], 1'b0 ) ;
	ALU_slice slice29( c[29], temp[29], c[28], Signal, bin, dataA[29], dataB[29], 1'b0 ) ;
	ALU_slice slice30( c[30], temp[30], c[29], Signal, bin, dataA[30], dataB[30], 1'b0 ) ;
	ALU_slice31 slice31( set, c[31], temp[31], c[30], Signal, bin, dataA[31], dataB[31], 1'b0 ) ;
	
	assign dataOut = ( reset ) ? 32'b0 : 
					 ( Signal == AND ) ? temp : 
					 ( Signal == OR ) ? temp : 
					 ( Signal == ADD ) ? temp : 
					 ( Signal == SUB ) ? temp : 
					 ( Signal == SLT ) ? temp : 32'b0 ;
	
	assign isZero = ( reset ) ? 1'b0 : ( temp == 32'b0 ) ? 1'b1 : 32'b0 ;

endmodule