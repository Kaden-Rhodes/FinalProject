`timescale  1ns / 1ps

module tb ();

logic clk;


logic [63:0] shift_seed;
logic muxDisplaySignal;
logic muxGameSignal;
logic floprResetSignal;
logic [63:0] GridOut;

integer handle3;
integer desc3;
byte r0,r1,r2,r3,r4,r5,r6,r7;

Game dut (clk, shift_seed, muxDisplaySignal, muxGameSignal, floprResetSignal, GridOut);

initial 
    begin
    clk =1'b1;
    forever #10 clk = ~clk;
    end

initial
    begin

    #0 floprResetSignal = 1'b0;
    #0 muxGameSignal = 1'b0;
    #0 muxDisplaySignal = 1'b0; 
    #0 shift_seed = 64'h0000000020203E06; 

    #20 muxGameSignal = 1'b1;
    #20 muxGameSignal = 1'b0;
      
    
    end

    initial begin
    //gives output file name
    handle3 = $fopen("game.out");
    //tells when to finish simulation
    #500$finish;
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

      #20 $fdisplay(desc3, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n ====Next Evo Below====", r7,r6,r5,r4,r3,r2,r1,r0);
    end
endmodule