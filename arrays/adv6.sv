module tb;
integer intq[$];
integer arr[];
initial begin
for(int i=0;i<10;i++)
intq.push_front($urandom_range(10,30));
arr=intq;
$display("intq=%p",intq);
$display("arr=%p",arr);
$display("%s",(arr==intq)? "EQUAL" : "NOT_EQUAL");
end
endmodule
