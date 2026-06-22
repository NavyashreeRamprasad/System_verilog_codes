/*module tb;

  // Emulating the interface signals locally
  logic clk;
  logic REQ;
  logic ACK;

  // Free-running clock generator for timing reference
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    REQ = 0;
    ACK = 0;

    // Wait a couple of cycles to start cleanly
    repeat(2) @(posedge clk);

    $display("[Time: %0t] Main Thread: Asserting REQ...", $time);
    REQ <= 1'b1;

    // Named fork block to allow self-termination
    fork : handshake_block
      
      // Thread 1: The Handshake Process
      begin
        @(posedge ACK);
        $display("[Time: %0t] Thread 1: ACK received successfully!", $time);
        disable handshake_block; // Kills Thread 2 and Thread 3, exits join
      end

      // Thread 2: The Timeout Watchdog Process
      begin
        #500; // Timeout threshold
        $display("[Time: %0t] Thread 2: Watchdog Error! ACK timed out.", $time);
        disable handshake_block; // Kills Thread 1 and Thread 3, exits join
      end

      // Thread 3: DUT Simulation Behavior
      // Change #150 to #600 to test how the Thread 2 Watchdog triggers!
      begin
        #600; 
        $display("[Time: %0t] Thread 3 (DUT): Asserting ACK now.", $time);
        ACK <= 1'b1;
      end

    join

    // Parent thread resumes here immediately after 'disable handshake_block'
    REQ <= 1'b0;
    ACK <= 1'b0;
    $display("[Time: %0t] Main Thread: Handshake resolved, REQ dropped.", $time);

    // End simulation safely
    #20;
    $display("[Time: %0t] Simulation finished safely.", $time);
    $finish;
  end

endmodule*/

module tb;
	initial begin
		 bit req;
		 bit ack;

		 //Used User Input for request

		 if(!$value$plusargs("req=%0d",req))
			  $display("FAILED TO GET THE VALUE FROM THE USER");
		 else begin
			  if(req == 1) begin
				   fork
					  begin : AC
						   #1;
						   ack = 1;
						   $display("Request has received and Acknowledged!");
					  end

					  begin : N_AC
						   #1;
						   ack = 0;
						   $display("Request has received but not acknowledged!");
					  end

					  disable N_AC;
				   join
			  end
			  
			  else $display("Request has not yet received!");
		 end
	end
endmodule
