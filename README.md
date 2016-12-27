# master-calculator
This is the extra credit lab for CMPE 125 at San Jose State University. This pulls together existing parts from Lab 8 and Lab 7. The calculator is capable of performing:

3 digit binary addition, with three bit operands and 3 bit sum. (Using opcode 00)
3 digit binary subtraction (using 2's complement), with three bit operands and 3 bit difference. (Using opcode 01)
4 digit binary multiplication, with 4 bit factors and 8 bit products. (Using opcode 10)
4 digiit binary division, with 4 bit quotient and 4 bit remainder. 


The code for all files with the exception of the constraint file is written in Verilog. 

By directory:

===================================constrs_1/new===================================

SystemCalc_Con.xdc-- This is a file written to make it possible to use the verilog code with the Digilent/Xilinx FPGA. This specifies
which inputs and outputs will correspond to a pin on the actual FPGA board to validate the design.



===================================sim_1/new===================================

System_Calc_tb.v -- This is a testbench written to test every possible combination of opcode, operand, and results. Values are placed into
the instantiated calculator module, then the clock is run until the result appears, at which point the test bench checks the values at the
output. 

top_CU_tb.v -- This is a testbench written to test the Control unit. As the status signals are asserted to the control unit, and the
clock is changed, the output signals from the control unit are tested. If the control unit reaches an unexpected state, the test bench
stops immediately and prints out an error. 

topdatapath_tb.v -- This is a testbench written to test the datapath. Output signals from the control unit are simulated in the test
bench. The test bench tries to multiply 9x3 and expects a result of 27. This is of course in binary.

===================================sim_1/new===================================

Within the imports directory...
ALU.v -- Taken from Lab 7.

Calc_CU.v -- Taken from Lab 8.

Calc_CU_simple.v --Taken from Lab 7.

DP.v --Taken from Lab 7, provided by Donald Hung.

DivCalc.v -- Taken from Lab 8.

FSMCalc.v -- Taken from Lab 7.

MUX2.v -- Taken from Lab 7, provided by Donald Hung.

RF.v -- Taken from Lab 7, provided by Donald Hung.

b27.v -- Taken from Lab ?, inspired by Donald Hung.

bigmux.v --Taken from Lab 8.

bigshiftdreg.v --Taken from Lab 8.

clk_gen.v -- Taken from Lab 1, provided by Donald Hung.

comparator.v --Taken from Lab 8.

datapath.v --Taken from Lab 8.

debounce2.v --Taken from Lab 4, provided by Donald Hung.

dreg.v --Taken from Lab 8.

led_mux.v -- Taken from Lab 1, provided by Donald Hung.

mux1.v -- Taken from Lab 7.

smallmux.v -- Taken from Lab 8.

smallshiftdreg.v -- Taken from Lab 8.

subtractor.v -- Taken from Lab 8.

ud_counter.v --Taken from Lab 8.

Within the new directory...

4dreg.v -- This is the 4 bit synchronous register which will hold the operands the user desires. 

MUL.v -- This is the combinational multiplier. It is implemented using the Verilog multiply operator "*".

SystemCalc.v -- This is the top file for the module being designed. This combines the control unit and the datapath to implement the
design.

SystemCalc_FPGA.v -- This is the top file for the module, with a focus on making sure it works on an FPGA. This needs the LED mux along
with a debouncer since no button is perfect. 

TopMux.v -- This multiplexer is implemented in the datapath.

top_CU.v -- This is the control unit which decides what signals to provide to the datapath. It waits for status signals from the datapath to perform necessary operations.

topdatapath.v -- This is the datapath which contains instantiations of work from Lab 7 and Lab 8, along with a multiplier.

twodreg.v -- This is the 2 bit synchronous register which will hold the op code the user desires.



