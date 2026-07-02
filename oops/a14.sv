class eth_pkt2;
	int eth_count =2;
endclass

class eth_pkt;
eth_pkt2 ep= new();
randc     bit [7:0]   sof;
static    int         count=0;
rand 	    bit [47:0]  da;
rand      bit [15:0]  len;
rand	    int         len_cons;
rand      byte        payload[];
	        bit [31:0]  crc;
		      string      testname;
constraint c2{
len_cons inside {[10:20]};
};

constraint c1{
		payload.size() inside {[40:50], [0:19]}; 
		}
extern function new(string testname);
extern function void pre_randomize();
extern function void print(string name ="eth_pkt");
extern function bit [31:0] calculate_crc32();
extern function eth_pkt copy(/*output eth_pkt pkt2*/);
extern function void post_randomize();
extern function bit compare(eth_pkt pkt2);
extern function void pack(input eth_pkt pkt2 , output bit [7:0] queue[$]);
extern function void unpack(input bit [7:0] queue[$], output eth_pkt pkt2);


endclass

function eth_pkt::new(string testname);
count++;
this.testname = testname;
endfunction

function void eth_pkt:: pre_randomize();
	$display("This is pre randomization");
	if(testname=="test_len_rand_disabled")
    	len.rand_mode(0);
	else
    	len.rand_mode(1);

	if(testname=="test_c2_constraint_disabled")
    	c2.constraint_mode(0);
	else
    	c2.constraint_mode(1);
	
	if(testname=="test_sof_rand_disabled")
    	sof.rand_mode(0);
    else
    	sof.rand_mode(1);
endfunction


 function void eth_pkt:: print(string name ="eth_pkt");

	$display("-----time = %0t , name = %0s-----",$time,name);
	$display("eth_count = %0d",ep.eth_count);
	$display("sof = %0h",sof);
	$display("da = %0o",da);
	$display("len = %0d",len);
	$display("payload_size = %0d",$size(payload));	
	$display("payload = %p",payload);
	$display("crc = %b",crc);
	$display("len_cons = %0d", len_cons);
	$display("count = %0d",eth_pkt::count);

endfunction

function bit [31:0] eth_pkt::calculate_crc32();
  bit [31:0] crc;
  crc = 32'hFFFFFFFF;
  foreach(payload[i]) begin
    crc ^= payload[i];
    repeat(8) begin
      if(crc[0])
        crc = (crc >> 1) ^ 32'hEDB88320;
      else
        crc = crc >> 1;
    end
  end
  return ~crc;
endfunction

function eth_pkt eth_pkt::copy(/*output eth_pkt pkt2*/);
eth_pkt pkt2=new(this.testname);
pkt2.ep = new();
pkt2.sof = this.sof;
pkt2.da = this.da;
pkt2.len = this.len;
pkt2.len_cons = this.len_cons;
pkt2.payload = this.payload;
pkt2.crc = this.crc;
pkt2.testname = this.testname;
pkt2.ep.eth_count = this.ep.eth_count;
return pkt2;
endfunction

function void eth_pkt::post_randomize();
crc = calculate_crc32();
$display("This is post randomization");

//len = 6;
endfunction

function bit eth_pkt::compare(eth_pkt pkt2);
if(pkt2.sof == this.sof && pkt2.da == this.da && pkt2.len == this.len && pkt2.len_cons == this.len_cons && pkt2.crc == this.crc && pkt2.ep.eth_count == this.ep.eth_count)
compare = 1;
else
compare = 0;
endfunction

function void eth_pkt::pack(input eth_pkt pkt2 , output bit [7:0] queue[$]);
	queue = {>>byte{ pkt2.sof,pkt2.da, pkt2.len ,pkt2.len_cons , pkt2.crc }};
endfunction

function void eth_pkt::unpack(input bit [7:0] queue[$], output eth_pkt pkt2);
pkt2= new("unpacked_pkt");
	{>>byte{ pkt2.sof,pkt2.da, pkt2.len ,pkt2.len_cons , pkt2.crc }} = queue;
	endfunction





module top;
bit [7:0] queue[$];
string testname;
eth_pkt pkt;
eth_pkt pkt2;
initial begin
if(!$value$plusargs("testname=%s", testname))
  testname = "default";
pkt = new(testname);
assert (pkt.randomize());
pkt.print("pkt");

//copy by handle
////$display("copy by handle");
////pkt2 =pkt;
////pkt2.len = 16;
////pkt2.print("pkt2");
////pkt.print("pkt");

//shallow copy
////$display("shallow copy");
////pkt2 = new pkt;
////pkt2.print("pkt2");
////pkt2.len = 16;
////pkt2.ep.eth_count = 32;
////pkt2.print("pkt2");
////pkt.print("pkt");

//deep copy
//	$display("deep copy");
//pkt.copy(pkt2);
////pkt2 = pkt.copy();
////pkt2.print("pkt2");
////pkt2.len = 16;
////pkt2.ep.eth_count = 32;
////pkt2.print("pkt2");
////pkt.print("pkt");

//compare
//if(pkt==pkt2)// doesnt work
//$display("pkt = pkt2");
pkt.pack(pkt,queue);
$display("%p",queue);


pkt.unpack(queue,pkt2);
pkt2.print("unpacked_pkt2");

if(pkt.compare(pkt2))
	$display("pkt = pt2 they are equal");
else
	$display("pkt != pt2 they are not equal");
end
endmodule
