module Game(clk, floprReset, muxSelector, seed, flopGridOut);

input logic clk;
input logic reset;
input logic muxSelector
input logic floprReset;
input logic [255:0] seed;
output logic [255:0] flopGridOut;

logic [255:0] MuxDp;
logic [255:0] dpFlopr;

//flop #(256) floppimus (clk, dataOut, gridOut);

mux2 #(256) muxximus (seed, flopGridOut, muxSel, muxDp);

datapath evolve (muxDp, dpFlopr);

flopr #(256) floppimus (clk, floprReset, dpFlopr, flopGridOut);

endmodule

