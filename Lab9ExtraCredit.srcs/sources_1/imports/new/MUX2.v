`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 05:55:19 PM
// Design Name: 
// Module Name: MUX2
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


module MUX2 (in1, in2, s2, m2out);
//Taken from Donald Hung's Lab 7 Assignment

input [2:0] in1, in2; 
input s2; 
output reg [2:0] m2out;

always @ (in1, in2, s2)
	begin
		if (s2)  m2out = in1;
		else
 		m2out = in2;
end

endmodule
