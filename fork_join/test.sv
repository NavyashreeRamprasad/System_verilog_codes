/*module tb;
initial begin
fork
    begin
        // session process
        #30; $display("%0t Session done", $time);
        disable fork;  // once session is done, kill req and ack
    end
    begin
        // req process  
        #15; $display("%0t Req done", $time);
        disable fork;  // once req is done, kill session and ack
    end
    begin
        // ack process
        #50; $display("%0t Ack done", $time);
        disable fork;  // once ack is done, kill session and req
    end
join
$display("%0t join done",$time);
end
endmodule*/

module tb;

  int e1 = 0;

  initial begin
    fork
      begin
        #10;
        $display("[%0t] first block", $time);
        e1++;
      end

      begin
        #50;
        $display("[%0t] second block", $time);
        e1++;
      end

      begin
        while(e1 == 0)
        #1;  

        $display("[%0t] Equivalent of join_any", $time);
      end

    join
$display("[%0t] out of join_any", $time);

  end

endmodule
