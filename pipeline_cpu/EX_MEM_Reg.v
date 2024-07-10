`timescale 1ns/1ns

module EX_MEM_Reg ( clk, rst, enable, Win, Min, Wout, isBranch,
					shiftIn, shiftOut, branchPCIn, branchPCOut,
					divdIn, divdOut, ALUIn, ALUOut, openHiLoIn, openHiLoOut,
					RD2In, RD2Out, zeroIn, zeroOut, 
					rtOrRdIn, rtOrRdOut, memWrite, memRead ) ;

	input clk, rst, enable, openHiLoIn ;
	input [4:0] Win ;
	input [2:0] Min ;
	input [31:0] branchPCIn, ALUIn, RD2In, shiftIn ;
	input [63:0] divdIn ;
	input zeroIn ;
	input [4:0] rtOrRdIn ;

	output isBranch, memWrite, memRead, openHiLoOut ;
	output [4:0] Wout ;
	output [31:0] branchPCOut, ALUOut, RD2Out, shiftOut ;
	output [63:0] divdOut ;
	output zeroOut ;
	output [4:0] rtOrRdOut ;

	reg T_isBranch, T_memWrite, T_memRead, T_openHiLoOut ;
	reg [4:0] T_Wout ;
	reg [31:0] T_branchPCOut, T_ALUOut, T_RD2Out, T_shiftOut ;
	reg [63:0] T_divdOut ;
	reg T_zeroOut ;
	reg [4:0] T_rtOrRdOut ;

	always @( posedge clk ) begin

		if ( rst ) begin

			T_isBranch <= 1'b0 ;
			T_memWrite <= 1'b0 ;
			T_memRead <= 1'b0 ;
			T_openHiLoOut <= 1'b0 ;
			T_Wout <= 5'b0 ;
			T_branchPCOut <= 32'b0 ;
			T_divdOut <= 64'b0 ;
			T_shiftOut <= 32'b0 ;
			T_ALUOut <= 32'b0 ;
			T_RD2Out <= 32'b0 ;
			T_zeroOut <= 1'b0 ;
			T_rtOrRdOut <= 5'b0 ;

		end

		else if ( enable ) begin

			T_isBranch <= Min[0] ;
			T_memWrite <= Min[1] ;
			T_memRead <= Min[2] ;
			T_openHiLoOut <= openHiLoIn ;
			T_Wout <= Win ;
			T_branchPCOut <= branchPCIn ;
			T_divdOut <= divdIn ;
			T_shiftOut <= shiftIn ;
			T_ALUOut <= ALUIn ;
			T_RD2Out <= RD2In ;
			T_zeroOut <= zeroIn ;
			T_rtOrRdOut <= rtOrRdIn ;

		end

	end

	assign isBranch = T_isBranch ;
	assign memWrite = T_memWrite ;
	assign memRead = T_memRead ;
	assign openHiLoOut = T_openHiLoOut ;
	assign Wout = T_Wout ;
	assign branchPCOut = T_branchPCOut ;
	assign divdOut = T_divdOut ;
	assign shiftOut = T_shiftOut ;
	assign ALUOut = T_ALUOut ;
	assign RD2Out = T_RD2Out ;
	assign zeroOut = T_zeroOut ;
	assign rtOrRdOut = T_rtOrRdOut ;

endmodule
