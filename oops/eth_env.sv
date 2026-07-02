class eth_env;
    eth_bfm bfm;
    eth_gen gen;
    mailbox gen2bfm; 
    string testname;


    function new(string testname);
     gen2bfm = new();
     this.testname = testname;
    endfunction

    task run();
      bfm = new(gen2bfm);
      gen = new(gen2bfm,testname);
      fork 
      bfm.run();
      gen.run();
      join
    endtask

endclass
