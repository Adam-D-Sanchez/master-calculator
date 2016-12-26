`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 08:16:07 PM
// Design Name: 
// Module Name: top_CU
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


module top_CU( input clk, go, rst, calc_done, div_done,
input [1:0] Op,
output [1:0] H_sel1, L_sel1, calc_op,
output  op_en, X_en, Y_en, calc_go, div_go, H_en, L_en, t_done,
output [2:0] CURR
    );

    reg [14:0] word;
    reg [3:0] CS,NS;
    parameter IDLE=3'b000, LOAD=3'b001, WAIT=3'b010, A_WAIT=3'b011, S_WAIT=3'b100, M_WAIT=3'b101, D_WAIT=3'b110, DONE=3'b111;
    assign {op_en, X_en, Y_en, calc_go, calc_op, div_go, H_sel1, L_sel1, H_en, L_en, t_done} = word;

    initial begin
    	CS=IDLE;
    end
    assign CURR=CS;

    always@(go, rst, calc_done, div_done, Op, CS) begin
    	case(CS)
    		IDLE:begin  if(go) NS=LOAD;
    			  else NS=IDLE;
    			  end
    		LOAD: NS=WAIT;
    		WAIT:begin 
    				 case(Op)
    					2'b00: NS=A_WAIT;
    					2'b01: NS=S_WAIT;
    					2'b10: NS=M_WAIT;
    					2'b11: NS=D_WAIT;
    				  endcase
    			 end
    		A_WAIT:begin if(calc_done) NS=DONE;
    					 else NS=A_WAIT;
    			   end
    		S_WAIT:begin if(calc_done) NS=DONE;
    					 else NS=S_WAIT;
    			   end
    		M_WAIT: NS=DONE;
    		D_WAIT:begin if(div_done) NS=DONE;
    					 else NS=D_WAIT;
    			   end
    		default: NS=IDLE;
    	endcase
    end

    always@(posedge clk, posedge rst) begin
    	if(rst) CS<=IDLE;
    	else CS<=NS;
    end

    always@(CS) begin
    	case(CS)
    	IDLE: word=14'b000_000_0_000011_0;
    	LOAD: word=14'b111_000_0_000000_0;
    	WAIT: word=14'b000_000_0_000000_0;
      A_WAIT: word=14'b000_111_0_000111_0;
      S_WAIT: word=14'b000_110_0_000111_0;
      M_WAIT: word=14'b000_000_0_101011_0;
      D_WAIT: word=14'b000_000_1_111111_0;
        DONE: word=14'b000_000_0_000000_1;
       endcase
    end
endmodule
