`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 09:22:03 PM
// Design Name: 
// Module Name: SystemCalc_tb
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


module SystemCalc_tb(

    );

    reg [3:0] tb_X, tb_Y;
	reg [1:0] tb_op;
	reg tb_go, tb_clk, tb_rst;
	wire tb_done;
	wire [3:0] tb_H, tb_L;
	reg[7:0] P;
	reg[2:0] S, R;
	integer M,N,O;

	SystemCalc DUT(.X(tb_X), .Y(tb_Y), .op(tb_op), .go(tb_go), .clk(tb_clk), .rst(tb_rst), .done(tb_done), .H(tb_H), .L(tb_L));

	task tick_tock;
	begin 
	#5;
	tb_clk=1;
	#5;
	tb_clk=0;
	end
	endtask 

	initial begin
		tb_rst=1; //clear everything
			tick_tock;
		tb_rst=0;
			tick_tock;

			//begin exhaustive tests

		tb_go=1;
		for(O=0;O<4;O=O+1) begin
			for(M=0;M<16;M=M+1) begin
				for(N=0;N<16;N=N+1) begin
					tb_X=N;
					tb_Y=M;
					tb_op=O;
					P=M*N;
					S=M+N;
					R=N-M;
					while(!tb_done) begin
						tick_tock;
					end
					case(O)
						2'b00: begin 
									if(tb_L!={1'b0,S}) begin 
									$display("Failed addition at %d and %d",N,M); 
									$stop; 
							        end
						end
						2'b01: begin 
									if(tb_L!={1'b0,R}) begin 
									$display("Failed subtraction at %d and %d",N,M); 
									$stop; 
							        end 
						end 
						2'b10: begin 
									if(tb_L!=P[3:0]) begin 
									$display("Lower product failed at %d and %d",N,M); 
									$stop; 
									end 
									if(tb_H!=P[7:4]) begin
									   $display("Upper product failed at %d and %d",N,M);
									   $stop;
							         end
						        end
						default: begin 
									if(tb_H!=N%M) begin
									$display("Remainder failed with %d and %d",N,M);
									$stop;
									end
									if(tb_L!=N/M) begin
									$display("Quotient failed with %d and %d",N,M);
									$stop;
									end
						end
						endcase
					tick_tock;
				end
			end
		end
$display("All tests passed.");
$finish;



	end
endmodule
