
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 01:52:38 PM
// Design Name: 
// Module Name: b27
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



module b27(
input [3:0]in,
output reg [6:0]s
    );
    
    //this module was heavily inspired by the given bcd_to_7seg module, but was made to reduce
    //typing in top level modules.
always @ (in)
      begin
      case (in) 
    4'b0000: begin s[0]=0; s[1]=0; s[2]=0; s[3]=1; s[4]=0; s[5]=0; s[6]=0; end //0
    4'b0001: begin s[0]=1; s[1]=0; s[2]=1; s[3]=1; s[4]=0; s[5]=1; s[6]=1; end //1
    4'b0010: begin s[0]=0; s[1]=1; s[2]=0; s[3]=0; s[4]=0; s[5]=1; s[6]=0; end //2
    4'b0011: begin s[0]=0; s[1]=0; s[2]=1; s[3]=0; s[4]=0; s[5]=1; s[6]=0; end //3
    4'b0100: begin s[0]=1; s[1]=0; s[2]=1; s[3]=0; s[4]=0; s[5]=0; s[6]=1; end //4
    4'b0101: begin s[0]=0; s[1]=0; s[2]=1; s[3]=0; s[4]=1; s[5]=0; s[6]=0; end //5
    4'b0110: begin s[0]=0; s[1]=0; s[2]=0; s[3]=0; s[4]=1; s[5]=0; s[6]=0; end //6
    4'b0111: begin s[0]=1; s[1]=0; s[2]=1; s[3]=1; s[4]=0; s[5]=1; s[6]=0; end //7
    4'b1000: begin s[0]=0; s[1]=0; s[2]=0; s[3]=0; s[4]=0; s[5]=0; s[6]=0; end //8
    4'b1001: begin s[0]=0; s[1]=0; s[2]=1; s[3]=0; s[4]=0; s[5]=0; s[6]=0; end //9
    4'b1010: begin s[0]=1; s[1]=0; s[2]=0; s[3]=0; s[4]=0; s[5]=0; s[6]=0; end //A
    4'b1011: begin s[0]=0; s[1]=0; s[2]=0; s[3]=0; s[4]=1; s[5]=0; s[6]=1; end //B
    4'b1100: begin s[0]=0; s[1]=1; s[2]=0; s[3]=1; s[4]=1; s[5]=0; s[6]=0; end //C
    4'b1101: begin s[0]=0; s[1]=0; s[2]=0; s[3]=0; s[4]=0; s[5]=1; s[6]=1; end //D
    4'b1110: begin s[0]=0; s[1]=1; s[2]=0; s[3]=0; s[4]=1; s[5]=0; s[6]=0; end //E
    4'b1111: begin s[0]=1; s[1]=1; s[2]=0; s[3]=0; s[4]=1; s[5]=0; s[6]=0; end //F
    default: begin s[0]=1; s[1]=1; s[2]=1; s[3]=1; s[4]=1; s[5]=1; s[6]=1; end //off
    endcase
    end    
endmodule
