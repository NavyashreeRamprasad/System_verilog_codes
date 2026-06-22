module tb;
bit [1:0] arr[4:0];

initial begin
for(int i=0;i<$size(arr);i++) begin
arr[i]=$random;
end
$display("arr=%p",arr);
end
endmodule
