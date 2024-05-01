module projectimus (clk,fsmReset, randSwitch, startSwitch, seed, GridOut, shift_seed);

input logic clk;
input logic randSwitch;
input logic startSwitch;

input logic fsmReset;

input logic [63:0] seed;

output logic [63:0] GridOut;


output logic [63:0] shift_seed;

//fsm wires
logic floprReset;
logic manualSeed;
logic muxStart;
logic showShiftSeed;


//lfsr wires

fsm fsmimus (clk, fsmReset, randSwitch, startSwitch, floprReset, manualSeed, muxStart, showShiftSeed);

lfsr64 shiftimus (seed, clk, manualSeed, shift_seed);

Game gamimus (clk,shift_seed,muxStart,floprReset,GridOut);

endmodule