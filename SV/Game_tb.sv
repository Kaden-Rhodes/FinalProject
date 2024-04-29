`timescale  1ns / 1ps

module tb ();

logic clk;
logic reset;
logic [255:0] flopGridOut;
logic [255:0] seed;
logic muxSelector;

Game dut (clk, reset, sel, seed, gridOut);

initial 
    begin
    clk =1'b1;
    forever #10 clk = ~clk;
    end

initial
    begin

    #0 reset = 1'b1;
    #0 sel = 1'b0; 
    #0 seed = 256'h0006760004646400000000000000000000000000000000000000000000000000; 

    #22 reset = 1'b0;
    #71 sel =1'b1;

    end
endmodule