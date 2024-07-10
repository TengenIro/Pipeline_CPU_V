`timescale 1ns/1ns

	// W[0] is RegWrite
	// W[1] is MemToReg
	// W[2] is shift
	// W[3] is mfhi
	// W[4] is mflo
	// M[0] is branch
	// M[1] is memWrite
	// M[2] is memRead
	// E[0] is ALUSrc
	// E[1] is RegDst
	// E[3:2] is ALUOp
	// E[4] is to divd

module control_single( rst, allInstr, opcode, W, M, E, j, jr );

	input rst ;
	input[5:0] opcode;
	input [31:0] allInstr ;

	output j, jr ;
	output [4:0] W ;
	output [2:0] M ;
	output [4:0] E ;

	reg j, jr ;
	reg [4:0] W ;
	reg [2:0] M ;
	reg [4:0] E ;

	parameter R_FORMAT = 6'd0;
	parameter LW = 6'd35;
	parameter SW = 6'd43;
	parameter ORI = 6'd13 ;
	parameter BEQ = 6'd4;
	parameter J = 6'd2;

	always @( allInstr ) begin

		if ( rst ) begin
		
			W = 5'b0 ;
			M = 3'b0 ;
			E = 5'b0 ;
			j = 1'b0 ;
			jr = 1'b0 ;
		
		end 

		if ( allInstr == 32'd0 ) begin

			W = 5'b0 ;
			M = 3'b0 ;
			E[3:0] = 4'b0 ;
			E[4] = 1'b1 ;
			j = 1'b0 ;
			jr = 1'b0 ;

			$display( "NOP Instruction" );

		end

		// SRL

		else if ( opcode == R_FORMAT && allInstr[5:0] == 6'd2 ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b1 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b1 ; // E[1] is RegDst
			E[3:2] = 2'b10 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "SRL Instruction" );

		end

		// div

		else if ( opcode == R_FORMAT && allInstr[5:0] == 6'd27 ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b1 ; // E[1] is RegDst
			E[3:2] = 2'b10 ; // E[3:2] is ALUOp
			E[4] = 1'b1 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "DIV Instruction" );

		end

		// mfhi

		else if ( opcode == R_FORMAT && allInstr[5:0] == 6'd16 ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b1 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b1 ; // E[1] is RegDst
			E[3:2] = 2'b10 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "mfhi Instruction" );

		end

		// mflo

		else if ( opcode == R_FORMAT && allInstr[5:0] == 6'd18 ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b1 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b1 ; // E[1] is RegDst
			E[3:2] = 2'b10 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "mflo Instruction" );

		end

		// JR

		else if ( opcode == R_FORMAT && allInstr[5:0] == 6'd8 ) begin

			W[0] = 1'b0 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b00 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b1 ;
			
			$display( "jr Instruction" );

		end

		else if ( opcode == R_FORMAT ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b1 ; // E[1] is RegDst
			E[3:2] = 2'b10 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "r-type Instruction" );

		end

		else if ( opcode == LW ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b1 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b1 ; // M[2] is memRead
			E[0] = 1'b1 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b00 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "lw Instruction" );

		end

		else if ( opcode == SW ) begin

			W[0] = 1'b0 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b1 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b1 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b00 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "sw Instruction" );

		end

		else if ( opcode == BEQ ) begin

			W[0] = 1'b0 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b1 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b01 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "beq Instruction" );

		end

		else if ( opcode == ORI ) begin

			W[0] = 1'b1 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b1 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b11 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b0 ;
			jr = 1'b0 ;
			
			$display( "ori Instruction" );

		end

		else if ( opcode == J ) begin

			W[0] = 1'b0 ; // W[0] is RegWrite
			W[1] = 1'b0 ; // W[1] is MemToReg
			W[2] = 1'b0 ; // W[2] is shift
			W[3] = 1'b0 ; // W[3] is mfhi
			W[4] = 1'b0 ; // W[4] is mflo
			M[0] = 1'b0 ; // M[0] is branch
			M[1] = 1'b0 ; // M[1] is memWrite
			M[2] = 1'b0 ; // M[2] is memRead
			E[0] = 1'b0 ; // E[0] is ALUSrc
			E[1] = 1'b0 ; // E[1] is RegDst
			E[3:2] = 2'b00 ; // E[3:2] is ALUOp
			E[4] = 1'b0 ; // E[4] is to divd
			j = 1'b1 ;
			jr = 1'b0 ;
			
			$display( "j Instruction" );

		end

		else begin

			$display("control_single unimplemented opcode %d", opcode);

			W = 5'b0 ;
			M = 3'b0 ;
			E = 5'b0 ;
			j = 1'b0 ;
			jr = 1'b0 ;

		end

	end

endmodule

