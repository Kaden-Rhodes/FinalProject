`timescale  1ns / 1ps

module tb ();

logic clk;

logic fsmReset;
logic sw0;
logic sw1;
logic [63:0] seed;
logic [63:0] GridOut;

integer handle3;
integer desc3;
byte r0,r1,r2,r3,r4,r5,r6,r7;

projectimus dut (clk, fsmReset, sw0, sw1, seed, GridOut);

initial 
    begin
    clk =1'b1;
    forever #10 clk = ~clk;
    end

initial
    begin

    #0 fsmReset = 1'b0;
    #0 sw0 = 1'b0;
    #0 sw1 = 1'b0; 
    #0 seed = 64'h 0000000020203E06; 

    #20 sw0 = 1'b1; sw1 = 1'b1;
    #60 sw0 = 1'b0; sw1 = 1'b0;

    #60 sw0 = 1'b0; sw1 = 1'b1;

    #60 sw0 = 1'b0; sw1 = 1'b0;
    
    #60 sw0 = 1'b1; sw1 = 1'b0;
    
    #60 sw0 = 1'b0; sw1 = 1'b0;
      
    
    end

    initial begin
    //gives output file name
    handle3 = $fopen("project.out");
    //tells when to finish simulation
    #1000$finish;
  end

   always
    begin
      desc3 = handle3;
      r0 = GridOut [7:0];
      r1 = GridOut [15:8];
      r2 = GridOut [23:16];
      r3 = GridOut [31:24];
      r4 = GridOut [39:32];
      r5 = GridOut [47:40];
      r6 = GridOut [55:48];
      r7 = GridOut [63:56];

      #20 $fdisplay(desc3, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n ====Next Evo Below==== \n swith 0 = %b \n switch 1 = %b \n starting seed = %h \n", r7,r6,r5,r4,r3,r2,r1,r0,sw0,sw1, seed);
    end
endmodule