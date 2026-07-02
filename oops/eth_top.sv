module top;

    eth_env env;
    string testname;
    initial begin
      if($value$plusargs("%0s",testname))
          $display("testname received from user = %0s",testname);
      else
         $display("no testname provided by user");

      env = new(testname);
      env.run();
      #1000 $finish();
    end

endmodule
