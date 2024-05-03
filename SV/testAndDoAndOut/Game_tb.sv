`timescale  1ns / 1ps

module tb ();

logic clk;


logic [63:0] seed;
logic muxSelector;
logic floprReset;
logic [63:0] flopGridOut;


Game dut (clk, seed, muxSelector, floprReset, flopGridOut);

initial 
    begin
    clk =1'b1;
    forever #10 clk = ~clk;
    end

initial
    begin

    #0 floprReset = 1'b0;
    #0 muxSelector = 1'b1; 
    #0 seed = 64'h0000700000000000; 

    #50 muxSelector = 1'b0;
      
    
    end
endmodule