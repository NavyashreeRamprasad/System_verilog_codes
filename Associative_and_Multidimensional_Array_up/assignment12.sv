module tb;
integer arr[5:1];//[4:0];
integer arr2[-2:2];//[1:5];
initial begin
for(int i=1;i<6;i++)
arr[i]=$urandom_range(1,30);

//foreach(arr[i])
arr2=arr;

for(int i=1;i<6;i++) begin
$display("arr[%0d]=%0d",i,arr[i]);

end

for(int i=-2;i<3;i++) begin
$display("arr2[%0d]=%0d",i,arr2[i]);
end

end
endmodule
