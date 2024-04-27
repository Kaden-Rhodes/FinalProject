module Game(clk, reset, seed, gridOut);

input logic clk;
input logic reset;
input logic selector;
input logic [63:0] seed;

logic [63:0] dataIn;
logic [63:0] dataOut;

datapath evolve (dadIn, dadaOut);

mux2 #(64) muxximus (gridOut, seed, selector, dataIn);

flop #(64) floppimus (dataOut, gridOut);

endmodule

