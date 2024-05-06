`timescale  1ns / 1ps

module tb ();

logic clk;

logic fsmReset;
logic sw0;
logic sw1;
logic floprResetSignal;
logic lfsrSignal;
logic muxGameSignal;
logic muxDisplaySignal;

logic [63:0] seed;
logic [63:0] GridOut;

integer handle3;
integer desc3;
byte r0,r1,r2,r3,r4,r5,r6,r7;

fsm dut (clk, fsmReset, sw0, sw1, floprResetSignal, lfsrSignal, muxGameSignal, muxDisplaySignal);

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

    #20 sw0 = 1'b1; sw1 = 1'b1;
    #60 sw0 = 1'b0; sw1 = 1'b0;

    #60 sw0 = 1'b0; sw1 = 1'b1;

    #60 sw0 = 1'b0; sw1 = 1'b0;
    
    #60 sw0 = 1'b1; sw1 = 1'b0;
    
    #60 sw0 = 1'b0; sw1 = 1'b0;
      
    
    end

    initial begin
    //gives output file name
    handle3 = $fopen("fsm.out");
    //tells when to finish simulation
    #1000$finish;
  end

   always
    begin
      desc3 = handle3;
    

      #20 $fdisplay(desc3, "clk = %b\n sw0 = %b\n sw1 = %b\n floprResetSignal = %b\n lfsrSignal = %b\n  muxGameSignal = %b\n muxDisplaySignal = %b\n",clk,sw0,sw1,floprResetSignal, lfsrSignal, muxGameSignal, muxDisplaySignal);
    end
endmodule