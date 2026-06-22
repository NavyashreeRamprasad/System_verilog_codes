module tb;
byte arr[];
initial begin
arr=new[10];
for(int i=0;i<$size(arr);i++)begin
arr[i]=i;
end
arr=new[20](arr);
$display("arr=%p",arr);
end
endmodule
