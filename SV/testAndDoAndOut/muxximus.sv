module muxximus (seed, floprGridOut, muxSelector, muxOut); 
  input logic [63:0] seed;
  input logic [63:0] floprGridOut;
  input logic muxSelector;
  output logic [63:0] muxOut;

  assign muxOut[63:0] = muxSelector ? seed[63:0] : floprGridOut[63:0]; 

endmodule