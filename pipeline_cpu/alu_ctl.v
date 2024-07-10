`timescale 1ns/1ns

module alu_ctl(ALUOp, Funct, ALUOperation);

	input [1:0] ALUOp;
	input [5:0] Funct;
	output [2:0] ALUOperation;
	reg    [2:0] ALUOperation;

	// symbolic constants for instruction function code
	parameter F_add = 6'd32;
	parameter F_sub = 6'd34;
	parameter F_and = 6'd36;
	parameter F_or  = 6'd37;
	parameter F_slt = 6'd42;

	// symbolic constants for ALU Operations
	parameter ALU_add = 3'b010 ;
	parameter ALU_sub = 3'b110 ;
	parameter ALU_and = 3'b000 ;
	parameter ALU_or  = 3'b001 ;
	parameter ALU_slt = 3'b111 ;

	always @( ALUOp or Funct ) begin

		if ( ALUOp == 2'b00 )
			ALUOperation = ALU_add ;

		else if ( ALUOp == 2'b01 )
			ALUOperation = ALU_sub ;

		else if ( ALUOp == 2'b10 ) begin

			if ( Funct == F_add )
				ALUOperation = ALU_add ;

			else if ( Funct == F_sub )
				ALUOperation = ALU_sub ;

			else if ( Funct == F_and )
				ALUOperation = ALU_and ;

			else if ( Funct == F_or )
				ALUOperation = ALU_or ;

			else if ( Funct == F_slt )
				ALUOperation = ALU_slt ;

			else
				ALUOperation = 3'b000 ;
		end

		else if ( ALUOp == 2'b11 )
			ALUOperation = ALU_or ;

		else
			ALUOperation = 3'b000 ;

	end

endmodule

