`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2016 09:47:08 PM
// Design Name: 
// Module Name: FSM_Calc
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


module FSM_Calc(
input CLK, GO,
input [1:0] OP,
input [2:0] IN1,IN2,
output DONE,
output [2:0] OUT,
output [3:0] CURRENT
    );
wire t_we, t_rea, t_reb, t_sel2;
wire [1:0] t_sel1, t_wa, t_raa, t_rab, t_c;

    
Calc_CU_simple ControlUnit(.clk(CLK),.go(GO),.op(OP),.we(t_we),.rea(t_rea),.reb(t_reb),.sel2(t_sel2),.done(DONE),.sel1(t_sel1),.wa(t_wa),.raa(t_raa),.rab(t_rab),.c(t_c),.Current(CURRENT));
DP DataPath(.in1(IN1),.in2(IN2),.s1(t_sel1),.clk(CLK),.wa(t_wa),.we(t_we),.raa(t_raa),.rea(t_rea),.rab(t_rab),.reb(t_reb),.c(t_c),.s2(t_sel2),.out(OUT)); 
endmodule
