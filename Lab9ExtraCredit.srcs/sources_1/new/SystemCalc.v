`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 08:49:43 PM
// Design Name: 
// Module Name: SystemCalc
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


module SystemCalc(
	input [3:0] X, Y, 
	input [1:0] op,
	input go, clk, rst,
	output done,
	output [3:0] H, L,
	output [2:0] Curr
    );

wire A, //calc_done
	 B, //div_done
	 C, //op_en
	 D, //X_en
	 E, //Y_en
	 F, //calc_go
	 G, //div_go
	 J, //H_en
	 K; //L_en

wire [1:0] AA,//op_wire
	 	   BB,//H_sel1
	 	   CC,//L_sel1
	 	   DD,//calc_op
	 	   EE; //Op 

top_CU topController(.clk(clk),.go(go),.rst(rst),.calc_done(A),.div_done(B),.Op(AA),.H_sel1(BB),.L_sel1(CC),.calc_op(DD),.op_en(C),.X_en(D),.Y_en(E),.calc_go(F),.div_go(G),.H_en(J),.L_en(K),.t_done(done), .CURR(Curr));
topdatapath topManipulator(.X_in(X),.Y_in(Y),.H_sel1(BB),.L_sel1(CC),.Op_in(op),.clk(clk),.rst(rst),.op_en(C),.X_en(D),.Y_en(E),.calc_go(F),.div_go(G),.H_en(J),.L_en(K),.H_out(H),.L_out(L),.calc_op(DD),.calc_done(A),.div_done(B),.Op_out(AA));

endmodule
