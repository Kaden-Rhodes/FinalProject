module fsm (clk, fsmReset, sw0, sw1, floprResetSignal, lfsrSignal, muxGameSignal, muxDisplaySignal);

   input logic clk;
   input logic sw0;
   input logic sw1;
   input logic fsmReset;

   output logic floprResetSignal;
   output logic lfsrSignal;
   output logic muxGameSignal;
   output logic muxDisplaySignal;

   typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge fsmReset)
     if (fsmReset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
          floprResetSignal <= 1'b0;  //0100
          lfsrSignal <= 1'b1;
          muxGameSignal <= 1'b0;
          muxDisplaySignal <= 1'b0;	  
          
          if (sw0 && sw1) nextstate <= S3;
          else if(sw1) nextstate <= S1;
          else if(sw0) nextstate <=S2;
          else nextstate <=S0;
      end
       S1: begin
          floprResetSignal <= 1'b0;
          lfsrSignal <= 1'b0;
          muxGameSignal <= 1'b0;
          muxDisplaySignal <= 1'b0;	  
          
          if (sw0 && sw1) nextstate <= S3;
          else if(sw1) nextstate <= S1;
          else if(sw0) nextstate <=S2;
          else nextstate <=S0;
       end
       S2: begin
          floprResetSignal <= 1'b0;
          lfsrSignal <= 1'b1;
          muxGameSignal <= 1'b1;
          muxDisplaySignal <= 1'b1;	  
          
          if (sw0 && sw1) nextstate <= S3;
          else if(sw1) nextstate <= S1;
          else if(sw0) nextstate <=S2;
          else nextstate <=S0;
       end
       S3: begin
	       floprResetSignal <= 1'b0;
          lfsrSignal <= 1'b0;
          muxGameSignal <= 1'b1;
          muxDisplaySignal <= 1'b1;	  
          
          if (sw0 && sw1) nextstate <= S3;
          else if(sw1) nextstate <= S1;
          else if(sw0) nextstate <=S2;
          else nextstate <=S0;  
       end
       
     endcase
   
endmodule
