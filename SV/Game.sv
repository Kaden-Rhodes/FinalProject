module Game(clk,shift_seed,showShiftSeed,muxStart,floprReset,GridOut);

input logic clk;

input logic [63:0] shift_seed;

input logic showShiftSeed;
input logic muxStart;
input logic floprReset;

output logic [63:0] GridOut;

logic [63:0] muxDp;
logic [63:0] dpFlopr;
logic [63:0] floprGridOut;


muxximus muxximus1 (shift_seed, floprGridOut, muxStart, muxDp);

datapath evolvimus (muxDp, dpFlopr);

floppimus floppimus (clk, floprReset, dpFlopr, floprGridOut);

muxximus muxximus2 (floprGridOut, shift_seed, showShiftSeed, GridOut);

endmodule

