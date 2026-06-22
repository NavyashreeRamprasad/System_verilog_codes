/*module tb;
initial begin
fork :high_fork
	#4 $display("%0t process 0",$time);
	#2 $display("%0t process 1",$time);	
	fork :low_fork
		#2 $display("%0t process 2",$time);
		#6 $display("%0t process 3",$time);
	join
	disable low_fork;
join_none
#3 disable high_fork;
end
endmodule*/

module tb;

  initial begin
    $display("[Time: %0t] === Parent Thread Starts ===", $time);//0
    fork : HIGH_FORK
      
      begin
        $display("[Time: %0t] [HIGH_FORK - Thread A] Started...", $time);//0
        #100;
        $display("[Time: %0t] [HIGH_FORK - Thread A] Finished safely.", $time);//100
      end

      begin
        $display("[Time: %0t] [HIGH_FORK - Thread B] Started...", $time);//0
        #10;      
		fork : LOW_FORK
          begin
            $display("[Time: %0t]   [LOW_FORK - Proc 1] Running...", $time);//10
            #30;
            $display("[Time: %0t]   [LOW_FORK - Proc 1] Done.", $time);//40
          end

          begin
            $display("[Time: %0t]   [LOW_FORK - Proc 2] Running...", $time);//10
            #15;
            $display("[Time: %0t]   [LOW_FORK - Proc 2] Finished first! Disabling LOW_FORK...", $time);//25
            
            disable fork; 
          end
        join_any//25
        $display("[Time: %0t] [HIGH_FORK - Thread B] Emerged from LOW_FORK block.", $time);//25
        
        #10;
        $display("[Time: %0t] [HIGH_FORK - Thread B] Decided to terminate HIGH_FORK via explicit Label...", $time);//50
        disable HIGH_FORK; //35
      end

    join

    $display("[Time: %0t] === Parent Thread Safely Resumed After Cleanups ===", $time);//35
    #50;
    $display("[Time: %0t] Simulation finished.", $time);//85
  end

endmodule
