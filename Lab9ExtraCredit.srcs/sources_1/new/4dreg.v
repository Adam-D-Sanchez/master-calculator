`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 05:38:09 PM
// Design Name: 
// Module Name: 4dreg
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


module fourdreg(input [3:0] D,
	input clk, en, rst,
	output reg [3:0] Q
    );

always@(posedge clk, posedge rst) begin
	if(rst) Q<=4'b0000;
	else if (en) Q<=D;
	else Q<=Q;
end
endmodule
