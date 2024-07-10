`timescale 1ns/1ns

module ALU_slice31( set, cout, sum, cin, sel, bin, a, b, less ) ;

	output set, cout, sum ;
	input cin, bin, a, b, less ;
	input[2:0] sel ;
	wire tempAdd, tempSub, tempOr, tempAnd, tempSlt ;
	
	parameter ADD = 3'b010;
	parameter SUB = 3'b110;
	parameter AND = 3'b000;
	parameter OR  = 3'b001;
	parameter SLT = 3'b111;

	and( tempAnd, a, b ) ;
	or( tempOr, a, b ) ;
	
	FA faAdd( .sum( tempAdd ), .cout( cout ), .cin( cin ), .bin( bin ), .a( a ), .b( b ) ) ;
	FA faSub( .sum( tempSub ), .cout( cout ), .cin( cin ), .bin( bin ), .a( a ), .b( b ) ) ;
	
	assign tempSlt = less ;
	assign set = tempSub ;
	assign sum = ( sel == AND ) ? tempAnd : 
				 ( sel == OR ) ? tempOr : 
				 ( sel == ADD ) ? tempAdd : 
				 ( sel == SUB ) ? tempSub : tempSlt ;

endmodule