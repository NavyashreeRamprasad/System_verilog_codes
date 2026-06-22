module tb;
int arr[];
int arr1[];

initial begin
arr=new[5];
arr1=new[5];

foreach(arr[i]) begin
arr[i]=$urandom_range(50,100);
$display("arr[%0d]=%0d",i,arr[i]);
end
foreach(arr1[i]) begin
arr1[i]=$urandom_range(10,20);
$display("arr1[%0d]=%0d",i,arr[i]);
end

for(int i=0;i<$size(arr);i++) begin
arr1[i]=arr[i];
end

for(int i=0;i<$size(arr);i++) begin
if(arr[i]==arr1[i])
$display("arr[%0d]=%0d , arr1[%0d]=%0d ,equal",i,arr[i],i,arr1[i]);
else
$display("arr[%0d]=%0d , arr1[%0d]=%0d ,not equal",i,arr[i],i,arr1[i]);
end

arr=new[10](arr);

//foreach(arr[i]) begin
//if(arr[i]==arr1[i])
//$display("arr[%0d]=%0d , arr1[%0d]=%0d ,equal",i,arr[i],i,arr1[i]);
//$display("arr[%0d]=%0d , arr1[%0d]=%0d ,not equal",i,arr[i],i,arr1[i]);
//end

$display("arr= %p",arr);

//for(int i=0;i<$size(arr);i++) begin
//$display("arr[%0d]=%0d",i,arr[i]);
//end

end
endmodule
