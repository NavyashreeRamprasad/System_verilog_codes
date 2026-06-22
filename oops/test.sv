class test;
rand int num[10];
  constraint c1{
	foreach(num[i]){
		if(i<5)
			num[i] == i+1;
		if(i>4)
			num[i] == 10-i;}

  };


endclass

module tb;
test t1 = new();
initial begin

assert(t1.randomize()) begin
$display("succesful randomization");
$display("num = %p",t1.num);
end

end
endmodule
