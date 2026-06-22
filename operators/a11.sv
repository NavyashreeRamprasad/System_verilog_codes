module tb;
int a[4]='{1,2,3,4};
int b[$];
int c[9];

initial begin
//for(int i=0;i<11;i++)
//a[i]=$urandom_range(10,30);
for(int i=0;i<5;i++)
	b[i]=$urandom_range(10,30);

$display("a= %p",a);
$display("b= %p",b);
c={a,b};// Illegal: concatenation between fixed-size array and queue
$display("c= %p",c);
end
endmodule
