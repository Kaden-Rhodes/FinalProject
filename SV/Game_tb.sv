`timescale  1ns/1ps

module tb();

logic clk;
logic reset;
logic [63:0] gridOut;
logic [63:0] seed;
logic sel;

Game gamimus (clk, reset, seed, gridOut);

initial begin
    clk =1'b1;
    forever #10 clk = ~clk;
end

initial
begin

#0 reset = 1'b1;
#0 sel = 1'b0; 
#0 seed = 64'h0006760004646400;

#22 reset = 1'b0;
#71 sel =1'b1;

end
endmodule