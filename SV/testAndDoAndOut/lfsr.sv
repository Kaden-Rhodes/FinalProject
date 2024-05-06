module lfsr(small_seed, clk, manualSeed, shift_small_seed);
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits
input logic [15:0] small_seed;
input logic clk;
input logic manualSeed;
output logic [15:0] shift_small_seed;

always @(posedge clk) begin
    if(manualSeed)
        shift_small_seed = small_seed;
    else
        shift_small_seed = {shift_small_seed[14:0], ~(shift_small_seed[15]^shift_small_seed[14]^shift_small_seed[12]^shift_small_seed[3])};
end
//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64 (seed, clk, lfsrSignal, shift_seed);
//inputs and outputs for the full seed size (64 bits)
input logic [63:0] seed;
input logic clk;
input logic lfsrSignal;
output logic [63:0] shift_seed;

always @(posedge clk) begin
    if(lfsrSignal)
        shift_seed = seed;
    else
    shift_seed = {shift_seed[62:0], ~(shift_seed[63]^shift_seed[62]^shift_seed[60]^shift_seed[59])};
end
//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version
endmodule
