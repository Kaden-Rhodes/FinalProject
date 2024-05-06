module Game(clk,shift_seed,muxDisplaySignal,muxGameSignal,floprResetSignal,GridOut);


input logic clk;
input logic [63:0] shift_seed;
input logic muxDisplaySignal;
input logic muxGameSignal;
input logic floprResetSignal;

output logic [63:0] GridOut;

logic [63:0] muxDp;
logic [63:0] dpFlopr;
logic [63:0] floprGridOut;


muxximus muxximus1 (shift_seed, floprGridOut, muxGameSignal, muxDp);

datapath evolvimus (muxDp, dpFlopr);

floppimus floppimus (clk, floprResetSignal, dpFlopr, floprGridOut);

muxximus muxximus2 (shift_seed, floprGridOut, muxDisplaySignal, GridOut);

endmodule

