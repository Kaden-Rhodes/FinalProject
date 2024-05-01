module Game(clk,shift_seed,muxStart,floprReset,floprGridOut);

input logic clk;

input logic [63:0] shift_seed;

input logic muxStart;
input logic floprReset;

output logic [63:0] floprGridOut;

logic [63:0] muxDp;
logic [63:0] dpFlopr;


muxximus muxximus (shift_seed, floprGridOut, muxStart, muxDp);

datapath evolvimus (muxDp, dpFlopr);

floppimus floppimus (clk, floprReset, dpFlopr, floprGridOut);

endmodule

