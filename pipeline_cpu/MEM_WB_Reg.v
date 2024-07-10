`timescale 1ns/1ns

module MEM_WB_Reg ( clk, rst, enable, Win, RegWrite, MemToReg, ALUIn, 
				   shiftIn, shiftOut, shift, mfhi, mflo, openHiLoIn, openHiLoOut, 
				   divdIn, divdOut, ALUOut, memDataIn, memDataOut, rtOrRdIn, rtOrRdOut ) ;

	input clk, rst, enable, openHiLoIn ;
	input [4:0] Win ;
	input [31:0] ALUIn, memDataIn, shiftIn ;
	input [63:0] divdIn ;
	input [4:0] rtOrRdIn ;

	output RegWrite, MemToReg, shift, mfhi, mflo, openHiLoOut ;
	output [31:0] ALUOut, memDataOut, shiftOut ;
	output [63:0] divdOut ;
	output [4:0] rtOrRdOut ;

	reg T_RegWrite, T_MemToReg, T_shift, T_mfhi, T_mflo, T_openHiLoOut ;
	reg [31:0] T_ALUOut, T_memDataOut, T_shiftOut ;
	reg [63:0] T_divdOut ;
	reg [4:0] T_rtOrRdOut ;

	always @( posedge clk ) begin

		if ( rst ) begin

			T_RegWrite <= 1'b0 ;
			T_MemToReg <= 1'b0 ;
			T_shift <= 1'b0 ;
			T_mfhi <= 1'b0 ;
			T_mflo <= 1'b0 ;
			T_openHiLoOut <= 1'b0 ;
			T_divdOut <= 64'b0 ;
			T_ALUOut <= 32'b0 ;
			T_memDataOut <= 32'b0 ;
			T_shiftOut <= 32'b0 ;
			T_rtOrRdOut <= 5'b0 ;

		end

		else if ( enable ) begin

			T_RegWrite <= Win[0] ;
			T_MemToReg <= Win[1] ;
			T_shift <= Win[2] ;
			T_mfhi <= Win[3] ;
			T_mflo <= Win[4] ;
			T_openHiLoOut <= openHiLoIn ;
			T_divdOut <= divdIn ;
			T_ALUOut <= ALUIn ;
			T_shiftOut <= shiftIn ;
			T_memDataOut <= memDataIn ;
			T_rtOrRdOut <= rtOrRdIn ;

		end

	end

	assign RegWrite = T_RegWrite ;
	assign MemToReg = T_MemToReg ;
	assign shift = T_shift ;
	assign mfhi = T_mfhi ;
	assign mflo = T_mflo ;
	assign openHiLoOut = T_openHiLoOut ;
	assign divdOut = T_divdOut ;
	assign ALUOut = T_ALUOut ;
	assign shiftOut = T_shiftOut ;
	assign memDataOut = T_memDataOut ;
	assign rtOrRdOut = T_rtOrRdOut ;

endmodule
