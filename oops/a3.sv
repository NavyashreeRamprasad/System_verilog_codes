class eth_pkt;
randc bit [2:0] sof;
static int count=0;
protected rand bit [47:0] da;
rand bit [15:0] len;
	int len_cons;
rand byte payload[];//Ethernet packets have variable lengths. A static array has a fixed size, meaning you couldn't easily simulate packets of different sizes (e.g., 64 bytes vs. 1500 bytes) without wasting memory or hitting a hard limit.
	 bit [31:0] crc;//CRC (Cyclic Redundancy Check) is a calculated value used for error detection. It must match the data in the packet to be considered valid. If it were randomized, the packet would likely be flagged as "corrupt" by the receiver.


constraint c2{
len_cons inside {[10:20]};
//len inside {[0:9]};
};

function new(int count_val = 11, int len_val = 12);
count++;
sof= 4;
count= count_val;
da=54;
len=len_val;
payload= '{20{21}};
endfunction

constraint c1{
		payload.size() inside {[40:50], [0:19]}; 
		}


virtual function void print(string name ="eth_pkt");

	$display("-----name = %0s-----",name);
	$display("sof = %0d",sof);
	$display("da = %b",da);
	$display("len = %0d",len);
	$display("payload_size = %0d",$size(payload));	
	$display("payload = %p",payload);
	$display("crc = %b",crc);
	$display("count = %0d",eth_pkt::count);

endfunction

function void post_randomize();
crc = 16'h1234;
endfunction

endclass

class eth_new_pkt extends eth_pkt;

function void print(string name ="eth_new_pkt");

	$display("-----name = %0s-----",name);
	$display("da = %b",da);
	$display("sof = %0d",sof);
	$display("len = %0d",len);
	$display("payload_size = %0d",$size(payload));	
	$displayh("payload = %p",payload);
	$display("crc = %b",crc);
	$display("count = %0d",eth_pkt::count);

endfunction

endclass

module top;
eth_pkt pkt = new(30);
//eth_pkt pkt1 = new();
//eth_pkt pkt2 = new();
//eth_new_pkt new_pkt = new();
initial begin
//assert(pkt.randomize())
//$display("succesful randomization");
//assert(pkt1.randomize())
//$display("succesful randomization of pkt1");
//assert(pkt2.randomize())
//$display("succesful randomization of pkt2");

//repeat(10) begin
//    assert(pkt.randomize());
//    pkt.print();
//  end

//pkt.count = 10;
//pkt.len = 100;
//$display("len = %0d",pkt.len);
//$display("pkt print");
pkt.print();
//$display("pkt1 print");
//pkt1.print();
//$display("pkt2 print");
//pkt2.print();

//assert(new_pkt.randomize())
//$display("succesful randomization");
//pkt = new_pkt;
//$display("function overridden");
//pkt.print();
//$display("pkt_new print");
//new_pkt.print();
//$display("da = %b",pkt.da);
//$display("len = %b",pkt.len);// these cause scope errors

////else
////$error("randomization failed");
//$display("da = %b",pkt.da);
//$display("len = %b",pkt.len);
//$displayh("payload = %p",pkt.payload);
//$display("crc = %b",pkt.crc);
//$display("count = %0d",eth_pkt::count);
end
endmodule

//Code duplication: Must rewrite identical print logic every time a packet needs displaying.
//Breaks encapsulation: Forces the top module to access class-internal properties directly.
//Messy format: Large dynamic arrays print as long, unreadable single lines ('{...}).
//Zero filtering: Cannot easily mute, filter, or turn off messages based on severity.
//High maintenance: Adding or modifying class fields requires updating every manual print statement.
//Simulation overhead: Heavy text output unconditionally slows down runtime performance.
