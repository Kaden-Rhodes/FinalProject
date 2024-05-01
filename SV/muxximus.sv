module muxximus (seed, floprGridOut, muxSelector, muxDp); 
  input logic [63:0] seed;
  input logic [63:0] floprGridOut;
  input logic muxSelector;
  output logic [63:0] muxDp;

  assign muxDp[63:0] = muxSelector ? seed[63:0] : floprGridOut[63:0]; 

endmodule