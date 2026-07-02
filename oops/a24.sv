virtual class eth_pkt;
rand     bit [47:0]   sa;
rand     int          count;
rand     bit [9:0]    len;

virtual function void print(string name ="eth_pkt");
	$display("-----time = %0t , name = %0s-----",$time,name);
	$display("sa = %0b",sa);
	$display("len = %0d",len);
endfunction
endclass

class eth_good_pkt extends eth_pkt;
static int count_good;
function void print(string name ="eth_good_pkt");
  super.print("eth_good_pkt");
	$display("count_good = %0d",count_good);
endfunction
endclass

module top;

    eth_pkt pkt;
    eth_good_pkt ethpkt;
    initial begin

      ethpkt = new();
      $cast(pkt,ethpkt);
      pkt.print();
    end

endmodule
