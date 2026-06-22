class test;

  rand int num;
	int arrq[$];

  constraint c_size {
	!(num inside {arrq});
  }

//constraint c_unique {
//  foreach(num[i])
//    foreach(num[j])
//      if(i < j)
//        num[i] != num[j];
//}

function void post_randomize();
arrq.push_front(num);
endfunction

endclass

module tb;
test t1 = new();
initial begin
repeat(10) begin 
assert(t1.randomize()) begin
//$display("succesful randomization");
$display("num = %p",t1.num);
end
end

end
endmodule
