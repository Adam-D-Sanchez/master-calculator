`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2016 07:43:57 PM
// Design Name: 
// Module Name: Calc_CU
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


module Calc_CU_simple(
	input clk, go,
	input [1:0] op,
	output reg we, rea, reb, sel2, done,
	output reg [1:0] sel1, wa, raa, rab, c,
	output [3:0] Current);

parameter IDLE = 4'b0000, LD1= 4'b0001, LD2= 4'b0010, WAIT=4'b0011, ADD=4'b0100, SUB=4'b0101, AND=4'b0110, XOR=4'b0111, END=4'b1000;

reg [3:0] CS, NS;
reg [14:0] CTRL;

assign Current=CS;

initial begin
CS=4'b0;
end

always@(CS,go,op) begin
		case(CS)
		IDLE: begin 
		          if (go)  NS=LD1;
				  else  NS=IDLE; 
		      end
		LD1: NS=LD2;
		LD2: NS=WAIT;
		WAIT: begin
				case(op)
				2'b00: NS=XOR;
				2'b01: NS=AND;
				2'b10: NS=SUB;
				2'b11: NS=ADD;
				endcase
			  end
		END: NS=IDLE;
		default:NS=END;
		endcase
		end

always@(posedge clk) begin
	CS<=NS;
end

always@(CS)begin
	case(CS)
		IDLE: CTRL=15'b010000000000000;
		LD1:  CTRL=15'b110110000000000;
		LD2:  CTRL=15'b101010000000000;
		WAIT: CTRL=15'b010000000000000;
		ADD:  CTRL=15'b001110111010000;
		SUB:  CTRL=15'b001110111010100;
		AND:  CTRL=15'b001110111011000;
		XOR:  CTRL=15'b001110111011100;
		END:  CTRL=15'b010001111111011;
	endcase
end

always@(CTRL)begin
	sel1= CTRL[14:13];
	wa=   CTRL[12:11];
	we=   CTRL[10];
	raa=  CTRL[9:8];
	rea=  CTRL[7];
	rab=  CTRL[6:5];
	reb=  CTRL[4];
	c=    CTRL[3:2];
	sel2= CTRL[1];
	done= CTRL[0];
end
 
endmodule
