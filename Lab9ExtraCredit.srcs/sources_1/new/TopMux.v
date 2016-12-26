`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 05:51:01 PM
// Design Name: 
// Module Name: TopMux
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


module TopMux(input [3:0] A,B,C,D,
	input [1:0] sel1,
	output reg [3:0] F

    );

always@(*) begin
	case(sel1)
		2'b00: F=A;
		2'b01: F=B;
		2'b10: F=C;
		default: F=D;//11 is the default
	endcase
end
endmodule
