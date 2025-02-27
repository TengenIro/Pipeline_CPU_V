`timescale 1ns/1ns

module tb_pipeline() ;

	reg clk, rst, pc_enable;

	initial begin

		clk = 1;

		forever #5 clk = ~clk;

	end

	initial begin

		rst = 1'b1;
		pc_enable = 1'b0 ;
		$readmemh("instr_mem.txt", CPU.InstrMem.mem_array );
		$readmemh("data_mem.txt", CPU.DatMem.mem_array );
		$readmemh("reg.txt", CPU.RegFile.file_array );

		#10;
		rst = 1'b0;
		pc_enable = 1'b1 ;

	end

	always @( posedge clk ) begin

		$display( "%d, PC:", $time/10-1, CPU.pc );
	//	$display( "%d, MEM:", CPU.MEM_aluOut );
	//	$display( "%d, MUX:", CPU.rfile_wd );
	//	$display( "%d, sel:", CPU.memtoReg );

		if ( CPU.opcode == 6'd0 ) begin

			$display( "%d, wd: %d", $time/10-1, CPU.rfile_wd );

			if ( CPU.ID_functIn == 6'd32 )
				$display( "%d, ADD\n", $time/10-1 );

			else if ( CPU.ID_functIn == 6'd34 )
				$display( "%d, SUB\n", $time/10-1 );

			else if ( CPU.ID_functIn == 6'd36 )
				$display( "%d, AND\n", $time/10-1 );

			else if ( CPU.ID_functIn == 6'd37 )
				$display( "%d, OR\n", $time/10-1 );

		end

		else if ( CPU.opcode == 6'd35 )
			$display( "%d, LW\n", $time/10-1 );

		else if ( CPU.opcode == 6'd43 )
			$display( "%d, SW\n", $time/10-1 );

		else if ( CPU.opcode == 6'd4 )
			$display( "%d, BEQ\n", $time/10-1 );

		else if ( CPU.opcode == 6'd2 )
			$display( "%d, J\n", $time/10-1 );

	end

	mips_pipeline CPU( clk, rst, pc_enable );

endmodule
