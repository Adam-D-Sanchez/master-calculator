`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 05:53:15 PM
// Design Name: 
// Module Name: mux1
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


module MUX1(in1, in2, in3, in4, s1, m1out);
//Taken from Donald Hung's Lab 7 Assignment
input [2:0] in1, in2, in3, in4; input [1:0] s1; output reg [2:0] m1out;

always @ (in1, in2, in3, in4, s1)
begin
 case (s1)   
 	2'b11:  m1out = in1;
 	2'b10:  m1out = in2; 
    2'b01:  m1out = in3;   
    default:  m1out = in4; // 2'b00
 endcase
end

endmodule
