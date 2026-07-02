class eth_pkt;

randc     bit [7:0]   sof;
          int         count=10;
rand      bit [15:0]  len;

constraint payload_c{
                    len inside {[20:40]};
                    }

function void print(string name ="eth_pkt");

	$display("-----time = %0t , name = %0s-----",$time,name);
	$display("sof = %0h",sof);
	$display("len = %0d",len);
	$display("count = %0d",count);
endfunction

endclass

class eth_good_pkt extends eth_pkt;
int count_good;
string count ="hello";

constraint payload_c{
                    len inside {[60:80]};
                    }

function void print(string name ="eth_good_pkt");

  super.print(name);
	$display("this.count = %0s",this.count);
	$display("super.count = %0d",super.count);
	$display("count_good = %0d",count_good);
endfunction

endclass


module tb;
eth_pkt      pkt  = new();
eth_good_pkt gpkt = new();

initial 
begin
pkt.randomize();
pkt.print("pkt");
gpkt.randomize();
gpkt.print("gpkt");
end
endmodule
