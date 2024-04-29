
`timescale 1ns / 1ps
module floppimus (clk, floprReset, dpFlopr, floprGridOut);
  input  logic  clk, floprReset;
  input  logic [255:0] dpFlopr;
  output logic [255:0] floprGridOut;

  always_ff @(posedge clk)
    if (floprReset) floprGridOut[255:0] <= #1 0;
    else       floprGridOut[255:0] <= #1 dpFlopr[255:0];
endmodule

