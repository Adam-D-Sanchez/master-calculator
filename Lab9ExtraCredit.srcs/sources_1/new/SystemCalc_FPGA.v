`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2016 12:05:23 PM
// Design Name: 
// Module Name: SystemCalc_FPGA
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


module SystemCalc_FPGA(input clk100MHz, rst, go, button,
	input [3:0] X, Y,
	input [1:0] Op,
	output done,
	output [7:0] LEDSEL, LEDOUT
    );
    
    supply1 [7:0] vcc;
    
    wire [2:0] Curr_wire; 
    wire [3:0] High_wire, Low_wire;
    wire [6:0] C_wire, H_wire, L_wire;
  

	clk_gen ClockMaker(.clk100MHz(clk100MHz),.rst(rst),.clk_5KHz(p_clk));
	debounce pushClock(.pb(button),.clk(p_clk),.pb_debounced(clk));
	SystemCalc Calculator(.X(X),.Y(Y),.op(Op),.go(go),.clk(clk),.rst(rst),.done(done),.H(High_wire),.L(Low_wire),.Curr(Curr_wire));
	b27 CurrentState(.in({1'b0,Curr_wire}),.s(C_wire));
	b27 HighReg (.in(High_wire),.s(H_wire));
	b27 LowReg (.in(Low_wire),.s(L_wire));
	led_mux DisplayDigits(.clk(p_clk),.rst(rst),.LED0({1'b1,C_wire}),.LED1(vcc),.LED2(vcc),.LED3(vcc),.LED4(vcc),.LED5(vcc),.LED6({1'b1,H_wire}),.LED7({1'b1,L_wire}),.LEDSEL(LEDOUT),.LEDOUT(LEDSEL));
	
endmodule
