class eth_pkt;
rand     bit [47:0]   sa;
rand     bit [9:0]    len;

virtual function void print(string name ="eth_pkt");
	$display("-----time = %0t , name = %0s-----",$time,name);
	$display("sa = %0b",sa);
	$display("len = %0d",len);
endfunction

class m_pkt;
static int count=10;
enum {s1,s2,s3}e1;
endclass

endclass


module top;

    eth_pkt pkt;
    initial begin

      pkt = new();
      pkt.randomize();
     pkt.print();
      $display("count = %0d",eth_pkt::m_pkt::count);
      $display("s1 = %0d",eth_pkt::m_pkt::s3);
    end


endmodule
