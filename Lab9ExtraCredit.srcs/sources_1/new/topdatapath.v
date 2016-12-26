`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 06:04:24 PM
// Design Name: 
// Module Name: topdatapath
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


module topdatapath(input [3:0]X_in, Y_in,
	input [1:0] H_sel1, L_sel1, Op_in, calc_op,
	input clk, rst, op_en, X_en, Y_en, calc_go, div_go, H_en, L_en,
	output [3:0] H_out, L_out,
	output [1:0] Op_out,
	output calc_done, div_done
    );

wire [3:0] A_wire,B_wire,PH_wire,PL_wire,Q_wire,R_wire,L_wire,H_wire;
wire[2:0] AA;

twodreg Operator(.D(Op_in),.clk(clk),.rst(rst),.en(op_en),.Q(Op_out));
fourdreg X_input(.D(X_in),.clk(clk),.rst(rst),.en(X_en),.Q(A_wire));
fourdreg Y_input(.D(Y_in),.clk(clk),.rst(rst),.en(Y_en),.Q(B_wire));
FSM_Calc AddSub(.CLK(clk),.GO(calc_go),.OP(calc_op),.IN1(A_wire[2:0]),.IN2(B_wire[2:0]),.DONE(calc_done),.OUT(AA));
MUL Multiply(.A(A_wire),.B(B_wire),.PH(PH_wire),.PL(PL_wire));
DivCalc Divide(.clk(clk),.rst(rst),.go(div_go),.DVND(A_wire),.DVSR(B_wire),.done(div_done),.QTNT(Q_wire),.RMDR(R_wire));
TopMux H_mux(.A(4'b0),.B(4'b0),.C(PH_wire),.D(R_wire),.sel1(H_sel1),.F(H_wire));
TopMux L_mux(.A(4'b0),.B({1'b0,AA}),.C(PL_wire),.D(Q_wire),.sel1(L_sel1),.F(L_wire));
fourdreg H_reg(.D(H_wire),.clk(clk),.rst(rst),.en(H_en),.Q(H_out));
fourdreg L_reg(.D(L_wire),.clk(clk),.rst(rst),.en(L_en),.Q(L_out));

endmodule
