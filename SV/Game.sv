`timescale 1ns / 1ps
module Game(clk,seed,muxSelector,floprReset,floprGridOut);

input logic clk;

input logic [255:0] seed;

input logic muxSelector;
input logic floprReset;

output logic [255:0] floprGridOut;

logic [255:0] muxDp;
logic [255:0] dpFlopr;

muxximus muxximus (seed, floprGridOut, muxSelector, muxDp);

datapath evolve (muxDp, dpFlopr);

floppimus floppimus (clk, floprReset, dpFlopr, floprGridOut);

endmodule

