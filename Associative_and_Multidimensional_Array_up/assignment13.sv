module tb;
int arr[5];
int arr2[8];

initial begin
for(int i=1;i<6;i++)
arr[i]=$urandom_range(1,30);
//copying of arrays of different sizes is not allowed
arr2=arr;

for(int i=0;i<6;i++) begin
$display("arr[%0d]=%0d",i,arr[i]);
end

for(int i=0;i<8;i++) begin
$display("arr2[%0d]=%0d",i,arr2[i]);
end

end
endmodule
