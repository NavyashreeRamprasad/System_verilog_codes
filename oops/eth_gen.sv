class eth_gen;
eth_pkt pkt;
mailbox gen2bfm;
string testname;

function new(mailbox get_gen2bfm,string testname);
  this.gen2bfm = get_gen2bfm;
  this.testname = testname;
endfunction 

task run();
repeat(10) begin
case(testname) 
"test_all_rand_pkts": begin
                int sel = $urandom_range(0,2);
                case(sel)
                  0: begin
											eth_good_pkt gpkt = new();
											gpkt.count_good++;
											gpkt.randomize();
											pkt = gpkt;
											end
									1: begin
												eth_bad_pkt bpkt = new();
												bpkt.count_bad++;
												bpkt.randomize();
												pkt = bpkt;
								    	end

									2: begin
												eth_ill_pkt ipkt = new();
												ipkt.count_ill++;
												ipkt.randomize();
												pkt = ipkt;
									    end
							   endcase
                 gen2bfm.put(pkt);
				         end
"test_all_good_pkts":begin
                     	eth_good_pkt gpkt;
                      gpkt = new();
                      //$display("inside case statement");
											gpkt.count_good++;
											gpkt.randomize();
											pkt = gpkt;
                      gen2bfm.put(pkt);
                     end
"test_all_bad_pkts":begin
												eth_bad_pkt bpkt;
                        bpkt= new();
												bpkt.count_bad++;
												bpkt.randomize();
												pkt = bpkt;                   
                        gen2bfm.put(pkt);
                     end
"test_all_ill_pkts":begin
												eth_ill_pkt ipkt;
                        ipkt= new();
												ipkt.count_ill++;
												ipkt.randomize();
												pkt = ipkt;                   
                        gen2bfm.put(pkt);
                     end
default : begin
            $display("no testcase matched");
          end


              endcase
              end
      endtask

endclass

