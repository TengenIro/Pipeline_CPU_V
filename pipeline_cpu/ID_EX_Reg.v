`timescale 1ns/1ns

module ID_EX_Reg ( clk, rst, enable, Win, Wout, Min, Mout, Ein,
				   ALUSrc, RegDst, divd, ALUOp, PC4In, PC4Out, 
				   RF_RD1In, RF_RD1Out, RF_RD2In, RF_RD2Out, 
				   extendIn, extendOut, rtIn, rtOut, rdIn, rdOut,
				   shamtIn, shamtOut, funcIn, funcOut ) ;

	input clk, rst, enable ;
	input [4:0] Win ;
	input [2:0] Min ;
	input [4:0] Ein ;
	input [31:0] PC4In, RF_RD1In, RF_RD2In ;
	input [31:0] extendIn ;
	input [4:0] rtIn, rdIn, shamtIn ;
	input [5:0] funcIn ;

	output ALUSrc, RegDst, divd ;
	output [1:0] ALUOp ;
	output [4:0] Wout ;
	output [2:0] Mout ;
	output [31:0] PC4Out, RF_RD1Out, RF_RD2Out ;
	output [31:0] extendOut ;
	output [4:0] rtOut, rdOut, shamtOut ;
	output [5:0] funcOut ;
	
	reg T_ALUSrc, T_RegDst, T_divdTemp ;
	reg [1:0] T_ALUOp ;
	reg [4:0] T_Wout ;
	reg [2:0] T_Mout ;
	reg [31:0] T_PC4Out, T_RF_RD1Out, T_RF_RD2Out ;
	reg [31:0] T_extendOut ;
	reg [4:0] T_rtOut, T_rdOut, T_shamtOut ;
	reg [5:0] T_funcOut ;

	always @( posedge clk ) begin

		if ( rst ) begin

			T_ALUSrc <= 1'b0 ;
			T_RegDst <= 1'b0 ;
			T_divdTemp <= 1'b0 ;
			T_Wout <= 5'b0 ;
			T_ALUOp <= 2'b0 ;
			T_Mout <= 3'b0 ;
			T_PC4Out <= 1'b0 ;
			T_RF_RD1Out <= 32'b0 ;
			T_RF_RD2Out <= 32'b0 ;
			T_extendOut <= 32'b0 ;
			T_rtOut <= 5'b0 ;
			T_rdOut <= 5'b0 ;
			T_shamtOut <= 5'b0 ;
			T_funcOut <= 6'b0 ;

		end

		else if ( enable ) begin

			T_ALUSrc <= Ein[0] ;
			T_RegDst <= Ein[1] ;
			T_ALUOp <= Ein[3:2] ;
			T_divdTemp <= Ein[4] ;
			T_Wout <= Win ;
			T_Mout <= Min ;
			T_PC4Out <= PC4In ;
			T_RF_RD1Out <= RF_RD1In ;
			T_RF_RD2Out <= RF_RD2In ;
			T_extendOut <= extendIn ;
			T_rtOut <= rtIn ;
			T_rdOut <= rdIn ;
			T_shamtOut <= shamtIn ;
			T_funcOut <= funcIn ;

		end

	end

	assign ALUSrc = T_ALUSrc ;
	assign RegDst = T_RegDst ;
	assign ALUOp = T_ALUOp ;
	assign divdTemp = T_divdTemp ;
	assign Wout = T_Wout ;
	assign Mout = T_Mout ;
	assign PC4Out = T_PC4Out ;
	assign RF_RD1Out = T_RF_RD1Out ;
	assign RF_RD2Out = T_RF_RD2Out ;
	assign extendOut = T_extendOut ;
	assign rtOut = T_rtOut ;
	assign rdOut = T_rdOut ;
	assign shamtOut = T_shamtOut ;
	assign funcOut = T_funcOut ;
	assign divd = divdTemp ;

endmodule
