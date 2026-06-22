class test;
rand int num[10];

  constraint c1{
	foreach(num[i]){
		num[i] == (i/2)%10;
		}};
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
