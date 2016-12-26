`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2016 03:30:29 PM
// Design Name: 
// Module Name: topdatapath_tb
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


module topdatapath_tb(

    );
    reg [3:0] tb_X_in, tb_Y_in;
	wire [1:0] tb_H_sel1, tb_L_sel1,tb_calc_op;
	reg [1:0] tb_Op_in;
	reg tb_clk, tb_rst;
	wire tb_op_en, tb_X_en, tb_Y_en, tb_calc_go, tb_div_go, tb_H_en, tb_L_en;
	reg [12:0] state;
	wire [3:0] tb_H_out, tb_L_out;
	wire [1:0] tb_Op_out;
	wire tb_calc_done, tb_div_done;

	parameter IDLE=13'b000_000_0_000011,
    	LOAD=13'b111_000_0_000000,
    	WAIT=13'b000_000_0_000000,
      A_WAIT=13'b000_111_0_000111,
      S_WAIT=13'b000_110_0_000111,
      M_WAIT=13'b000_000_0_101011,
      D_WAIT=13'b000_000_1_111111,
        DONE=13'b000_000_0_000000;

        assign {tb_op_en, tb_X_en, tb_Y_en, tb_calc_go, tb_calc_op, tb_div_go, tb_H_sel1, tb_L_sel1, tb_H_en, tb_L_en} = state;

	topdatapath DUT(.X_in(tb_X_in), .Y_in(tb_Y_in), .H_sel1(tb_H_sel1), .L_sel1(tb_L_sel1), .Op_in(tb_Op_in), .calc_op(tb_calc_op), .clk(tb_clk), .rst(tb_rst), .op_en(tb_op_en), .X_en(tb_X_en), .Y_en(tb_Y_en), .calc_go(tb_calc_go), .div_go(tb_div_go), .H_en(tb_H_en), .L_en(tb_L_en), .H_out(tb_H_out), .L_out(tb_L_out), .Op_out(tb_Op_out), .calc_done(tb_calc_done), .div_done(tb_div_done));


	task tick_tock;
	begin 
	#5;
	tb_clk=1;
	#5;
	tb_clk=0;
	end
	endtask

	initial begin
		tb_rst=1; //Reset block
				tick_tock;
		tb_rst=0;
				tick_tock;

		 //begin test
		 tb_X_in=4'b0011;
		 tb_Y_in=4'b1001;
		 tb_Op_in=2'b10;
		 
		 	state=IDLE;
		 			tick_tock;
		 	state=LOAD;
		 			tick_tock;
		 	state=WAIT;
		 			tick_tock;
			 state=M_WAIT;
		 			tick_tock;
		 	state=DONE;
		 			tick_tock;
		 				if (tb_H_out!=4'b0001) begin
		 					$display("Upper product failed."); 
		 					$stop;
		 				end
		 				if (tb_L_out!=4'b1011) begin
		 					$display("Lower product failed.");
		 					$stop;
		 				end

		 $display("Datapath test passed.");
		 $finish;

		 end
endmodule
