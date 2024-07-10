`timescale 1ns/1ns

module FA( sum, cout, cin, bin, a, b );

	input cin, bin, a, b ;
	output sum, cout ;

	wire b1, w1, w2, w3, temp ;
	
	xor( b1, b, bin ) ;
	
	xor( w1, a, b1 ) ;
	xor( sum, w1, cin ) ;
	
	and( w2, a, b1 ) ;
	and( w3, w1, cin ) ;
	or ( temp, w2, w3 ) ;
	
	assign cout = temp ;
	
endmodule