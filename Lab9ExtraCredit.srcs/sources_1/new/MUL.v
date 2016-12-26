`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 05:56:09 PM
// Design Name: 
// Module Name: MUL
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


module MUL( input[3:0] A, B,
output [3:0] PH, PL

    );
reg [7:0] C;
always@(A,B) begin
	C=A*B;
end
assign PH=C[7:4];
assign PL=C[3:0];

endmodule
