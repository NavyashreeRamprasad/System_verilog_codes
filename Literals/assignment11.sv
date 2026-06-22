module tb;
integer a,b;

initial begin
repeat(10) begin
a=$urandom_range(10,20);
b=$urandom_range(10,20);
#1;
/*if(a==b) 
$display("a=%d , b=%d ,a is equal to b",a,b);
else
$display("a=%d , b=%d ,a is not equal to b",a,b);
*/
assert(a == b)
      $display("PASS : a=%0d b=%0d",a,b);
else
      $error("FAIL : a=%0d b=%0d",a,b);

end

end

endmodule
