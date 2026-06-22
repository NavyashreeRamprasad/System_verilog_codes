module tb;
int intQ[$];
int arr[]='{1,2,3,4,5,6,7};

initial begin
intQ=arr;
$display("arr=%p",arr);
$display("intQ=%p",intQ);
end
endmodule
