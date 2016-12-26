`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2016 03:30:56 PM
// Design Name: 
// Module Name: top_CU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_CU_tb(

    );

reg  tb_clk, tb_go, tb_rst, tb_calc_done, tb_div_done;
reg [1:0] tb_Op;
wire [1:0] tb_H_sel1, tb_L_sel1, tb_calc_op;
wire  tb_op_en, tb_X_en, tb_Y_en, tb_calc_go, tb_div_go, tb_H_en, tb_L_en, tb_t_done;

	parameter IDLE=13'b000_000_0_000011,
    	LOAD=13'b111_000_0_000000,
    	WAIT=13'b000_000_0_000000,
      A_WAIT=13'b000_111_0_000111,
      S_WAIT=13'b000_110_0_000111,
      M_WAIT=13'b000_000_0_101011,
      D_WAIT=13'b000_000_1_111111,
        DONE=13'b000_000_0_000000;

wire [12:0] word={tb_op_en, tb_X_en, tb_Y_en, tb_calc_go, tb_calc_op, tb_div_go, tb_H_sel1, tb_L_sel1, tb_H_en, tb_L_en};

top_CU DUT(.clk(tb_clk), .go(tb_go), .rst(tb_rst), .calc_done(tb_calc_done), .div_done(tb_div_done), .Op(tb_Op), .H_sel1(tb_H_sel1), .L_sel1(tb_L_sel1), .calc_op(tb_calc_op),
.op_en(tb_op_en), .X_en(tb_X_en), .Y_en(tb_Y_en), .calc_go(tb_calc_go), .div_go(tb_div_go), .H_en(tb_H_en), .L_en(tb_L_en), .t_done(tb_t_done));




	task tick_tock;
	begin 
	#5;
	tb_clk=1;
	#5;
	tb_clk=0;
	end
	endtask


 

   
	initial begin

	//addition run


		tick_tock;
			if(word!=IDLE)begin $display("Error in IDLE"); $stop; end
	tb_Op=2'b00;
	tb_go=1;
		tick_tock;
			if(word!=LOAD)begin $display("Error in LOAD 1"); $stop; end
		tick_tock;
	tb_go=0;
			if(word!=WAIT)begin $display("Error in WAIT -addition"); $stop; end
		tick_tock;
			if(word!=A_WAIT)begin $display("Error in A_WAIT"); $stop; end
		tb_calc_done=1;
		tick_tock;
		tb_calc_done=0;
			if(word!=DONE)begin $display("Error in DONE -addition run"); $stop; end
		tick_tock;


  //subtraction run


		tick_tock;
			if(word!=IDLE)begin $display("Error in IDLE"); $stop; end
	tb_Op=2'b01;
	tb_go=1;
		tick_tock;
			if(word!=LOAD)begin $display("Error in LOAD 2"); $stop; end
		tick_tock;
	tb_go=0;
			if(word!=WAIT)begin $display("Error in WAIT -subtraction run"); $stop; end
		tick_tock;
			if(word!=S_WAIT)begin $display("Error in S_WAIT"); $stop; end
		tb_calc_done=1;
		tick_tock;
		tb_calc_done=0;
			if(word!=DONE)begin $display("Error in DONE -subtraction run"); $stop; end
		tick_tock;

	///multiplcation run


		tick_tock;
			if(word!=IDLE)begin $display("Error in IDLE"); $stop; end
	tb_Op=2'b10;
	tb_go=1;
		tick_tock;
			if(word!=LOAD)begin $display("Error in LOAD 3"); $stop; end
		tick_tock;
	tb_go=0;
			if(word!=WAIT)begin $display("Error in WAIT -multiply run"); $stop; end
		tick_tock;
			if(word!=M_WAIT)begin $display("Error in M_WAIT"); $stop; end
		tick_tock;
			if(word!=DONE)begin $display("Error in DONE -multiply run"); $stop; end
		tick_tock;


		//division run


		tick_tock;
			if(word!=IDLE)begin $display("Error in IDLE"); $stop; end
	tb_Op=2'b11;
	tb_go=1;
		tick_tock;
			if(word!=LOAD)begin $display("Error in LOAD 4"); $stop; end
		tick_tock;
	tb_go=0;
			if(word!=WAIT)begin $display("Error in WAIT -division run"); $stop; end
		tick_tock;
			if(word!=D_WAIT)begin $display("Error in D_WAIT"); $stop; end
		tb_div_done=1;
		tick_tock;
			if(word!=DONE)begin $display("Error in DONE -division run"); $stop; end
		tick_tock;

$display("All tests passed.");
$finish;

	end
endmodule
