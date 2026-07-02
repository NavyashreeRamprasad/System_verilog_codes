class eth_bfm;
    eth_pkt pkt;
    eth_good_pkt gpkt = new();
    eth_bad_pkt bpkt = new();
    eth_ill_pkt ipkt =new();
    mailbox gen2bfm; 
    function new(mailbox get_gen2bfm);
      this.gen2bfm = get_gen2bfm;
    endfunction

    task run();
        forever begin
          gen2bfm.get(pkt);
           pkt.print();
         end
               //bpkt.print();
        //ipkt.print();
    endtask

endclass
