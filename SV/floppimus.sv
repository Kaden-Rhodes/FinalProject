
`timescale 1ns / 1ps
module floppimus (clk, floprReset, dpFlopr, floprGridOut);
  input  logic  clk, floprReset;
  input  logic [63:0] dpFlopr;
  output logic [63:0] floprGridOut;

  always_ff @(posedge clk)
    if (floprReset) floprGridOut[63:0] <=  0;
    else       floprGridOut[63:0] <=  dpFlopr[63:0];
endmodule

