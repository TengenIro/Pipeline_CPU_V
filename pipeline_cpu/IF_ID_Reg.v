`timescale 1ns/1ns

module IF_ID_Reg ( clk, rst, enable, instructionIn, instructionOut, PC_4In, PC_4Out ) ;

	input clk, rst, enable ;
	input[31:0] instructionIn, PC_4In ;
	output[31:0] instructionOut, PC_4Out ;
	reg[31:0] T_instructionOut, T_PC_4Out ;

	always @( posedge clk ) begin

		if( rst ) begin

			T_PC_4Out <= 32'b0 ;
			T_instructionOut <= 32'b0 ;

		end

		else if ( enable ) begin

			T_PC_4Out <= PC_4In ;
			T_instructionOut <= instructionIn ;

		end

	end

	assign PC_4Out = T_PC_4Out ;
	assign instructionOut = T_instructionOut ;


endmodule
