`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 05:55:35 PM
// Design Name: 
// Module Name: twodreg
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


module twodreg( input [1:0] D,
	input clk, en, rst,
	output reg [1:0] Q
    );

always@(posedge clk, posedge rst) begin
	if (rst) Q<=2'b00;
	else if (en) Q<=D;
	else Q<=Q;
end

endmodule
