`timescale 1ns/1ns

module mips_pipeline( clk, rst, pc_enable );

	input clk, rst, pc_enable ;

	// instruction bus
	wire [31:0] instrctionReg, instructionOut;

	wire EX_openHiLoIn, MEM_openHiLoIn, MEM_openHiLoOut, startDivd ;
	wire [4:0] ID_WIn, EX_WIn, MEM_WIn ;
	wire [2:0] ID_MIn, EX_MIn ;
	wire [4:0] ID_EIn ;

	// break out important fields from instruction
	wire [5:0] opcode, ID_functIn, ID_funcOut, sigToDivd ;
	wire [4:0] rs, ID_rtIn, ID_rdIn, ID_shamtIn, ID_shamtOut ;
	wire [15:0] immed;
	wire [31:0] ID_extend_immedIn, ID_extend_immedOut, b_offset;
	wire [25:0] jumpoffset;

	// datapath signals
	wire [4:0]  ID_rtOut, ID_rdOut, EX_rtOrRdIn, EX_rtOrRdOut, MEM_rtOrRdOut ;

	wire [31:0] EX_shiftIn, MEM_shiftIn, MEM_shiftOut ;
	wire [31:0] ID_rfile_rd1In, ID_rfile_rd1Out, ID_rfile_rd2In,
				ID_rfile_rd2Out, EX_rfile_rd2Out, mToR, sToR, hiToLo, rfile_wd, alu_b, alu_a, EX_aluIn,
				EX_aluOut, MEM_aluOut, EX_b_tgtIn, EX_b_tgtOut, pc_next, bOut, jOut,
				pc, pc_incrReg, pc_incrOut, MEM_dmem_rdataIn, MEM_dmem_rdataOut,
				jump_addr, branch_addr, ID_PCOut, hiOut, loOut ;

	wire [63:0] EX_divdIn, MEM_divdIn, MEM_divdOut ;

	// control signals
	wire RegWrite, EX_BranchOut, PCSrc, RegDst, memtoReg, divd, mfhi, mflo,
		 MemRead, MemWrite, ALUSrc, EX_ZeroIn, EX_ZeroOut, Jump, JumpR, ifShift ;
	wire [1:0] ALUOp;
	wire [2:0] Operation;

	// module instantiations

	reg32 PC( .clk(clk), .rst(rst), .en_reg(pc_enable), .d_in(pc_next), .d_out(pc) );

	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incrReg) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instrctionReg) );

	IF_ID_Reg IF_ID( .clk(clk), .rst(rst), .enable(1'b1), .instructionIn(instrctionReg),
					 .instructionOut(instructionOut), .PC_4In(pc_incrReg), .PC_4Out(pc_incrOut) ) ;

	assign opcode = instructionOut[31:26];
	assign rs = instructionOut[25:21];
	assign ID_rtIn = instructionOut[20:16];
	assign ID_rdIn = instructionOut[15:11];
	assign ID_shamtIn = instructionOut[10:6];
	assign ID_functIn = instructionOut[5:0];
	assign immed = instructionOut[15:0];
	assign jumpoffset = instructionOut[25:0];

	// jump offset shifter & concatenation
	assign jump_addr = { pc_incrOut[31:28], jumpoffset << 2 };

	control_single ctrl( .rst(rst), .allInstr(instructionOut), .opcode(opcode), 
						 .W(ID_WIn), .M(ID_MIn), .E(ID_EIn), .j(Jump), .jr(JumpR) ) ;

	reg_file RegFile( .clk(clk), .RegWrite(RegWrite), .RN1(rs), .RN2(ID_rtIn), .WN(MEM_rtOrRdOut),
					  .WD(rfile_wd), .RD1(ID_rfile_rd1In), .RD2(ID_rfile_rd2In) );

	// sign-extender
	sign_extend SignExt( immed, ID_extend_immedIn );

	ID_EX_Reg ID_EX( .clk(clk), .rst(rst), .enable(1'b1), .Win(ID_WIn),
					 .Wout(EX_WIn), .Min(ID_MIn), .Mout(EX_MIn), .Ein(ID_EIn),
					 .ALUSrc(ALUSrc), .RegDst(RegDst), .divd(divd), .ALUOp(ALUOp),
					 .PC4In(pc_incrOut), .PC4Out(ID_PCOut), .RF_RD1In(ID_rfile_rd1In),
					 .RF_RD1Out(ID_rfile_rd1Out), .RF_RD2In(ID_rfile_rd2In),
					 .RF_RD2Out(ID_rfile_rd2Out), .extendIn(ID_extend_immedIn),
					 .extendOut(ID_extend_immedOut), .rtIn(ID_rtIn), .rtOut(ID_rtOut), .rdIn(ID_rdIn),
					 .rdOut(ID_rdOut), .shamtIn(ID_shamtIn), .shamtOut(ID_shamtOut),
					 .funcIn(ID_functIn), .funcOut(ID_funcOut) ) ;
					 
	DivControl divControl( .clk(clk), .Signal(divd), .SignaltoDIV(sigToDivd), .openHiLo(EX_openHiLoIn), .give(startDivd) ) ;
	Divider divder( .clk(clk), .dataA(ID_rfile_rd1Out), 
					.dataB(ID_rfile_rd2Out), .Signal(sigToDivd), .dataOut(EX_divdIn), .reset(rst), .enable(startDivd) ) ;

	// branch offset shifter
	assign b_offset = ID_extend_immedOut << 2 ;
	
	Shifter shift( .dataA(ID_rfile_rd2Out), .dataB(ID_shamtOut), .dataOut(EX_shiftIn), .reset(rst) ) ;

	add32 BRADD( .a(ID_PCOut), .b(b_offset), .result(EX_b_tgtIn) );

	mux2 ALUBMux( .sel(ALUSrc), .a(ID_extend_immedOut), .b(ID_rfile_rd2Out), .y(alu_b) ) ;

	alu_ctl ALUContol( .ALUOp(ALUOp), .Funct(ID_funcOut), .ALUOperation(Operation) ) ;
 
	ALU alu( .Signal(Operation), .dataA(ID_rfile_rd1Out), .dataB(alu_b),
			 .dataOut(EX_aluIn), .reset(rst), .isZero(EX_ZeroIn) );

	mux2S5 regDest( .sel(RegDst), .a(ID_rdOut), .b(ID_rtOut), .y(EX_rtOrRdIn) ) ;

	EX_MEM_Reg EX_MEM( .clk(clk), .rst(rst), .enable(1'b1), .Win(EX_WIn),
					   .Min(EX_MIn), .Wout(MEM_WIn), .isBranch(EX_BranchOut),
					   .shiftIn(EX_shiftIn), .shiftOut(MEM_shiftIn),
					   .branchPCIn(EX_b_tgtIn), .branchPCOut(EX_b_tgtOut), .divdIn(EX_divdIn), 
					   .divdOut(MEM_divdIn), .ALUIn(EX_aluIn), .ALUOut(EX_aluOut), 
					   .openHiLoIn(EX_openHiLoIn), .openHiLoOut(MEM_openHiLoIn), .RD2In(ID_rfile_rd2Out),
					   .RD2Out(EX_rfile_rd2Out), .zeroIn(EX_ZeroIn), .zeroOut(EX_ZeroOut),
					   .rtOrRdIn(EX_rtOrRdIn), .rtOrRdOut(EX_rtOrRdOut),
					   .memWrite(MemWrite), .memRead(MemRead) ) ;

	and BR_AND( PCSrc, EX_BranchOut, EX_ZeroOut );

	mux2 PCMux( .sel(PCSrc), .a(EX_b_tgtOut), .b(pc_incrReg), .y(bOut) ) ; // PCSrc
	mux2 J( .sel(Jump), .a(jump_addr), .b(bOut), .y(jOut) ) ; // Jump
	mux2 JR( .sel(JumpR), .a(ID_rfile_rd1In), .b(jOut), .y(pc_next) ) ; //JumpR

	memory DatMem( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .wd(EX_rfile_rd2Out),
				   .addr(EX_aluOut), .rd(MEM_dmem_rdataIn) ) ;

	MEM_WB_Reg MEM_WB( .clk(clk), .rst(rst), .enable(1'b1), .Win(MEM_WIn),
					   .RegWrite(RegWrite), .MemToReg(memtoReg), .ALUIn(EX_aluOut),
					   .shiftIn(MEM_shiftIn), .shiftOut(MEM_shiftOut), .shift(ifShift),
					   .mfhi(mfhi), .mflo(mflo), .openHiLoIn(MEM_openHiLoIn), .openHiLoOut(MEM_openHiLoOut),
					   .divdIn(MEM_divdIn), .divdOut(MEM_divdOut), .ALUOut(MEM_aluOut), .memDataIn(MEM_dmem_rdataIn),
					   .memDataOut(MEM_dmem_rdataOut), .rtOrRdIn(EX_rtOrRdOut), .rtOrRdOut(MEM_rtOrRdOut) ) ;

	HiLo HiLo_reg( .clk(clk), .DivAns(MEM_divdOut), .HiOut(hiOut), .LoOut(loOut), .reset(rst), .enable(MEM_openHiLoOut) ) ;

	mux2 memToRegMux( .sel(memtoReg), .a(MEM_dmem_rdataOut), .b(MEM_aluOut), .y(mToR) ) ;
	mux2 shiftToRegMux( .sel(ifShift), .a(MEM_shiftOut), .b(mToR), .y(sToR) ) ;
	
	mux2 hiMux( .sel(mfhi), .a(hiOut), .b(sToR), .y(hiToLo) ) ;
	mux2 loMux( .sel(mflo), .a(loOut), .b(hiToLo), .y(rfile_wd) ) ;

endmodule
