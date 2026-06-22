module tb;
int arr[];
int arr1[*];
initial begin
arr=new[10];
for(int i=0;i<$size(arr);i++)
	arr[i]=$urandom_range(30,40);
$display("arr= %p",arr);
arr=new[20](arr);
for(int i=10;i<$size(arr);i++)
	arr[i]=$urandom_range(10,20);
$display("arr= %p",arr);
arr.delete(1);
$display("arr= %p",arr);


for(int i=0;i<5;i++)
	arr1[i]=$urandom_range(20,80);
$display("arr1= %p",arr1);
arr1.delete(2);
$display("arr= %p",arr1);

end

endmodule
