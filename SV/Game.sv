module Game(clk, reset, selector, seed, gridOut);

input logic clk;
input logic reset;
input logic selector;
input logic [63:0] seed;
output logic [63:0] gridOut;

logic [63:0] dataIn;
logic [63:0] dataOut;

datapath evolve (dataIn, dataOut);

mux2 #(64) muxximus (gridOut, seed, selector, dataIn);

flop #(64) floppimus (clk, dataOut, gridOut);

endmodule

