// testbench to prove maximal LFSR
module tb ();

   //logic variables to route input and output to DUT
    logic[15:0] small_seed;
    logic clk;
    logic lfsrReset;
    logic[15:0] shift_small_seed;

  
  //create file handles to write results to a file
  integer handle3;
   integer desc3;

   // instantiate device under test (small LFSR)
   lfsr dut (small_seed, clk, lfsrReset,shift_small_seed);


   //set up a clock signal
   always     
     begin
	   clk = 1; 
     #10; 
     clk = 0; 
     #10;
     end

      initial
    begin
    
    #0 small_seed = 16'h0001; 
    #0 lfsrReset = 1'b0;
    #30 lfsrReset = 1'b1;
    #30 lfsrReset = 1'b0;
    
    

      
    
    end
   
	//set up output file
  initial begin
    //gives output file name
    handle3 = $fopen("lfsr.out");
    //tells when to finish simulation
    #500 $finish;
  end

  always
    begin
      desc3 = handle3;
      #20 $fdisplay(desc3, "%b || %b", lfsrReset, shift_small_seed);
    end

	//set up any book keeping variables you may want to use
	//set up a starting seed.  What happens with all 0s?


	//reset your DUT
	// lfsr dut (small_seed,clk,reset,shift_small_seed);
  
  //save the initial output of your DUT to compare with current output
	//and see whenb you repeat
     

   always @(posedge clk)
     begin
		//output your results to a file
     end

   // check results on falling edge of clk
   always @(negedge clk) begin
		if(~lfsrReset) begin
		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that
		end
	end

 
   
endmodule // tb

