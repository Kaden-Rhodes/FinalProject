module muxximus (seed, floprGridOut, muxSelector, muxDp); 
  input logic [255:0] seed;
  input logic [255:0] floprGridOut;
  input logic muxSelector;
  output logic [255:0] muxDp;

  assign muxDp[255:0] = muxSelector ? seed[255:0] : floprGridOut[255:0]; 

endmodule