module tb;
integer arr[];
integer arrq[$];
initial begin
arr=new[10];
for(int i=0;i<10;i++) begin
arr[i]=$urandom_range(10,40);
end
$display("arr=%p",arr);

foreach(arr[i]) begin
arrq.push_front(arr[i]);
end
//$display("arrq=%p",arrq);
arr=arrq;
$display("reversed array");
$display("arr=%p",arr);
end
endmodule
