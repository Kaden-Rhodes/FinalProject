module fsm (clk, fsmReset, randSwitch, startSwitch, floprReset, manualSeed, muxStart, showShiftSeed);

   input logic clk;
   input logic randSwitch;
   input logic startSwitch;
   input logic fsmReset;

   output logic floprReset;
   output logic manualSeed;
   output logic muxStart;
   output logic showShiftSeed;

   typedef enum logic [2:0] {S0, S1, S2, S3} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge fsmReset)
     if (fsmReset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
          floprReset <= 1'b1;
          manualSeed <= 1'b1;
          muxStart <= 1'b0;
          showShiftSeed <= 1'b0;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
      end
       S1: begin
          floprReset <= 1'b0;
          manualSeed <= 1'b1;
          muxStart <= 1'b1;
          showShiftSeed <= 1'b0;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
       end
       S2: begin
          floprReset <= 1'b0;
          manualSeed <= 1'b0;
          muxStart <= 1'b0;
          showShiftSeed <= 1'b1;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
       end
       S3: begin
	       floprReset <= 1'b0;
          manualSeed <= 1'b0;
          muxStart <= 1'b1;
          showShiftSeed <= 1'b1;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;  
       end
       
     endcase
   
endmodule
