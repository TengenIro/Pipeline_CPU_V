`timescale 1ns/1ns

module Shifter( dataA, dataB, dataOut, reset );

	input reset ;
	input [31:0] dataA ;
	input [4:0] dataB ;
	output [31:0] dataOut ;

	wire [31:0] temp ;
	wire [31:0] floor1, floor2, floor3, floor4 ;

	wire [4:0] s ;

	assign s = dataB[4:0] ;

	// first floor

	ShifterMux mux0_0( floor1[0], dataA[0], dataA[1], s[0] ) ;
	ShifterMux mux1_0( floor1[1], dataA[1], dataA[2], s[0] ) ;
	ShifterMux mux2_0( floor1[2], dataA[2], dataA[3], s[0] ) ;
	ShifterMux mux3_0( floor1[3], dataA[3], dataA[4], s[0] ) ;
	ShifterMux mux4_0( floor1[4], dataA[4], dataA[5], s[0] ) ;
	ShifterMux mux5_0( floor1[5], dataA[5], dataA[6], s[0] ) ;
	ShifterMux mux6_0( floor1[6], dataA[6], dataA[7], s[0] ) ;
	ShifterMux mux7_0( floor1[7], dataA[7], dataA[8], s[0] ) ;
	ShifterMux mux8_0( floor1[8], dataA[8], dataA[9], s[0] ) ;
	ShifterMux mux9_0( floor1[9], dataA[9], dataA[10], s[0] ) ;
	ShifterMux mux10_0( floor1[10], dataA[10], dataA[11], s[0] ) ;
	ShifterMux mux11_0( floor1[11], dataA[11], dataA[12], s[0] ) ;
	ShifterMux mux12_0( floor1[12], dataA[12], dataA[13], s[0] ) ;
	ShifterMux mux13_0( floor1[13], dataA[13], dataA[14], s[0] ) ;
	ShifterMux mux14_0( floor1[14], dataA[14], dataA[15], s[0] ) ;
	ShifterMux mux15_0( floor1[15], dataA[15], dataA[16], s[0] ) ;
	ShifterMux mux16_0( floor1[16], dataA[16], dataA[17], s[0] ) ;
	ShifterMux mux17_0( floor1[17], dataA[17], dataA[18], s[0] ) ;
	ShifterMux mux18_0( floor1[18], dataA[18], dataA[19], s[0] ) ;
	ShifterMux mux19_0( floor1[19], dataA[19], dataA[20], s[0] ) ;
	ShifterMux mux20_0( floor1[20], dataA[20], dataA[21], s[0] ) ;
	ShifterMux mux21_0( floor1[21], dataA[21], dataA[22], s[0] ) ;
	ShifterMux mux22_0( floor1[22], dataA[22], dataA[23], s[0] ) ;
	ShifterMux mux23_0( floor1[23], dataA[23], dataA[24], s[0] ) ;
	ShifterMux mux24_0( floor1[24], dataA[24], dataA[25], s[0] ) ;
	ShifterMux mux25_0( floor1[25], dataA[25], dataA[26], s[0] ) ;
	ShifterMux mux26_0( floor1[26], dataA[26], dataA[27], s[0] ) ;
	ShifterMux mux27_0( floor1[27], dataA[27], dataA[28], s[0] ) ;
	ShifterMux mux28_0( floor1[28], dataA[28], dataA[29], s[0] ) ;
	ShifterMux mux29_0( floor1[29], dataA[29], dataA[30], s[0] ) ;
	ShifterMux mux30_0( floor1[30], dataA[30], dataA[31], s[0] ) ;
	ShifterMux mux31_0( floor1[31], dataA[31], 1'b0, s[0] ) ;

	// second floor

	ShifterMux mux0_1( floor2[0], floor1[0], floor1[2], s[1] ) ;
	ShifterMux mux1_1( floor2[1], floor1[1], floor1[3], s[1] ) ;
	ShifterMux mux2_1( floor2[2], floor1[2], floor1[4], s[1] ) ;
	ShifterMux mux3_1( floor2[3], floor1[3], floor1[5], s[1] ) ;
	ShifterMux mux4_1( floor2[4], floor1[4], floor1[6], s[1] ) ;
	ShifterMux mux5_1( floor2[5], floor1[5], floor1[7], s[1] ) ;
	ShifterMux mux6_1( floor2[6], floor1[6], floor1[8], s[1] ) ;
	ShifterMux mux7_1( floor2[7], floor1[7], floor1[9], s[1] ) ;
	ShifterMux mux8_1( floor2[8], floor1[8], floor1[10], s[1] ) ;
	ShifterMux mux9_1( floor2[9], floor1[9], floor1[11], s[1] ) ;
	ShifterMux mux10_1( floor2[10], floor1[10], floor1[12], s[1] ) ;
	ShifterMux mux11_1( floor2[11], floor1[11], floor1[13], s[1] ) ;
	ShifterMux mux12_1( floor2[12], floor1[12], floor1[14], s[1] ) ;
	ShifterMux mux13_1( floor2[13], floor1[13], floor1[15], s[1] ) ;
	ShifterMux mux14_1( floor2[14], floor1[14], floor1[16], s[1] ) ;
	ShifterMux mux15_1( floor2[15], floor1[15], floor1[17], s[1] ) ;
	ShifterMux mux16_1( floor2[16], floor1[16], floor1[18], s[1] ) ;
	ShifterMux mux17_1( floor2[17], floor1[17], floor1[19], s[1] ) ;
	ShifterMux mux18_1( floor2[18], floor1[18], floor1[20], s[1] ) ;
	ShifterMux mux19_1( floor2[19], floor1[19], floor1[21], s[1] ) ;
	ShifterMux mux20_1( floor2[20], floor1[20], floor1[22], s[1] ) ;
	ShifterMux mux21_1( floor2[21], floor1[21], floor1[23], s[1] ) ;
	ShifterMux mux22_1( floor2[22], floor1[22], floor1[24], s[1] ) ;
	ShifterMux mux23_1( floor2[23], floor1[23], floor1[25], s[1] ) ;
	ShifterMux mux24_1( floor2[24], floor1[24], floor1[26], s[1] ) ;
	ShifterMux mux25_1( floor2[25], floor1[25], floor1[27], s[1] ) ;
	ShifterMux mux26_1( floor2[26], floor1[26], floor1[28], s[1] ) ;
	ShifterMux mux27_1( floor2[27], floor1[27], floor1[29], s[1] ) ;
	ShifterMux mux28_1( floor2[28], floor1[28], floor1[30], s[1] ) ;
	ShifterMux mux29_1( floor2[29], floor1[29], floor1[31], s[1] ) ;
	ShifterMux mux30_1( floor2[30], floor1[30], 1'b0, s[1] ) ;
	ShifterMux mux31_1( floor2[31], floor1[31], 1'b0, s[1] ) ;

	// third floor

	ShifterMux mux0_2( floor3[0], floor2[0], floor2[4], s[2] ) ;
	ShifterMux mux1_2( floor3[1], floor2[1], floor2[5], s[2] ) ;
	ShifterMux mux2_2( floor3[2], floor2[2], floor2[6], s[2] ) ;
	ShifterMux mux3_2( floor3[3], floor2[3], floor2[7], s[2] ) ;
	ShifterMux mux4_2( floor3[4], floor2[4], floor2[8], s[2] ) ;
	ShifterMux mux5_2( floor3[5], floor2[5], floor2[9], s[2] ) ;
	ShifterMux mux6_2( floor3[6], floor2[6], floor2[10], s[2] ) ;
	ShifterMux mux7_2( floor3[7], floor2[7], floor2[11], s[2] ) ;
	ShifterMux mux8_2( floor3[8], floor2[8], floor2[12], s[2] ) ;
	ShifterMux mux9_2( floor3[9], floor2[9], floor2[13], s[2] ) ;
	ShifterMux mux10_2( floor3[10], floor2[10], floor2[14], s[2] ) ;
	ShifterMux mux11_2( floor3[11], floor2[11], floor2[15], s[2] ) ;
	ShifterMux mux12_2( floor3[12], floor2[12], floor2[16], s[2] ) ;
	ShifterMux mux13_2( floor3[13], floor2[13], floor2[17], s[2] ) ;
	ShifterMux mux14_2( floor3[14], floor2[14], floor2[18], s[2] ) ;
	ShifterMux mux15_2( floor3[15], floor2[15], floor2[19], s[2] ) ;
	ShifterMux mux16_2( floor3[16], floor2[16], floor2[20], s[2] ) ;
	ShifterMux mux17_2( floor3[17], floor2[17], floor2[21], s[2] ) ;
	ShifterMux mux18_2( floor3[18], floor2[18], floor2[22], s[2] ) ;
	ShifterMux mux19_2( floor3[19], floor2[19], floor2[23], s[2] ) ;
	ShifterMux mux20_2( floor3[20], floor2[20], floor2[24], s[2] ) ;
	ShifterMux mux21_2( floor3[21], floor2[21], floor2[25], s[2] ) ;
	ShifterMux mux22_2( floor3[22], floor2[22], floor2[26], s[2] ) ;
	ShifterMux mux23_2( floor3[23], floor2[23], floor2[27], s[2] ) ;
	ShifterMux mux24_2( floor3[24], floor2[24], floor2[28], s[2] ) ;
	ShifterMux mux25_2( floor3[25], floor2[25], floor2[29], s[2] ) ;
	ShifterMux mux26_2( floor3[26], floor2[26], floor2[30], s[2] ) ;
	ShifterMux mux27_2( floor3[27], floor2[27], floor2[31], s[2] ) ;
	ShifterMux mux28_2( floor3[28], floor2[28], 1'b0, s[2] ) ;
	ShifterMux mux29_2( floor3[29], floor2[29], 1'b0, s[2] ) ;
	ShifterMux mux30_2( floor3[30], floor2[30], 1'b0, s[2] ) ;
	ShifterMux mux31_2( floor3[31], floor2[31], 1'b0, s[2] ) ;

	// forth floor

	ShifterMux mux0_3( floor4[0], floor3[0], floor3[8], s[3] ) ;
	ShifterMux mux1_3( floor4[1], floor3[1], floor3[9], s[3] ) ;
	ShifterMux mux2_3( floor4[2], floor3[2], floor3[10], s[3] ) ;
	ShifterMux mux3_3( floor4[3], floor3[3], floor3[11], s[3] ) ;
	ShifterMux mux4_3( floor4[4], floor3[4], floor3[12], s[3] ) ;
	ShifterMux mux5_3( floor4[5], floor3[5], floor3[13], s[3] ) ;
	ShifterMux mux6_3( floor4[6], floor3[6], floor3[14], s[3] ) ;
	ShifterMux mux7_3( floor4[7], floor3[7], floor3[15], s[3] ) ;
	ShifterMux mux8_3( floor4[8], floor3[8], floor3[16], s[3] ) ;
	ShifterMux mux9_3( floor4[9], floor3[9], floor3[17], s[3] ) ;
	ShifterMux mux10_3( floor4[10], floor3[10], floor3[18], s[3] ) ;
	ShifterMux mux11_3( floor4[11], floor3[11], floor3[19], s[3] ) ;
	ShifterMux mux12_3( floor4[12], floor3[12], floor3[20], s[3] ) ;
	ShifterMux mux13_3( floor4[13], floor3[13], floor3[21], s[3] ) ;
	ShifterMux mux14_3( floor4[14], floor3[14], floor3[22], s[3] ) ;
	ShifterMux mux15_3( floor4[15], floor3[15], floor3[23], s[3] ) ;
	ShifterMux mux16_3( floor4[16], floor3[16], floor3[24], s[3] ) ;
	ShifterMux mux17_3( floor4[17], floor3[17], floor3[25], s[3] ) ;
	ShifterMux mux18_3( floor4[18], floor3[18], floor3[26], s[3] ) ;
	ShifterMux mux19_3( floor4[19], floor3[19], floor3[27], s[3] ) ;
	ShifterMux mux20_3( floor4[20], floor3[20], floor3[28], s[3] ) ;
	ShifterMux mux21_3( floor4[21], floor3[21], floor3[29], s[3] ) ;
	ShifterMux mux22_3( floor4[22], floor3[22], floor3[30], s[3] ) ;
	ShifterMux mux23_3( floor4[23], floor3[23], floor3[31], s[3] ) ;
	ShifterMux mux24_3( floor4[24], floor3[24], 1'b0, s[3] ) ;
	ShifterMux mux25_3( floor4[25], floor3[25], 1'b0, s[3] ) ;
	ShifterMux mux26_3( floor4[26], floor3[26], 1'b0, s[3] ) ;
	ShifterMux mux27_3( floor4[27], floor3[27], 1'b0, s[3] ) ;
	ShifterMux mux28_3( floor4[28], floor3[28], 1'b0, s[3] ) ;
	ShifterMux mux29_3( floor4[29], floor3[29], 1'b0, s[3] ) ;
	ShifterMux mux30_3( floor4[30], floor3[30], 1'b0, s[3] ) ;
	ShifterMux mux31_3( floor4[31], floor3[31], 1'b0, s[3] ) ;

	// fifth floor

	ShifterMux mux0_4( temp[0], floor4[0], floor4[16], s[4] ) ;
	ShifterMux mux1_4( temp[1], floor4[1], floor4[17], s[4] ) ;
	ShifterMux mux2_4( temp[2], floor4[2], floor4[18], s[4] ) ;
	ShifterMux mux3_4( temp[3], floor4[3], floor4[19], s[4] ) ;
	ShifterMux mux4_4( temp[4], floor4[4], floor4[20], s[4] ) ;
	ShifterMux mux5_4( temp[5], floor4[5], floor4[21], s[4] ) ;
	ShifterMux mux6_4( temp[6], floor4[6], floor4[22], s[4] ) ;
	ShifterMux mux7_4( temp[7], floor4[7], floor4[23], s[4] ) ;
	ShifterMux mux8_4( temp[8], floor4[8], floor4[24], s[4] ) ;
	ShifterMux mux9_4( temp[9], floor4[9], floor4[25], s[4] ) ;
	ShifterMux mux10_4( temp[10], floor4[10], floor4[26], s[4] ) ;
	ShifterMux mux11_4( temp[11], floor4[11], floor4[27], s[4] ) ;
	ShifterMux mux12_4( temp[12], floor4[12], floor4[28], s[4] ) ;
	ShifterMux mux13_4( temp[13], floor4[13], floor4[29], s[4] ) ;
	ShifterMux mux14_4( temp[14], floor4[14], floor4[30], s[4] ) ;
	ShifterMux mux15_4( temp[15], floor4[15], floor4[31], s[4] ) ;
	ShifterMux mux16_4( temp[16], floor4[16], 1'b0, s[4] ) ;
	ShifterMux mux17_4( temp[17], floor4[17], 1'b0, s[4] ) ;
	ShifterMux mux18_4( temp[18], floor4[18], 1'b0, s[4] ) ;
	ShifterMux mux19_4( temp[19], floor4[19], 1'b0, s[4] ) ;
	ShifterMux mux20_4( temp[20], floor4[20], 1'b0, s[4] ) ;
	ShifterMux mux21_4( temp[21], floor4[21], 1'b0, s[4] ) ;
	ShifterMux mux22_4( temp[22], floor4[22], 1'b0, s[4] ) ;
	ShifterMux mux23_4( temp[23], floor4[23], 1'b0, s[4] ) ;
	ShifterMux mux24_4( temp[24], floor4[24], 1'b0, s[4] ) ;
	ShifterMux mux25_4( temp[25], floor4[25], 1'b0, s[4] ) ;
	ShifterMux mux26_4( temp[26], floor4[26], 1'b0, s[4] ) ;
	ShifterMux mux27_4( temp[27], floor4[27], 1'b0, s[4] ) ;
	ShifterMux mux28_4( temp[28], floor4[28], 1'b0, s[4] ) ;
	ShifterMux mux29_4( temp[29], floor4[29], 1'b0, s[4] ) ;
	ShifterMux mux30_4( temp[30], floor4[30], 1'b0, s[4] ) ;
	ShifterMux mux31_4( temp[31], floor4[31], 1'b0, s[4] ) ;

	assign dataOut = ( reset ) ? 32'b0 : temp ;

endmodule