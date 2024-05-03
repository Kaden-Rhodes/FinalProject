module projectimus (clk, fsmReset, sw0, sw1, seed, GridOut);

input logic clk;
input logic fsmReset;
input logic sw0;
input logic sw1;
input logic [63:0] seed;
output logic [63:0] GridOut;


logic floprResetSignal;
logic lfsrSignal;
logic muxGameSignal;
logic muxDisplaySignal;

logic shift_seed;


//lfsr wires

fsm fsmimus (clk, fsmReset, sw0, sw1, floprResetSignal, lfsrSignal, muxGameSignal, muxDisplaySignal);

lfsr64 shiftimus (seed, clk, lfsrSignal, shift_seed);

Game gamimus (clk,shift_seed,muxDisplaySignal,muxGameSignal,floprResetSignal,GridOut);

endmodule