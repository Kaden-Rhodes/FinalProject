module projectimus (clk, randSwitch, startSwitch, seed, floprGridOut);

input logic clk;
input logic randSwitch;
input logic startSwitch;

input logic [63:0] seed;

output logic [63:0] floprGridOut;

//fsm wires
logic floprReset;
logic manualSeed;
logic muxStart;
logic showShiftSeed;

//lfsr wires
logic [63:0] shift_seed;


fsm fsmimus (clk, randSwitch, startSwitch, floprReset, manualSeed, muxStart, showShiftSeed);

lfsr64 shiftimus (seed, clk, manualSeed, shift_seed);

Game gamimus (clk,shift_seed,muxStart,floprReset,floprGridOut);

endmodule